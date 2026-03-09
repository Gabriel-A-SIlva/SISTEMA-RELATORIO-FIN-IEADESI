import { dadosPorArea } from '../mock/index.js';

let chartEntradasArea, chartSaidasArea, chartComparativoArea;

// ======================== FUNÇÃO PRINCIPAL ========================
window.mudarVisaoArea = function (areaId) {
    const area = dadosPorArea[areaId];
    if (!area) return;

    document.getElementById('nome-area-atual').textContent = area.nome;

    carregarListasArea(area);
    carregarCardsArea(area);
    criarGraficosArea(area);
    carregarCongregacoesArea(area);
};

// ======================== FUNÇÕES AUXILIARES ========================
function carregarListasArea(area) {
    document.querySelector('#tabela-entradas-area tbody').innerHTML =
        area.entradas
            .map(
                (i) => `
        <tr><td>${i.tipo}</td><td class="valor">R$ ${i.valor.toLocaleString('pt-BR')}</td></tr>
    `,
            )
            .join('');

    const totalS = area.saidas.reduce((a, b) => a + b.valor, 0);
    document.querySelector('#tabela-saidas-area tbody').innerHTML = area.saidas
        .map((item) => {
            const perc = totalS ? ((item.valor / totalS) * 100).toFixed(1) : 0;
            return `<tr><td>${item.tipo}</td><td class="valor">R$ ${item.valor.toLocaleString('pt-BR')}</td>
                <td><div class="percentual">${perc}%</div><div class="progress-bar"><div class="progress" style="width:${perc}%"></div></div></td></tr>`;
        })
        .join('');
}

function carregarCardsArea(area) {
    const totalE = area.entradas.reduce((a, b) => a + b.valor, 0);
    const totalS = area.saidas.reduce((a, b) => a + b.valor, 0);
    const saldo = totalE - totalS;
    const superavit = totalE ? ((saldo / totalE) * 100).toFixed(1) : 0;

    document.getElementById('cards-totais-area').innerHTML = `
        <div class="card-total"><h4>💰 Total Entradas</h4><div class="valor-grande" style="color:#10b981;">R$ ${totalE.toLocaleString('pt-BR')}</div></div>
        <div class="card-total"><h4>📤 Total Saídas</h4><div class="valor-grande" style="color:#ef4444;">R$ ${totalS.toLocaleString('pt-BR')}</div></div>
        <div class="card-total"><h4>🟢 Saldo Geral</h4><div class="valor-grande ${saldo >= 0 ? 'saldo-positivo' : 'saldo-negativo'}">R$ ${saldo.toLocaleString('pt-BR')}</div></div>
        <div class="card-total"><h4>📊 Superávit</h4><div class="superavit"><i class="fa-solid fa-arrow-trend-up"></i> ${superavit}%</div></div>
    `;
}

function criarGraficosArea(area) {
    if (chartEntradasArea) chartEntradasArea.destroy();
    if (chartSaidasArea) chartSaidasArea.destroy();
    if (chartComparativoArea) chartComparativoArea.destroy();

    const totalE = area.entradas.reduce((a, b) => a + b.valor, 0);
    const totalS = area.saidas.reduce((a, b) => a + b.valor, 0);

    chartEntradasArea = new Chart(
        document.getElementById('chartEntradasArea'),
        {
            type: 'pie',
            data: {
                labels: area.entradas.map((i) => i.tipo),
                datasets: [
                    {
                        data: area.entradas.map((i) => i.valor),
                        backgroundColor: [
                            '#10b981',
                            '#3b82f6',
                            '#8b5cf6',
                            '#f59e0b',
                        ],
                    },
                ],
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'bottom',
                    },
                },
            },
        },
    );
    chartSaidasArea = new Chart(document.getElementById('chartSaidasArea'), {
        type: 'pie',
        data: {
            labels: area.saidas.map((i) => i.tipo),
            datasets: [
                {
                    data: area.saidas.map((i) => i.valor),
                    backgroundColor: [
                        '#ef4444',
                        '#f97316',
                        '#eab308',
                        '#84cc16',
                    ],
                },
            ],
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'bottom',
                },
            },
        },
    });
    chartComparativoArea = new Chart(
        document.getElementById('chartComparativoArea'),
        {
            type: 'bar',
            data: {
                labels: ['Entradas', 'Saídas'],
                datasets: [
                    {
                        label: 'Valor (R$)',
                        data: [totalE, totalS],
                        backgroundColor: ['#10b981', '#ef4444'],
                    },
                ],
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                    },
                },
            },
        },
    );
}

function carregarCongregacoesArea(area) {
    document.getElementById('congregacoes-grid').innerHTML = area.congregacoes
        .map((c) => {
            const saldo = c.entradas - c.saidas;
            return `<div class="area-card"><h3>${c.nome}</h3>
            <div class="linha"><span>💰 Entradas</span><strong style="color:#10b981;">R$ ${c.entradas.toLocaleString('pt-BR')}</strong></div>
            <div class="linha"><span>📤 Saídas</span><strong style="color:#ef4444;">R$ ${c.saidas.toLocaleString('pt-BR')}</strong></div>
            <div class="linha"><span>🟢 Saldo</span><strong class="${saldo >= 0 ? 'saldo-positivo' : 'saldo-negativo'}">R$ ${saldo.toLocaleString('pt-BR')}</strong></div></div>`;
        })
        .join('');
}
