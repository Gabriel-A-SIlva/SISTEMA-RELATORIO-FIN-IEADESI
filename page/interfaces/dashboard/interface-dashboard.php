<style>
/* ==================== ANIMAÇÕES E UX ==================== */
.view-content {
    display: none;
    opacity: 0;
}

.view-content.active {
    display: block;
    animation: fadeIn 0.4s ease-out forwards;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(10px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.filter-group {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    animation: fadeIn 0.3s ease-out;
}
</style>

<div class="header_lista">
    <h1>Dashboard Financeiro</h1>
    <p class="subtitle">Gerencie entradas, saídas e indicadores.</p>
</div>

<div class="controls-card">
    <nav class="view-tabs">
        <button class="btn_view active" data-target="view_campo">
            <i class="fa-solid fa-city"></i> Campo
        </button>
        <button class="btn_view" data-target="view_areas">
            <i class="fa-solid fa-map"></i> Áreas
        </button>
        <button class="btn_view" data-target="view_congregacao">
            <i class="fa-solid fa-church"></i> Congregação
        </button>
    </nav>

    <div class="filters-row">
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

        <div class="contextual-filters" id="contextual-filters">
            <div id="filtro-area-container" class="filter-group" style="display: none;">
                <label class="filter-label" for="select-area"><i class="fa-solid fa-location-dot"></i> Selecione a
                    Área:</label>
                <select id="select-area" class="select-filter" data-area-select>

                </select>
            </div>
            <div id="filtro-congregacao-container" class="filter-group" style="display: none;">
                <select class="select-filter">
                    <option>Congregação...</option>
                </select>
            </div>
        </div>
    </div>
</div>

<div id="dashboard-views">
    <div id="view_campo" class="view_section" style="display:block;">
        <?php include __DIR__ . '/components/section-campo.php'; ?>
    </div>

    <div id="view_areas" class="view_section" style="display:none;">
        <?php include __DIR__ . '/components/section-area.php'; ?>
    </div>

    <div id="view_congregacao" class="view_section" style="display:none;">
        <div style="padding: 3rem; text-align:center;">
            <h2>⛪ Dashboard por Congregação</h2>
            <p>Em desenvolvimento...</p>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>