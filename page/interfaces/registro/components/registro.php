<div class="main-registro" style="display: none;">
    <div class="left-column-registro">
        <div class="registro-main-card registro-main--periodo">

            <div class="registro-main-header">
                <div class="registro-main-icon">
                    <svg fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                    </svg>
                </div>
                <h2 class="registro-main-title">PERÍODO DO RELATÓRIO</h2>
            </div>

            <div class="registro-periodo-grid">
                <div class="registro-periodo-item">
                    <label class="registro-main-label">DE</label>
                    <input type="date" id="data-inicio" class="registro-input-date">
                </div>

                <div class="registro-periodo-item">
                    <label class="registro-main-label">ATÉ</label>
                    <input type="date" id="data-fim" class="registro-input-date">
                </div>
            </div>

        </div>
        <?php include_once __DIR__ . '/partials/entradas.php'; ?>
        <?php include_once __DIR__ . '/partials/saidas.php'; ?>
    </div>
    <?php include_once __DIR__ . '/partials/fechamento.php'; ?>
    <!-- BOTÃO FLUTUANTE MOBILE - FECHAMENTO -->
    <button id="btn-abrir-fechamento" class="btn-fechamento-flutuante no-print">
        <i class="fa-solid fa-chart-pie"></i>
        <span>FECHAMENTO</span>
        <i class="fa-solid fa-chevron-left arrow"></i>
    </button>
</div>