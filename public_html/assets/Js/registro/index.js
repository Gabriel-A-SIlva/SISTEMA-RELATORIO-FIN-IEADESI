// ====================== IMPORTS ======================
import { AreaService } from '../Service/area.service.js';
import { CongregacaoService } from '../Service/congregacao.service.js';

// ====================== FUNÇÕES GLOBAIS ======================
window.abrirRegistroModal = function (tipo) {
    console.log(`🪟 Abrindo modal de ${tipo.toUpperCase()}`);
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

window.fecharRegistroModal = function () {
    console.log('🪟 Fechando modal');
    document.getElementById('registro-modal-overlay').style.display = 'none';
};

window.calcular = function () {
    console.log('🔢 Calculando fechamento financeiro...');
    // 1. Entradas Fixas
    let entradas = [
        getValor('oferta-ordinaria'),
        getValor('oferta-voto'),
        getValor('oferta-escola'),
        getValor('oferta-construcao'),
        getValor('oferta-extra'),
        getValor('oferta-missao'),
        getValor('dizimo'),
    ].reduce((a, b) => a + b, 0);

    // Entradas Dinâmicas
    document.querySelectorAll('.valor-extra-entradas').forEach((el) => {
        entradas +=
            parseFloat(el.value.replace(/\./g, '').replace(',', '.')) || 0;
    });

    const saldoAnterior = getValor('saldo-anterior');
    const totalEntradas = saldoAnterior + entradas;

    // 2. Saídas Fixas
    let saidas = [
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

    // Saídas Dinâmicas
    document.querySelectorAll('.valor-extra-saidas').forEach((el) => {
        saidas +=
            parseFloat(el.value.replace(/\./g, '').replace(',', '.')) || 0;
    });

    const saldoFinal = totalEntradas - saidas;

    const formatar = (val) =>
        val.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });

    document.getElementById('total-entradas').textContent =
        formatar(totalEntradas);
    document.getElementById('total-saidas').textContent = formatar(saidas);
    document.getElementById('fech-total-entradas').textContent =
        formatar(totalEntradas);
    document.getElementById('fech-total-saidas').textContent = formatar(saidas);

    const saldoEl = document.getElementById('saldo-final');
    saldoEl.textContent = formatar(saldoFinal);
    saldoEl.classList.toggle('text-[#f6220e]', saldoFinal < 0);

    document.getElementById('valor-transportar').textContent =
        formatar(saldoFinal);
    console.log(
        `💰 Resultado: Total Entradas R$ ${totalEntradas.toFixed(2)} | Saídas R$ ${saidas.toFixed(2)} | Saldo Final R$ ${saldoFinal.toFixed(2)}`,
    );
};

window.addCampoExtra = function (tipo) {
    console.log(`➕ Adicionando campo extra de ${tipo}`);
    const containerId =
        tipo === 'entradas' ? 'entradas-extras-list' : 'saidas-extras-list';
    const container = document.getElementById(containerId);
    if (!container) return;

    const row = document.createElement('div');
    row.classList.add('registro-dynamic-row');

    const placeholderTexto =
        tipo === 'entradas' ? 'Ex: Doação Anônima' : 'Ex: Compra de Copos';
    const classeInputValor = `valor-extra-${tipo}`;

    row.innerHTML = `
        <input type="text" class="registro-input-descricao" placeholder="${placeholderTexto}">
        <div class="registro-main-input-wrapper">
            <span class="registro-main-currency">R$</span>
            <input type="text" inputmode="numeric" placeholder="0,00" 
                class="registro-main-input ${classeInputValor}" 
                onkeyup="formatarMoeda(this); calcular();">
        </div>
        <button type="button" class="btn-delete-row" onclick="removerCampoExtra(this)">
            <i class="fa-solid fa-xmark"></i>
        </button>
    `;

    container.appendChild(row);
};

window.removerCampoExtra = function (btn) {
    console.log('🗑️ Removendo campo extra');
    btn.closest('.registro-dynamic-row').remove();
    window.calcular();
};

window.formatarMoeda = function (input) {
    let valor = input.value.replace(/\D/g, '');
    if (valor === '') {
        input.value = '';
        return;
    }
    valor = (parseFloat(valor) / 100).toLocaleString('pt-BR', {
        minimumFractionDigits: 2,
    });
    input.value = valor;
};

window.getValor = function (id) {
    const el = document.getElementById(id);
    if (!el || !el.value) return 0;
    return parseFloat(el.value.replace(/\./g, '').replace(',', '.')) || 0;
};

window.setHoje = function () {
    const hoje = new Date().toISOString().split('T')[0];
    const el = document.getElementById('data-relatorio');
    if (el) el.value = hoje;
};

