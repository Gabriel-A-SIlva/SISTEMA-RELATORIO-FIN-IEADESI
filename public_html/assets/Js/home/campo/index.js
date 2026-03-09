import { dadosCampo, dadosResumoAreas } from '../mock/index.js';

let chartEntradas, chartSaidas, chartComparativo;
// ======================== FUNÇÃO PARA CARREGAR LISTAS ========================
export function carregarListas() {
    // ENTRADAS
    const tbodyEntradas = document.querySelector('#tabela-entradas tbody');
    tbodyEntradas.innerHTML = dadosCampo.entradas
        .map(
            (item) => `
        <tr>
            <td><i class="fa-solid fa-caret-right" style="color: var(--success); margin-right: 8px;"></i> ${item.tipo}</td>
            <td class="valor text-right">R$ ${item.valor.toLocaleString('pt-BR')}</td>
        </tr>
    `,
        )
        .join('');

    // SAÍDAS + % + BARRA
    const totalSaidas = dadosCampo.saidas.reduce(
        (acc, cur) => acc + cur.valor,
        0,
    );
    const tbodySaidas = document.querySelector('#tabela-saidas tbody');
    tbodySaidas.innerHTML = dadosCampo.saidas
        .map((item) => {
            const percent = ((item.valor / totalSaidas) * 100).toFixed(1);
            return `
            <tr>
                <td><i class="fa-solid fa-caret-right" style="color: var(--danger); margin-right: 8px;"></i> ${item.tipo}</td>
                <td class="valor text-right" style="padding-right: 2rem;">R$ ${item.valor.toLocaleString('pt-BR')}</td>
                <td>
                    <div class="percentual">${percent}%</div>
                    <div class="progress-bar"><div class="progress" style="width: ${percent}%"></div></div>
                </td>
            </tr>
        `;
        })
        .join('');
}

// ======================== CARDS DE TOTAIS ========================
export function carregarCards() {
    const totalEntradas = dadosCampo.entradas.reduce(
        (acc, cur) => acc + cur.valor,
        0,
    );
    const totalSaidas = dadosCampo.saidas.reduce(
        (acc, cur) => acc + cur.valor,
        0,
    );
    const saldo = totalEntradas - totalSaidas;
    const superavit =
        totalEntradas > 0 ? ((saldo / totalEntradas) * 100).toFixed(1) : 0;

    const container = document.getElementById('cards-totais');
    container.innerHTML = `
        <div class="card-total">
            <i class="fa-solid fa-arrow-down card-icon-bg" style="color: var(--success);"></i>
            <h4><i class="fa-solid fa-wallet text-success"></i> Total Entradas</h4>
            <div class="valor-grande text-success">R$ ${totalEntradas.toLocaleString('pt-BR')}</div>
        </div>
        
        <div class="card-total">
            <i class="fa-solid fa-arrow-up card-icon-bg" style="color: var(--danger);"></i>
            <h4><i class="fa-solid fa-hand-holding-dollar text-danger"></i> Total Saídas</h4>
            <div class="valor-grande text-danger">R$ ${totalSaidas.toLocaleString('pt-BR')}</div>
        </div>
        
        <div class="card-total">
            <i class="fa-solid fa-scale-balanced card-icon-bg" style="color: var(--info);"></i>
            <h4><i class="fa-solid fa-building-columns" style="color: var(--info);"></i> Saldo Geral</h4>
            <div class="valor-grande" style="color: ${saldo >= 0 ? 'var(--success)' : 'var(--danger)'};">
                R$ ${saldo.toLocaleString('pt-BR')}
            </div>
        </div>
        
        <div class="card-total">
            <i class="fa-solid fa-chart-line card-icon-bg" style="color: var(--success);"></i>
            <h4><i class="fa-solid fa-percent"></i> Índice Superávit</h4>
            <div class="superavit" style="${saldo < 0 ? 'background: var(--danger-bg); color: var(--danger);' : ''}">
                <i class="fa-solid ${saldo >= 0 ? 'fa-arrow-trend-up' : 'fa-arrow-trend-down'}"></i>
                ${superavit}%
            </div>
        </div>
    `;
}

