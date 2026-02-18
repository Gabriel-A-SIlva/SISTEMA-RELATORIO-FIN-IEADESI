// ==================== MENU SIDEBAR - ITEM ATIVO ====================
let list = document.querySelectorAll('.navigation li');

function activeLink() {
    // Remove a classe de todos os itens
    list.forEach((item) => {
        item.classList.remove('hovered');
    });
    // Adiciona apenas no item clicado
    this.classList.add('hovered');
}

// Adiciona evento de CLIQUE (não mais mouseover)
list.forEach((item) => {
    item.addEventListener('click', activeLink);
});
