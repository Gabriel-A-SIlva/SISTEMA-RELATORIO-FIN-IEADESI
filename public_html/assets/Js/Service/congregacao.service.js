export const CongregacaoService = {
    // READ - Listar todas as congregações
    async listar() {
        try {
            const response = await fetch('/congregacao/read');
            const result = await response.json();

            if (result.status !== 'success') {
                throw new Error(
                    result.message || 'Erro ao carregar congregações',
                );
            }
            return result.data;
        } catch (error) {
            console.error('Erro CongregacaoService:', error);
            return [];
        }
    },

    // CREATE - Criar nova congregação
    async criar(dadosCongregacao) {
        try {
            const response = await fetch('/congregacao/create', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(dadosCongregacao),
            });
            return await response.json();
        } catch (error) {
            console.error('Erro ao criar congregação:', error);
            return { status: 'error', message: 'Falha na conexão' };
        }
    },

    // Preenche todos os selects que tiverem o atributo data-congregacao-select
    async carregarEmTodosSelects() {
        const congregacoes = await this.listar();

        if (!congregacoes.length) return;

        const selects = document.querySelectorAll(
            'select[data-congregacao-select]',
        );

        selects.forEach((select) => {
            select.innerHTML =
                '<option value="" disabled selected>Selecione a congregação...</option>';

            congregacoes.forEach((cong) => {
                const option = document.createElement('option');
                option.value = cong.id;
                // Ajuste 'nome' para o campo exato que vem do seu banco (ex: cong.nome_fantasia)
                option.textContent = cong.nome;
                select.appendChild(option);
            });
        });
    },
};
