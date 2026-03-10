export const CongregacaoService = {
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
    async listarPorArea(areaId = '') {
        let url = '/congregacao/read';
        if (areaId) url += `?area_id=${encodeURIComponent(areaId)}`;

        try {
            const response = await fetch(url);
            const result = await response.json();
            console.log(result.data);

            if (result.status !== 'success') {
                throw new Error(
                    result.message || 'Erro ao carregar congregações',
                );
            }
            return result.data;
        } catch (error) {
            console.error('Erro CongregacaoService.listarPorArea:', error);
            return [];
        }
    },
};
