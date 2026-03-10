export function addCampoExtra(tipo) {
    const containerId =
        tipo === 'entradas' ? 'entradas-extras-list' : 'saidas-extras-list';
    const container = document.getElementById(containerId);
    if (!container) return;

    const row = document.createElement('div');
    row.classList.add('registro-dynamic-row');

    const placeholderTexto =
        tipo === 'entradas' ? 'Ex: Doação Anônima' : 'Ex: Compra de Copos';
    const classeInputValor = `valor-extra-${tipo}`;

    row.innerHTML = `
            <input type="text" class="registro-input-descricao" placeholder="${placeholderTexto}">
            <div class="registro-main-input-wrapper">
                <span class="registro-main-currency">R$</span>
                <input type="text" inputmode="numeric" placeholder="0,00" 
                    class="registro-main-input ${classeInputValor}" 
                    onkeyup="formatarMoeda(this); calcular();">
            </div>
            <button type="button" class="btn-delete-row" onclick="removerCampoExtra(this)">
                <i class="fa-solid fa-xmark"></i>
            </button>
        `;

    container.appendChild(row);
}

export function removerCampoExtra(btn) {
    btn.closest('.registro-dynamic-row').remove();
    window.calcular(); // Chama do objeto global
}