// ====================== LISTAR CONGREGAÇÕES (COM LOGS DETALHADOS) ======================
async function listarCongregacoes(areaId = '') {
    console.log(
        `🔍 [LISTAR] Buscando congregações para área: "${areaId || 'TODAS AS ÁREAS'}"`,
    );

    const grid = document.getElementById('congregacoes-grid-registro');
    const labelEl = document.getElementById('congregacoes-area-label');
    const countEl = document.getElementById('congregacoes-contador');
    console.log(grid);

    grid.innerHTML = `
        <div style="grid-column:1/-1; text-align:center; padding: 40px; color: var(--text-muted);">
            <i class="fa-solid fa-circle-notch fa-spin fa-2x"></i>
            <p style="margin-top: 10px; font-weight: 500;">Buscando congregações...</p>
        </div>`;

    try {
        const congregacoes = await CongregacaoService.listarPorArea(areaId);

        console.log(
            `✅ [LISTAR] Resposta da API: ${congregacoes ? congregacoes.length : 0} congregações`,
        );
        console.log('📦 Dados recebidos:', congregacoes);

        grid.innerHTML = '';

        if (!congregacoes || congregacoes.length === 0) {
            console.log('⚠️ [LISTAR] Nenhuma congregação encontrada');
            grid.innerHTML = `
                <div style="grid-column:1/-1; text-align:center; padding: 60px 20px; background: white; border-radius: 16px; border: 1px dashed #cbd5e1;">
                    <i class="fa-solid fa-church fa-3x" style="color: #cbd5e1; margin-bottom: 16px;"></i>
                    <h3 style="color: var(--text-main); margin-bottom: 8px;">Nenhuma congregação encontrada</h3>
                    <p style="color: var(--text-muted);">Selecione outra área ou cadastre uma nova congregação.</p>
                </div>`;
            if (labelEl) {
                if (!areaId) {
                    labelEl.textContent = 'Todas as áreas';
                } else {
                    labelEl.textContent = `Área ${areaId}`;
                }
            }
            if (countEl) {
                countEl.textContent = '0 congregações';
            }
            return;
        }

        console.log('🃏 [LISTAR] Renderizando cards...');
        congregacoes.forEach((cong, index) => {
            console.log(
                `   📌 Card ${index + 1}: ${cong.nome} (ID: ${cong.id} | Área: ${cong.area_numero})`,
            );

            const card = document.createElement('div');
            card.className = 'congregacao-card';
            card.innerHTML = `
                <div class="card-header">
                    <div class="card-info">
                        <h3>${cong.nome}</h3>
                        <span class="area-badge">Área ${cong.area_numero}</span>
                    </div>
                    <div class="card-actions-top">
                        <button onclick="editarCongregacao(${cong.id})" class="btn-icon edit" title="Editar">
                            <i class="fa-solid fa-pen"></i>
                        </button>
                        <button onclick="deletarCongregacao(${cong.id})" class="btn-icon delete" title="Excluir">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                    </div>
                </div>
                <button onclick="abrirRelatorio(${cong.id}, '${cong.nome.replace(/'/g, "\\'")}')" class="btn-relatorio-full">
                    <i class="fa-solid fa-chart-line"></i> Lançar Relatório
                </button>
            `;
            grid.appendChild(card);

            // Animação de entrada em cascata
            requestAnimationFrame(() => {
                setTimeout(() => {
                    card.classList.add('show');
                }, index * 70);
            });
        });
        console.log(grid);

        console.log(
            `🎉 [LISTAR] ${congregacoes.length} cards renderizados com sucesso!`,
        );

        // Atualiza rótulo da área selecionada e contador
        if (labelEl) {
            if (!areaId) {
                labelEl.textContent = 'Todas as áreas';
            } else {
                const areaNumero = congregacoes[0]?.area_numero ?? areaId;
                labelEl.textContent = `Área ${areaNumero}`;
            }
        }
        if (countEl) {
            const total = congregacoes.length;
            countEl.textContent = `${total} congregação${total !== 1 ? 'es' : ''}`;
        }
    } catch (error) {
        console.error('❌ [LISTAR] Erro ao buscar congregações:', error);
    }
}

// ====================== CARREGAR ÁREAS + FILTRO (ATUALIZADO) ======================
async function carregarAreasEListarCongregacoes() {
    console.log('🌍 [ÁREAS] Iniciando carregamento de áreas...');
    const container = document.getElementById('area-pills-container');

    try {
        const areas = await AreaService.listar();
        console.log(`✅ [ÁREAS] ${areas.length} áreas carregadas do banco`);

        // Mantém o botão "Todas as Áreas" e adiciona as novas dinamicamente
        let htmlPills = `
            <button class="area-pill active" onclick="selecionarArea('', this)">
                <i class="fa-solid fa-border-all"></i> Todas
            </button>
        `;

        areas.forEach((area) => {
            htmlPills += `
                <button class="area-pill" onclick="selecionarArea('${area.id}', this)">
                    <i class="fa-solid fa-map-location-dot"></i> Área ${area.area_numero}
                </button>
            `;
        });

        container.innerHTML = htmlPills;

        // Primeira carga geral
        listarCongregacoes('');
    } catch (error) {
        console.error('❌ [ÁREAS] Erro ao carregar áreas:', error);
        container.innerHTML += `<span style="color: #fca5a5; font-size: 14px; margin-left: 10px;">Erro ao carregar áreas.</span>`;
    }
}

