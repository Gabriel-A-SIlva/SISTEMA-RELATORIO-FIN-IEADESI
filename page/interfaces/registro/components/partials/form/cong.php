<div class="registro-modal" id="modal-registro-congregacao">
    <div class="registro-modal-header">
        <h3>Nova Congregação</h3>
        <button class="registro-modal-close" onclick="fecharRegistroModal()">×</button>
    </div>
    <form id="form-registro-congregacao" class="registro-form">
        <div class="registro-form-group">
            <label for="registro-id-area">Área Pertencente</label>
            <select id="registro-id-area" name="id_area" required data-area-select>
                <option value="" disabled selected>Selecione uma área...</option>
            </select>
        </div>
        <div class="registro-form-group">
            <label for="registro-cong-nome">Nome da Congregação</label>
            <input type="text" id="registro-cong-nome" name="nome" placeholder="Ex: Gileade" required>
        </div>
        <div class="registro-modal-footer">
            <button type="button" class="registro-btn-cancelar" onclick="fecharRegistroModal()">Cancelar</button>
            <button type="submit" class="registro-btn-salvar">Salvar Congregação</button>
        </div>
    </form>
</div>