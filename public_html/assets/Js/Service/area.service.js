export const AreaService = {
    async listar() {
        try {
            const response = await fetch('/area/read');
            const result = await response.json();

            if (result.status !== 'success') {
                throw new Error('Erro ao carregar áreas');
            }

            return result.data;
        } catch (error) {
            console.error('Erro AreaService:', error);
            return [];
        }
    },
    /* CREATE - Criar nova área
    async criar(dadosArea) {
        try {
            const response = await fetch('/area/create', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(dadosArea),
            });
            return await response.json();
        } catch (error) {
            console.error('Erro ao criar área:', error);
            return { status: 'error', message: 'Falha na conexão' };
        }
    },*/
    async carregarEmTodosSelects() {
        const areas = await this.listar();

        if (!areas.length) return;

        // Seleciona TODOS os selects que possuem data-area-select
        const selects = document.querySelectorAll('select[data-area-select]');

        selects.forEach((select) => {
            // Limpa antes
            select.innerHTML =
                '<option value="" disabled selected>Selecione a área...</option>';

            areas.forEach((area) => {
                const option = document.createElement('option');
                option.value = area.id;
                option.textContent = `Área ${area.area_numero}`;

                select.appendChild(option);
            });
        });
    },
};
