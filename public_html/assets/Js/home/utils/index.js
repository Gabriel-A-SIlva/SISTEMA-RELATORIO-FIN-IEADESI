// js/utils.js
const Utils = {
    formatCurrency: (valor) => `R$ ${valor.toLocaleString('pt-BR')}`,

    calcularTotal: (itens) => itens.reduce((acc, item) => acc + item.valor, 0),

    calcularPercentual: (valor, total) =>
        total ? ((valor / total) * 100).toFixed(1) : '0',

    gerarHTMLCards: (totalE, totalS) => {
        const saldo = totalE - totalS;
        const superavit =
            totalE > 0 ? ((saldo / totalE) * 100).toFixed(1) : '0';

        return `
            <div class="card-total"><h4>💰 Total Entradas</h4><div class="valor-grande" style="color:#10b981;">${Utils.formatCurrency(totalE)}</div></div>
            <div class="card-total"><h4>📤 Total Saídas</h4><div class="valor-grande" style="color:#ef4444;">${Utils.formatCurrency(totalS)}</div></div>
            <div class="card-total"><h4>🟢 Saldo Geral</h4><div class="valor-grande ${saldo >= 0 ? 'saldo-positivo' : 'saldo-negativo'}">${Utils.formatCurrency(saldo)}</div></div>
            <div class="card-total"><h4>📊 Superávit</h4><div class="superavit"><i class="fa-solid fa-arrow-trend-up"></i> ${superavit}%</div></div>
        `;
    },

    // Cria gráfico de pizza reutilizável
    criarGraficoPizza: (canvasId, labels, valores, cores, chartRef) => {
        if (chartRef) chartRef.destroy();
        return new Chart(document.getElementById(canvasId), {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{ data: valores, backgroundColor: cores }],
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: { legend: { position: 'bottom' } },
            },
        });
    },

    // Cria gráfico de barras comparativo
    criarGraficoBarras: (canvasId, totalE, totalS, chartRef) => {
        if (chartRef) chartRef.destroy();
        return new Chart(document.getElementById(canvasId), {
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
                scales: { y: { beginAtZero: true } },
            },
        });
    },
};
