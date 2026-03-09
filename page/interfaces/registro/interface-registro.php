<?php include __DIR__ . '/components/header.php' ?>
<?php include __DIR__ . '/components/registro.php' ?>
<?php include __DIR__ . '/components/forms.php' ?>

<script>
document.getElementById('data-inicio').addEventListener('change', function() {
    if (!this.value) return;

    const inicio = new Date(this.value);
    const fim = new Date(inicio);
    fim.setDate(fim.getDate() + 6);

    document.getElementById('data-fim').value =
        fim.toISOString().split('T')[0];
});
// Função para adicionar os campos extras
window.addCampoExtra = function(tipo) {
    // tipo será 'entradas' ou 'saidas'
    const containerId = tipo === 'entradas' ? 'entradas-extras-list' : 'saidas-extras-list';
    const container = document.getElementById(containerId);
    if (!container) return;

    const row = document.createElement('div');
    row.classList.add('registro-dynamic-row');

    // Montando a estrutura da linha.
    // Usamos o placeholder com base no tipo.
    const placeholderTexto = tipo === 'entradas' ? 'Ex: Doação Anônima' : 'Ex: Compra de Copos';
    const classeInputValor = `valor-extra-${tipo}`; // Importante para o cálculo!

    row.innerHTML = `
        <input type="text" class="registro-input-descricao" placeholder="${placeholderTexto}">
        
        <div class="registro-main-input-wrapper">
            <span class="registro-main-currency">R$</span>
            <input type="text" 
                   inputmode="numeric" 
                   placeholder="0,00" 
                   class="registro-main-input ${classeInputValor}" 
                   onkeyup="formatarMoeda(this); calcular();">
        </div>

        <button type="button" class="btn-delete-row" onclick="removerCampoExtra(this)">
            <i class="fa-solid fa-xmark"></i>
        </button>
    `;

    container.appendChild(row);
};

// Função para remover e recalcular
window.removerCampoExtra = function(btn) {
    btn.closest('.registro-dynamic-row').remove();
    calcular(); // É obrigatório recalcular quando remover um valor
};
window.toggleRegistroMain = function() {
    const mainSection = document.querySelector('.main-registro');
    const divPeriodo = document.querySelector('#filtro-tempo-registro')
    // Verifica se está escondido
    if (mainSection.style.display === 'none' || mainSection.style.display === '') {
        // Exibe como flex ou grid para manter as colunas alinhadas
        mainSection.style.display = 'flex';
        divPeriodo.style.display = 'none';

    }
};
window.abrirRegistroModal = function(tipo) {
    const overlay = document.getElementById('registro-modal-overlay');
    const modalArea = document.getElementById('modal-registro-area');
    const modalCong = document.getElementById('modal-registro-congregacao');

    overlay.style.display = 'flex';

    if (tipo === 'area') {
        modalArea.style.display = 'block';
        modalCong.style.display = 'none';
    } else if (tipo === 'congregacao') {
        modalCong.style.display = 'block';
        modalArea.style.display = 'none';
    }
};

window.fecharRegistroModal = function() {
    document.getElementById('registro-modal-overlay').style.display = 'none';
};
// ==================== TOGGLE FECHAMENTO MOBILE ====================
const btnAbrir = document.getElementById('btn-abrir-fechamento');
const painelFechamento = document.querySelector('.col-fechamento');
const overlay = document.getElementById('overlay-mobile');

function toggleFechamento() {
    painelFechamento.classList.toggle('open');
    overlay.classList.toggle('open');

    // Troca ícone (seta → X)
    const arrow = btnAbrir.querySelector('.arrow');
    if (painelFechamento.classList.contains('open')) {
        arrow.classList.remove('fa-chevron-left');
        arrow.classList.add('fa-times');
    } else {
        arrow.classList.remove('fa-times');
        arrow.classList.add('fa-chevron-left');
    }
}

