export function toggleRegistroMain() {
    const mainSection = document.querySelector('.main-registro');
    const divPeriodo = document.querySelector('#filtro-tempo-registro');
    if (
        mainSection.style.display === 'none' ||
        mainSection.style.display === ''
    ) {
        mainSection.style.display = 'flex';
        divPeriodo.style.display = 'none';
    }
}

export function abrirRegistroModal(tipo) {
    const overlay = document.getElementById('registro-modal-overlay');
    const modalArea = document.getElementById('modal-registro-area');
    const modalCong = document.getElementById('modal-registro-congregacao');

    overlay.style.display = 'flex';
    if (tipo === 'area') {
        modalArea.style.display = 'block';
        modalCong.style.display = 'none';
    } else if (tipo === 'congregacao') {
        modalCong.style.display = 'block';
        modalArea.style.display = 'none';
    }
}

export function fecharRegistroModal() {
    document.getElementById('registro-modal-overlay').style.display = 'none';
}

export function initMobileFechamento() {
    const btnAbrir = document.getElementById('btn-abrir-fechamento');
    const painelFechamento = document.querySelector('.col-fechamento');
    const overlay = document.getElementById('overlay-mobile');

    function toggleFechamento() {
        painelFechamento.classList.toggle('open');
        overlay.classList.toggle('open');

        const arrow = btnAbrir.querySelector('.arrow');
        if (painelFechamento.classList.contains('open')) {
            arrow.classList.remove('fa-chevron-left');
            arrow.classList.add('fa-times');
        } else {
            arrow.classList.remove('fa-times');
            arrow.classList.add('fa-chevron-left');
        }
    }

    if (btnAbrir && painelFechamento) {
        btnAbrir.addEventListener('click', toggleFechamento);
        overlay.addEventListener('click', toggleFechamento);

        document.addEventListener('keydown', (e) => {
            if (
                e.key === 'Escape' &&
                painelFechamento.classList.contains('open')
            ) {
                toggleFechamento();
            }
        });
    }
}
