<header class="registro-header">
    <div class="registro-filter-bar">
        <div class="registro-container">
            <div class="registro-filter-inner">
                <select class="registro-select-field" data-area-select>
                    <option value="">Selecionar Área</option>
                </select>
                <select class="registro-select-field" id="registro-filtro-congregacao">
                    <option value="">Selecionar Congregação</option>
                </select>
            </div>
        </div>
    </div>
    <div class="registro-container">
        <div class="registro-nav-main">
            <div class="registro-brand">
                <div class="registro-logo-wrapper">⛪</div>
                <div class="registro-brand-text">
                    <span class="registro-tagline">Congregação</span>
                    <h1 class="registro-title-h1">GILEADE</h1>
                </div>
            </div>

            <div class="registro-actions">
                <button class="registro-btn-action" onclick="abrirRegistroModal('area')">
                    <svg fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                    </svg>
                    Área
                </button>
                <button class="registro-btn-action" onclick="abrirRegistroModal('congregacao')"> <svg fill="none"
                        viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                    </svg>
                    Cong.
                </button>
                <button class="registro-btn-action destaque" onclick="toggleRegistroMain()">
                    <svg fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                    </svg>
                    Relatório
                </button>
            </div>
        </div>
    </div>

</header>

<main class="registro-container" id="filtro-tempo-registro">
    <section class="registro-date-card">
        <span class="registro-label-caps">Período do Registro</span>

        <div class="registro-preset-row">
            <button class="registro-preset-item ativo">Este Mês</button>
            <button class="registro-preset-item">Mês Passado</button>
            <button class="registro-preset-item">Este Ano</button>
            <button class="registro-preset-item">Ano Passado</button>
            <button class="registro-preset-item" id="registro-toggle-custom">Personalizado</button>
        </div>

        <div class="registro-custom-container" id="registro-custom-box" style="display: none;">
            <div class="registro-input-box">
                <label>De:</label>
                <input type="date" class="registro-input-date" id="registro-data-de">
            </div>
            <div class="registro-input-box">
                <label>Até:</label>
                <input type="date" class="registro-input-date" id="registro-data-ate">
            </div>
        </div>
    </section>
</main>