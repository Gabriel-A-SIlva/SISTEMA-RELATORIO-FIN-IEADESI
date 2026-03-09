<div class="registro-modal" id="modal-registro-area">
    <div class="registro-modal-header">
        <h3>Nova Área</h3>
        <button class="registro-modal-close" onclick="fecharRegistroModal()">×</button>
    </div>
    <form id="form-registro-area" class="registro-form">
        <div class="registro-form-group">
            <label for="registro-area-numero">Número da Área</label>
            <input type="number" id="registro-area-numero" name="area_numero" placeholder="Ex: 15" required>
            <small>Insira apenas o número identificador da área.</small>
        </div>
        <div class="registro-modal-footer">
            <button type="button" class="registro-btn-cancelar" onclick="fecharRegistroModal()">Cancelar</button>
            <button type="submit" class="registro-btn-salvar">Salvar Área</button>
        </div>
    </form>
</div>