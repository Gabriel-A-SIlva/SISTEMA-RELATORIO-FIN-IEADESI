export function formatarMoeda(input) {
    let valor = input.value.replace(/\D/g, '');
    if (valor === '') {
        input.value = '';
        return;
    }
    valor = (parseFloat(valor) / 100).toLocaleString('pt-BR', {
        minimumFractionDigits: 2,
    });
    input.value = valor;
}

export function getValor(id) {
    const el = document.getElementById(id);
    if (!el || !el.value) return 0;
    return parseFloat(el.value.replace(/\./g, '').replace(',', '.')) || 0;
}

export function setHoje() {
    const hoje = new Date().toISOString().split('T')[0];
    document.getElementById('data-relatorio').value = hoje;
}

export function initDatas() {
    const dataInicio = document.getElementById('data-inicio');
    if (dataInicio) {
        dataInicio.addEventListener('change', function () {
            if (!this.value) return;
            const inicio = new Date(this.value);
            const fim = new Date(inicio);
            fim.setDate(fim.getDate() + 6);
            document.getElementById('data-fim').value = fim
                .toISOString()
                .split('T')[0];
        });
    }
}