if (btnAbrir && painelFechamento) {
    btnAbrir.addEventListener('click', toggleFechamento);
    overlay.addEventListener('click', toggleFechamento);

    // Fecha com tecla ESC
    document.addEventListener('keydown', e => {
        if (e.key === "Escape" && painelFechamento.classList.contains('open')) {
            toggleFechamento();
        }
    });
}
// Função auxiliar para o botão "Hoje" no Header
function setHoje() {
    const hoje = new Date().toISOString().split('T')[0];
    document.getElementById('data-relatorio').value = hoje;
}

function formatarMoeda(input) {
    let valor = input.value.replace(/\D/g, '');
    if (valor === '') {
        input.value = '';
        return;
    }
    valor = (parseFloat(valor) / 100).toLocaleString('pt-BR', {
        minimumFractionDigits: 2,
    });
    input.value = valor;
}

function getValor(id) {
    const el = document.getElementById(id);
    if (!el || !el.value) return 0;
    return (
        parseFloat(el.value.replace(/\./g, '').replace(',', '.')) ||
        0
    );
}

function calcular() {
    const entradas = [
        getValor('oferta-ordinaria'),
        getValor('oferta-voto'),
        getValor('oferta-escola'),
        getValor('oferta-construcao'),
        getValor('oferta-extra'),
        getValor('oferta-missao'),
        getValor('dizimo'),
    ].reduce((a, b) => a + b, 0);

    const saldoAnterior = getValor('saldo-anterior');
    const totalEntradas = saldoAnterior + entradas;

    const saidas = [
        getValor('energia-agua'),
        getValor('material-limpeza'),
        getValor('manutencao'),
        getValor('evangelizacao'),
        getValor('material-expediente'),
        getValor('repasse-central'),
        getValor('dirigente-80'),
        getValor('dizimo-dirigente'),
        getValor('secretaria'),
        getValor('maestro'),
        getValor('construcao-saida'),
        getValor('vigia'),
        getValor('zeladora'),
        getValor('aluguel'),
        getValor('ajuda'),
        getValor('equipamento'),
        getValor('santa-ceia'),
        getValor('ebd'),
        getValor('moveis'),
        getValor('hospedagem'),
        getValor('criancas'),
        getValor('despesas-extras'),
    ].reduce((a, b) => a + b, 0);

    const saldoFinal = totalEntradas - saidas;

    // Atualiza todos os totais
    document.getElementById('total-entradas').textContent =
        totalEntradas.toLocaleString('pt-BR', {
            style: 'currency',
            currency: 'BRL',
        });
    document.getElementById('total-saidas').textContent =
        saidas.toLocaleString('pt-BR', {
            style: 'currency',
            currency: 'BRL',
        });
    document.getElementById('fech-total-entradas').textContent =
        totalEntradas.toLocaleString('pt-BR', {
            style: 'currency',
            currency: 'BRL',
        });
    document.getElementById('fech-total-saidas').textContent =
        saidas.toLocaleString('pt-BR', {
            style: 'currency',
            currency: 'BRL',
        });

    const saldoEl = document.getElementById('saldo-final');
    saldoEl.textContent = saldoFinal.toLocaleString('pt-BR', {
        style: 'currency',
        currency: 'BRL',
    });
    saldoEl.classList.toggle('text-[#f6220e]', saldoFinal < 0);

    document.getElementById('valor-transportar').textContent =
        saldoFinal.toLocaleString('pt-BR', {
            style: 'currency',
            currency: 'BRL',
        });
}

function salvarRelatorio() {
    const data =
        document.getElementById('data-relatorio').value || 'hoje';
    alert(`✅ Relatório de ${data} salvo com sucesso!`);
}

function limparFormulario() {
    if (confirm('Limpar TODOS os campos?')) {
        document
            .querySelectorAll('input[type="text"]')
            .forEach((i) => (i.value = ''));
        calcular();
    }
}
</script>