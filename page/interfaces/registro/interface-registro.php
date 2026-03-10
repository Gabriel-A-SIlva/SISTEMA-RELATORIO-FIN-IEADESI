<header class="registro-header-modern">
    <div class="registro-header-content">
        <div class="header-left">
            <div>
                <h1 class="title">Painel de Congregações</h1>
                <p class="subtitle">Gerencie áreas, congregações e relatórios</p>
            </div>
        </div>
        <div class="header-right"> <button onclick="abrirRegistroModal('area')" class="btn-add modern outline"> <i
                    class="fa-solid fa-layer-group"></i> Nova Área </button> <button
                onclick="abrirRegistroModal('congregacao')" class="btn-add modern solid"> <i
                    class="fa-solid fa-church"></i> Nova Congregação </button> </div>
    </div>
    <div class="area-filters-wrapper">
        <div class="area-pills-scroll" id="area-pills-container"> <button class="area-pill active"
                onclick="selecionarArea('', this)"> <i class="fa-solid fa-border-all"></i> Todas as Áreas </button>
        </div>
    </div>
</header>
<main class="app-main-content">
    <section id="view-lista" class="view-section active">
        <div class="congregacoes-container">
            <div class="congregacoes-header-bar">
                <div class="congregacoes-header-text">
                    <h2 class="congregacoes-title">Congregações</h2>
                    <p class="congregacoes-subtitle"> Visualize e gerencie as congregações da <span
                            id="congregacoes-area-label">Todas as áreas</span> </p>
                </div> <span id="congregacoes-contador" class="congregacoes-count-pill"> 0 congregações </span>
            </div>
            <div id="congregacoes-grid-registro" class="congregacoes-grid"> </div>
        </div>
    </section>
    <section id="view-relatorio" class="view-section">
        <div class="relatorio-header-actions no-print"> <button onclick="voltarParaLista()" class="btn-voltar-link"> <i
                    class="fa-solid fa-arrow-left"></i> Voltar para Congregações </button>
            <h2 id="relatorio-titulo-congregacao" class="relatorio-titulo">Relatório Financeiro</h2>
        </div>
        <div class="main-registro">
            <div class="left-column-registro">
                <div class="registro-main-card registro-main--periodo">
                    <div class="registro-main-header">
                        <div class="registro-main-icon"> <svg fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                            </svg> </div>
                        <h2 class="registro-main-title">PERÍODO DO RELATÓRIO</h2>
                    </div>
                    <div class="registro-periodo-grid">
                        <div class="registro-periodo-item"> <label class="registro-main-label">DE</label> <input
                                type="date" id="data-inicio" class="registro-input-date"> </div>
                        <div class="registro-periodo-item"> <label class="registro-main-label">ATÉ</label> <input
                                type="date" id="data-fim" class="registro-input-date"> </div>
                    </div>
                </div> <?php include_once __DIR__ . '/components/partials/entradas.php'; ?>
                <?php include_once __DIR__ . '/components/partials/saidas.php'; ?>
            </div> <?php include_once __DIR__ . '/components/partials/fechamento.php'; ?>
            <!-- BOTÃO FLUTUANTE MOBILE - FECHAMENTO --> <button id="btn-abrir-fechamento"
                class="btn-fechamento-flutuante no-print"> <i class="fa-solid fa-chart-pie"></i> <span>FECHAMENTO</span>
                <i class="fa-solid fa-chevron-left arrow"></i> </button>
        </div>
        <!-- OVERLAY MOBILE -->
        <div id="overlay-mobile" class="overlay-mobile"></div>
    </section>
</main>
<?php include __DIR__ . '/components/forms.php'; ?>