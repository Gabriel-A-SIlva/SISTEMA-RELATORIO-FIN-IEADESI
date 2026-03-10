import { AreaService } from '../../Service/area.service.js'; // ajuste o caminho
import { CongregacaoService } from '../../Service/congregacao.service.js'; // ajuste o caminho

document.addEventListener('DOMContentLoaded', () => {
    // ==================== FORMULÁRIO ÁREA ====================
    const formArea = document.getElementById('form-registro-area');
    if (formArea) {
        formArea.addEventListener('submit', async (e) => {
            e.preventDefault();

            const dados = Object.fromEntries(new FormData(formArea));

            const result = await AreaService.criar(dados);

            if (result.status === 'success') {
                alert('✅ Área criada com sucesso!');
                fecharRegistroModal();
                formArea.reset();

                // Atualiza TODOS os selects de área automaticamente
                await AreaService.carregarEmTodosSelects();
            } else {
                alert('❌ ' + (result.message || 'Erro ao salvar área'));
            }
        });
    }

    // ==================== FORMULÁRIO CONGREGAÇÃO ====================
    const formCong = document.getElementById('form-registro-congregacao');
    if (formCong) {
        formCong.addEventListener('submit', async (e) => {
            e.preventDefault();

            const dados = Object.fromEntries(new FormData(formCong));

            const result = await CongregacaoService.criar(dados);

            if (result.status === 'success') {
                alert('✅ Congregação criada com sucesso!');
                fecharRegistroModal();
                formCong.reset();

                // Atualiza selects de congregação (se você usar em outro lugar)
                await CongregacaoService.carregarEmTodosSelects();
            } else {
                alert('❌ ' + (result.message || 'Erro ao salvar congregação'));
            }
        });
    }
});
