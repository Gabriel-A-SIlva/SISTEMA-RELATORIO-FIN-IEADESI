<style>
/* ======================== HEADER ======================== */
.header_lista {
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem;
    border-bottom: 2px solid var(--border-color);
    margin-bottom: 1rem;
}

.header_lista h1 {
    font-size: 2rem;
    color: var(--text-main);
    font-weight: 700;
}

.header_lista .subtitle {
    color: var(--text-muted);
    font-size: 0.95rem;
}

/* ======================== CONTROLS CARD (novo – resolve recorte + melhor UX) ======================== */
.controls-card {
    background: var(--bg-card);
    border-radius: var(--radius-lg);
    box-shadow: var(--shadow-md);
    overflow: hidden;
    margin-bottom: 2rem;
}

.view-tabs {
    display: flex;
    gap: 0.5rem;
    padding: 0 1.5rem;
    border-bottom: 1px solid var(--border-color);
    background: #f8f9fc;
}

.tab-btn {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    padding: 1rem 1.5rem;
    border: none;
    background: transparent;
    color: var(--text-muted);
    font-weight: 600;
    cursor: pointer;
    transition: var(--transition);
    border-bottom: 3px solid transparent;
    margin-bottom: -1px;
    border-radius: var(--radius-md) var(--radius-md) 0 0;
}

.tab-btn:hover {
    color: var(--primary);
    background: var(--primary-soft);
}

.tab-btn.active {
    color: var(--primary);
    border-bottom: 3px solid var(--primary);
    background: var(--bg-card);
    box-shadow: var(--shadow-sm);
}

/* ======================== FILTROS ======================== */
.filters-row {
    display: flex;
    flex-direction: column;
    gap: 2.5rem;
    padding: 1rem 1rem 1rem;
    flex-wrap: wrap;
}

.date-section {
    display: flex;
    flex-direction: column;
    gap: 0.75rem;
    min-width: 320px;
}

.filter-label {
    font-size: 0.875rem;
    font-weight: 600;
    color: var(--text-muted);
    margin-bottom: 0.25rem;
}

.preset-group {
    display: flex;
    gap: 0.5rem;
    flex-wrap: wrap;
}

.preset-btn {
    padding: 0.5rem 1rem;
    border: 1px solid var(--border-color);
    background: #fff;
    border-radius: 9999px;
    font-size: 0.875rem;
    font-weight: 500;
    cursor: pointer;
    transition: var(--transition);
}

.preset-btn.active,
.preset-btn:hover {
    background: var(--primary-soft);
    border-color: var(--primary);
    color: var(--primary);
}

.custom-range {
    display: flex;
    gap: 1rem;
    align-items: end;
}

.date-input-group {
    display: flex;
    flex-direction: column;
    gap: 0.25rem;
}

.date-input {
    padding: 0.75rem 1rem;
    border: 1px solid var(--border-color);
    border-radius: var(--radius-md);
    font-size: 1rem;
    background: var(--bg-input);
    min-width: 160px;
}

.date-input:focus {
    outline: none;
    border-color: var(--primary);
    box-shadow: 0 0 0 3px var(--primary-soft);
}

/* Filtros contextuais (Áreas / Congregação) */
.contextual-filters {
    display: flex;
    gap: 1rem;
    flex: 1;
    flex-wrap: wrap;
    min-width: 280px;
}

.select-filter {
    padding: 0.75rem 1rem;
    border: 1px solid var(--border-color);
    border-radius: var(--radius-md);
    background: var(--bg-input);
    font-size: 1rem;
    min-width: 180px;
}

.select-filter:focus {
    outline: none;
    border-color: var(--primary);
    box-shadow: 0 0 0 3px var(--primary-soft);
}
</style>

<!-- ======================== HTML ATUALIZADO ======================== -->
<div class="header_lista">
    <h1>Dashbord Financeiro</h1>
    <p class="subtitle">Gerencie entradas, saídas e indicadores.</p>
</div>

<!-- Container único – tabs + filtros conectados (sem recorte) -->
<div class="controls-card">
    <!-- TABS -->
    <nav class="view-tabs">
        <button id="btn-geral" class="tab-btn active" data-tab="geral">
            <i class="fa-solid fa-city"></i>
            <span>Campo</span>
        </button>
        <button id="btn-areas" class="tab-btn" data-tab="areas">
            <i class="fa-solid fa-map"></i>
            <span>Áreas</span>
        </button>
        <button id="btn-congregacao" class="tab-btn" data-tab="congregacao">
            <i class="fa-solid fa-church"></i>
            <span>Congregação</span>
        </button>
    </nav>

    <!-- FILTROS -->
    <div class="filters-row">
        <!-- FILTRO DE TEMPO (principal) -->
        <div class="date-section">
            <label class="filter-label">Período</label>

            <div class="preset-group">
                <button class="preset-btn active" data-preset="este-mes">Este Mês</button>
                <button class="preset-btn" data-preset="mes-passado">Mês Passado</button>
                <button class="preset-btn" data-preset="este-ano">Este Ano</button>
                <button class="preset-btn" data-preset="ano-passado">Ano Passado</button>
                <button class="preset-btn" data-preset="ult-12">Últ. 12 Meses</button>
                <button class="preset-btn" data-preset="custom">Personalizado</button>
            </div>

            <div class="custom-range" id="custom-range" style="display: none;">
                <div class="date-input-group">
                    <label>De</label>
                    <input type="date" id="data-inicio" class="date-input">
                </div>
                <div class="date-input-group">
                    <label>Até</label>
                    <input type="date" id="data-fim" class="date-input">
                </div>
            </div>
        </div>

        <!-- FILTROS CONTEXTUAIS (mudam por aba) -->
        <div class="contextual-filters" id="contextual-filters">
            <!-- JS preenche aqui -->
        </div>
    </div>
</div>
<script>
// Troca de aba + carrega filtros contextuais
document.querySelectorAll('.tab-btn').forEach(btn => {
    btn.addEventListener('click', () => {
        document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');

        const tab = btn.dataset.tab;
        const container = document.getElementById('contextual-filters');
        container.innerHTML = '';

        if (tab === 'areas') {
            container.innerHTML =
                `<select class="select-filter"><option>Todas as Áreas</option><!-- suas opções --></select>`;
        } else if (tab === 'congregacao') {
            container.innerHTML = `
        <select class="select-filter"><option>Área...</option></select>
        <select class="select-filter"><option>Congregação...</option></select>
      `;
        }
        // "Campo" = só o filtro de tempo (nenhum extra)
    });
});

// Exemplo simples de mostrar/esconder range customizado
document.querySelectorAll('.preset-btn').forEach(btn => {
    btn.addEventListener('click', () => {
        document.querySelectorAll('.preset-btn').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');

        if (btn.dataset.preset === 'custom') {
            document.getElementById('custom-range').style.display = 'flex';
        } else {
            document.getElementById('custom-range').style.display = 'none';
        }
    });
});
</script>