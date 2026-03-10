import {
    carregarAreas,
    carregarCards,
    carregarListas,
    criarGraficos,
} from './campo/index.js';
import { AreaService } from '../Service/area.service.js';

document.addEventListener('DOMContentLoaded', () => {
    AreaService.carregarEmTodosSelects();
    carregarListas();
    carregarCards();
    criarGraficos();
    carregarAreas();
});
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
// ==================== CONTROLE DE ABAS + FILTROS (VERSÃO LIMPA) ====================
document.addEventListener('DOMContentLoaded', function () {
    const buttons = document.querySelectorAll('.btn_view');
    const sections = document.querySelectorAll('.view_section');
    const filtroArea = document.getElementById('filtro-area-container');
    const filtroCongregacao = document.getElementById(
        'filtro-congregacao-container',
    );

    function ativarView(targetId) {
        sections.forEach((s) => (s.style.display = 'none'));
        buttons.forEach((b) => b.classList.remove('active'));

        const targetDiv = document.getElementById(targetId);
        if (!targetDiv) return;
        targetDiv.style.display = 'block';

        const btnAtivo = document.querySelector(
            `.btn_view[data-target="${targetId}"]`,
        );
        if (btnAtivo) btnAtivo.classList.add('active');

        // 🔥 FILTROS CONTEXTUAIS
        if (targetId === 'view_campo') {
            filtroArea.style.display = 'none';
            filtroCongregacao.style.display = 'none';
        }
        if (targetId === 'view_areas') {
            filtroArea.style.display = 'flex';
            filtroCongregacao.style.display = 'none';
        }
        if (targetId === 'view_congregacao') {
            filtroArea.style.display = 'flex';
            filtroCongregacao.style.display = 'flex';
        }
    }

    buttons.forEach((btn) =>
        btn.addEventListener('click', () => ativarView(btn.dataset.target)),
    );
    ativarView('view_campo'); // Inicia no Campo
});
