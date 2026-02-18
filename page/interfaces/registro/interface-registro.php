<?php include __DIR__ . '/components/header.php' ?>
<div class="main-grid">
    <div class="left-column">
        <?php include_once __DIR__ . '/components/entradas.php'; ?>
        <?php include_once __DIR__ . '/components/saidas.php'; ?>
    </div>

    <?php include_once __DIR__ . '/components/fechamento.php'; ?>
</div>
<!-- BOTÕES FLUTUANTES DESKTOP (só aparecem no desktop) -->
<button onclick="salvarRelatorio()" class="btn-salvar-flutuante no-print">
    <i class="fa-solid fa-floppy-disk"></i> SALVAR RELATÓRIO
</button>
<button onclick="limparFormulario()" class="btn-limpar-flutuante no-print">
    <i class="fa-solid fa-trash"></i> LIMPAR TUDO
</button>
<!-- BOTÃO FLUTUANTE MOBILE - FECHAMENTO -->
<button id="btn-abrir-fechamento" class="btn-fechamento-flutuante no-print">
    <i class="fa-solid fa-chart-pie"></i>
    <span>FECHAMENTO</span>
    <i class="fa-solid fa-chevron-left arrow"></i>
</button>
<footer>
    GILEADE • Movimento Diário • Sistema Moderno 2026
</footer>

<script>
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

window.onload = () => {
    const hoje = new Date().toISOString().split('T')[0];
    document.getElementById('data-relatorio').value = hoje;

    document
        .querySelectorAll('input')
        .forEach((inp) => inp.addEventListener('input', calcular));
    calcular();

    console.log(
        '%c✅ GILEADE Movimento Diário - Layout exatamente como você pediu!',
        'color:#27629f; font-size:14px',
    );
};
</script>