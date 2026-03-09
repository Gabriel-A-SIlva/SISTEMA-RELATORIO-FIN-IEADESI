<!-- ==================== 1ª SECTION: LISTA ANALÍTICA CONSOLIDADA + % ==================== -->
<section class="analise-container">

    <!-- ENTRADAS -->
    <div class="lista-card">
        <h3>📥 Entradas Consolidadas</h3>
        <table class="lista-table" id="tabela-entradas">
            <thead>
                <tr>
                    <th>Tipo</th>
                    <th>Valor Total</th>
                </tr>
            </thead>
            <tbody>
                <!-- JS preenche -->
            </tbody>
        </table>
    </div>

    <!-- SAÍDAS + DISTRIBUIÇÃO PERCENTUAL -->
    <div class="lista-card">
        <h3>📤 Saídas Consolidadas</h3>
        <table class="lista-table" id="tabela-saidas">
            <thead>
                <tr>
                    <th>Tipo</th>
                    <th>Valor Total</th>
                    <th>%</th>
                </tr>
            </thead>
            <tbody>
                <!-- JS preenche com % e progress bar -->
            </tbody>
        </table>
    </div>
</section>

<!-- ==================== CARDS DE TOTAIS (logo abaixo de tudo) ==================== -->
<div class="cards-totais" id="cards-totais">
    <!-- JS preenche dinamicamente -->
</div>

<!-- ==================== 2ª SECTION: GRÁFICOS ==================== -->
<section class="graficos-container">
    <div class="graficos-header">
        <h2>📊 Visualizações Gráficas</h2>
        <small style="color: var(--text-muted);">Dados consolidados do período selecionado</small>
    </div>

    <div class="graficos-grid">
        <!-- Gráfico 1: Distribuição Entradas -->
        <div class="grafico-card">
            <h3>Distribuição de Entradas</h3>
            <div class="chart-container">
                <canvas id="chartEntradas"></canvas>
            </div>
        </div>

        <!-- Gráfico 2: Distribuição Saídas -->
        <div class="grafico-card">
            <h3>Distribuição de Saídas</h3>
            <div class="chart-container">
                <canvas id="chartSaidas"></canvas>
            </div>
        </div>

        <!-- Gráfico 3: Comparativo Entradas × Saídas -->
        <div class="grafico-card bar-container">
            <h3>Comparativo Entradas × Saídas</h3>
            <div class="chart-container" style="height: 280px;">
                <canvas id="chartComparativo"></canvas>
            </div>
        </div>
    </div>
</section>
<!-- ======================== RESUMO POR ÁREAS ======================== -->
<section style="margin-top:3rem;">

    <div class="graficos-header">
        <h2>📍 Consolidado por Áreas</h2>
        <small style="color: var(--text-muted);">
            Totais individuais de cada área
        </small>
    </div>

    <div id="areas-grid" class="areas-grid"></div>

</section>