export function criarGraficos() {
    Chart.defaults.font.family = "'Inter', sans-serif";
    Chart.defaults.color = '#64748b';

    const ctxEntradas = document
        .getElementById('chartEntradas')
        .getContext('2d');
    if (chartEntradas) chartEntradas.destroy();
    chartEntradas = new Chart(ctxEntradas, {
        type: 'doughnut', // Doughnut é mais moderno que pie
        data: {
            labels: dadosCampo.entradas.map((i) => i.tipo),
            datasets: [
                {
                    data: dadosCampo.entradas.map((i) => i.valor),
                    backgroundColor: [
                        '#10b981',
                        '#3b82f6',
                        '#8b5cf6',
                        '#f59e0b',
                        '#ec4899',
                    ],
                    borderWidth: 0,
                    hoverOffset: 4,
                },
            ],
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { position: 'bottom' } },
            cutout: '65%',
        },
    });

    const ctxSaidas = document.getElementById('chartSaidas').getContext('2d');
    if (chartSaidas) chartSaidas.destroy();
    chartSaidas = new Chart(ctxSaidas, {
        type: 'doughnut',
        data: {
            labels: dadosCampo.saidas.map((i) => i.tipo),
            datasets: [
                {
                    data: dadosCampo.saidas.map((i) => i.valor),
                    backgroundColor: [
                        '#ef4444',
                        '#f97316',
                        '#eab308',
                        '#84cc16',
                        '#22c55e',
                    ],
                    borderWidth: 0,
                    hoverOffset: 4,
                },
            ],
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { position: 'bottom' } },
            cutout: '65%',
        },
    });

    const ctxBar = document.getElementById('chartComparativo').getContext('2d');
    if (chartComparativo) chartComparativo.destroy();
    chartComparativo = new Chart(ctxBar, {
        type: 'bar',
        data: {
            labels: ['Mês Atual'],
            datasets: [
                {
                    label: 'Entradas',
                    data: [
                        dadosCampo.entradas.reduce((a, b) => a + b.valor, 0),
                    ],
                    backgroundColor: '#10b981',
                    borderRadius: 6,
                },
                {
                    label: 'Saídas',
                    data: [dadosCampo.saidas.reduce((a, b) => a + b.valor, 0)],
                    backgroundColor: '#ef4444',
                    borderRadius: 6,
                },
            ],
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: { beginAtZero: true, grid: { borderDash: [5, 5] } },
                x: { grid: { display: false } },
            },
            plugins: { legend: { position: 'top' } },
        },
    });
}

// ======================== ÁREAS / CONGREGAÇÕES ========================
export function carregarAreas() {
    const container = document.getElementById('areas-grid');
    container.innerHTML = dadosResumoAreas
        .map((area) => {
            const saldo = area.entradas - area.saidas;
            const superavit =
                area.entradas > 0
                    ? ((saldo / area.entradas) * 100).toFixed(1)
                    : 0;
            const saldoColor = saldo >= 0 ? 'var(--success)' : 'var(--danger)';

            return `
            <div class="area-card">
                <h3><i class="fa-solid fa-place-of-worship"></i> ${area.nome}</h3>
                
                <div class="linha">
                    <span><i class="fa-solid fa-circle-down" style="color:var(--success)"></i> Entradas</span>
                    <strong style="color:var(--success);">R$ ${area.entradas.toLocaleString('pt-BR')}</strong>
                </div>
                <div class="linha">
                    <span><i class="fa-solid fa-circle-up" style="color:var(--danger)"></i> Saídas</span>
                    <strong style="color:var(--danger);">R$ ${area.saidas.toLocaleString('pt-BR')}</strong>
                </div>
                <div class="linha" style="margin-top: 1rem; padding-top: 0.5rem; border-top: 1px solid var(--border-color);">
                    <span><i class="fa-solid fa-scale-balanced" style="color:${saldoColor}"></i> Saldo</span>
                    <strong style="color:${saldoColor};">R$ ${saldo.toLocaleString('pt-BR')}</strong>
                </div>
                <div class="linha">
                    <span><i class="fa-solid fa-chart-pie" style="color:var(--info)"></i> Superávit</span>
                    <strong>${superavit}%</strong>
                </div>
            </div>
        `;
        })
        .join('');
}
