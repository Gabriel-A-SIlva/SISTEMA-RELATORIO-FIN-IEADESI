<!-- HEADER DINÂMICO -->
<div class="area-header"
    style="margin-bottom: 2rem; padding: 1.5rem; background: var(--card-bg); border-radius: 12px; border: 1px solid var(--border-color);">
    <h2 id="nome-area-atual">Área 1 - Norte</h2>
    <small id="subtitulo-area" style="color: var(--text-muted);">Consolidado da área + congregações</small>
</div>

<!-- LISTAS ANALÍTICAS -->
<section class="analise-container">
    <div class="lista-card">
        <h3>📥 Entradas Consolidadas da Área</h3>
        <table class="lista-table" id="tabela-entradas-area">
            <thead>
                <tr>
                    <th>Tipo</th>
                    <th>Valor Total</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
    <div class="lista-card">
        <h3>📤 Saídas Consolidadas da Área</h3>
        <table class="lista-table" id="tabela-saidas-area">
            <thead>
                <tr>
                    <th>Tipo</th>
                    <th>Valor Total</th>
                    <th>%</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</section>

<!-- CARDS DE TOTAIS -->
<div class="cards-totais" id="cards-totais-area"></div>

<!-- GRÁFICOS -->
<section class="graficos-container">
    <div class="graficos-header">
        <h2>📊 Visualizações Gráficas - Área</h2>
        <small style="color: var(--text-muted);">Dados consolidados do período selecionado</small>
    </div>
    <div class="graficos-grid">
        <div class="grafico-card">
            <h3>Distribuição de Entradas</h3>
            <div class="chart-container"><canvas id="chartEntradasArea"></canvas></div>
        </div>
        <div class="grafico-card">
            <h3>Distribuição de Saídas</h3>
            <div class="chart-container"><canvas id="chartSaidasArea"></canvas></div>
        </div>
        <div class="grafico-card bar-container">
            <h3>Comparativo Entradas × Saídas</h3>
            <div class="chart-container" style="height: 280px;"><canvas id="chartComparativoArea"></canvas></div>
        </div>
    </div>
</section>

<!-- CONGREGAÇÕES -->
<section style="margin-top: 3.5rem;">
    <div class="graficos-header">
        <h2>⛪ Congregações desta Área</h2>
        <small style="color: var(--text-muted);">Totais individuais de cada congregação</small>
    </div>
    <div id="congregacoes-grid" class="areas-grid"></div>
</section>