// ====================== NOVA FUNÇÃO DE SELEÇÃO ======================
window.selecionarArea = function (areaId, btnElement) {
    // 1. Remove a classe 'active' de todos os botões
    const botoes = document.querySelectorAll('.area-pill');
    botoes.forEach((btn) => btn.classList.remove('active'));

    // 2. Adiciona a classe 'active' no botão clicado
    btnElement.classList.add('active');

    // 3. Centraliza o botão clicado na tela (útil para mobile)
    btnElement.scrollIntoView({
        behavior: 'smooth',
        block: 'nearest',
        inline: 'center',
    });

    // 4. Chama a função que você já tem para buscar os cards
    listarCongregacoes(areaId);
};

// ====================== NAVEGAÇÃO ======================
window.abrirRelatorio = function (congId, congNome = '') {
    console.log(
        `📊 Abrindo relatório da congregação: ${congNome} (ID: ${congId})`,
    );
    const viewLista = document.getElementById('view-lista');
    const viewRelatorio = document.getElementById('view-relatorio');
    const titulo = document.getElementById('relatorio-titulo-congregacao');
    const header = document.querySelector('.registro-header-modern');

    if (congNome) titulo.textContent = `Relatório Financeiro: ${congNome}`;

    // Esconde header com animação
    if (header) {
        header.classList.add('is-collapsed');
    }

    viewLista.classList.remove('active');

    setTimeout(() => {
        viewLista.style.display = 'none';
        viewRelatorio.style.display = 'block';
        void viewRelatorio.offsetWidth;
        viewRelatorio.classList.add('active');
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }, 400);
};

window.voltarParaLista = function () {
    console.log('⬅️ Voltando para lista de congregações');
    const viewLista = document.getElementById('view-lista');
    const viewRelatorio = document.getElementById('view-relatorio');
    const header = document.querySelector('.registro-header-modern');

    viewRelatorio.classList.remove('active');

    // Mostra novamente o header
    if (header) {
        header.classList.remove('is-collapsed');
    }

    setTimeout(() => {
        viewRelatorio.style.display = 'none';
        viewLista.style.display = 'block';
        void viewLista.offsetWidth;
        viewLista.classList.add('active');
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }, 400);
};

// ====================== OUTRAS INICIALIZAÇÕES ======================
function initDatas() {
    const dataInicio = document.getElementById('data-inicio');
    if (dataInicio) {
        dataInicio.addEventListener('change', function () {
            if (!this.value) return;
            const inicio = new Date(this.value);
            const fim = new Date(inicio);
            fim.setDate(fim.getDate() + 6);
            document.getElementById('data-fim').value = fim
                .toISOString()
                .split('T')[0];
        });
    }
}

function initMobileFechamento() {
    const btnAbrir = document.getElementById('btn-abrir-fechamento');
    const painelFechamento = document.querySelector('.col-fechamento');
    const overlay = document.getElementById('overlay-mobile');

    if (!btnAbrir || !painelFechamento) return;

    function toggleFechamento() {
        painelFechamento.classList.toggle('open');
        overlay.classList.toggle('open');

        const arrow = btnAbrir.querySelector('.arrow');
        if (painelFechamento.classList.contains('open')) {
            arrow.classList.remove('fa-chevron-left');
            arrow.classList.add('fa-times');
        } else {
            arrow.classList.remove('fa-times');
            arrow.classList.add('fa-chevron-left');
        }
    }

    btnAbrir.addEventListener('click', toggleFechamento);
    overlay.addEventListener('click', toggleFechamento);

    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && painelFechamento.classList.contains('open')) {
            toggleFechamento();
        }
    });
}

// ====================== INICIALIZAÇÃO GERAL ======================
document.addEventListener('DOMContentLoaded', () => {
    console.log('🚀 [INIT] Painel de Congregações carregado com sucesso!');
    console.log('📍 Aguardando seleção de área...');

    carregarAreasEListarCongregacoes();
    initDatas();
    initMobileFechamento();

    // Observer para cálculo automático
    const observer = new MutationObserver(() => {
        if (document.getElementById('data-inicio')) {
            window.calcular();
            observer.disconnect();
        }
    });
    observer.observe(document.body, { childList: true, subtree: true });
});
