<div class="registro-main-card registro-main--entrada">

    <div class="registro-main-header">
        <div class="registro-main-icon">
            <svg fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round"
                    d="M12 6v12m-3-2.818l.879.659c1.171.879 3.07.879 4.242 0 1.172-.879 1.172-2.303 0-3.182C13.536 12.219 12.768 12 12 12c-.725 0-1.45-.22-2.003-.659-1.106-.879-1.106-2.303 0-3.182s2.9-.879 4.006 0l.415.33M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
        </div>
        <h2 class="registro-main-title">ENTRADAS</h2>
    </div>

    <div class="registro-main-destaque">
        <label class="registro-main-label">SALDO ANTERIOR CAIXA</label>
        <div class="registro-main-input-wrapper grande">
            <span class="registro-main-currency">R$</span>
            <input id="saldo-anterior" type="text" inputmode="numeric" placeholder="0,00"
                onkeyup="formatarMoeda(this); calcular();" class="registro-main-input" />
        </div>
    </div>

    <hr class="registro-main-divider">

    <div class="registro-main-grid">
        <div class="registro-main-item">
            <span class="registro-main-label-item">Oferta Ordinária</span>
            <div class="registro-main-input-wrapper">
                <span class="registro-main-currency">R$</span>
                <input id="oferta-ordinaria" type="text" inputmode="numeric" placeholder="0,00"
                    onkeyup="formatarMoeda(this); calcular();" class="registro-main-input" />
            </div>
        </div>

        <div class="registro-main-item">
            <span class="registro-main-label-item">Oferta - Voto</span>
            <div class="registro-main-input-wrapper">
                <span class="registro-main-currency">R$</span>
                <input id="oferta-voto" type="text" inputmode="numeric" placeholder="0,00"
                    onkeyup="formatarMoeda(this); calcular();" class="registro-main-input" />
            </div>
        </div>

        <div class="registro-main-item">
            <span class="registro-main-label-item">Oferta - Escola Dominical</span>
            <div class="registro-main-input-wrapper">
                <span class="registro-main-currency">R$</span>
                <input id="oferta-escola" type="text" inputmode="numeric" placeholder="0,00"
                    onkeyup="formatarMoeda(this); calcular();" class="registro-main-input" />
            </div>
        </div>

        <div class="registro-main-item">
            <span class="registro-main-label-item">Oferta - Construção</span>
            <div class="registro-main-input-wrapper">
                <span class="registro-main-currency">R$</span>
                <input id="oferta-construcao" type="text" inputmode="numeric" placeholder="0,00"
                    onkeyup="formatarMoeda(this); calcular();" class="registro-main-input" />
            </div>
        </div>

        <div class="registro-main-item">
            <span class="registro-main-label-item">Oferta - Extraordinária</span>
            <div class="registro-main-input-wrapper">
                <span class="registro-main-currency">R$</span>
                <input id="oferta-extra" type="text" inputmode="numeric" placeholder="0,00"
                    onkeyup="formatarMoeda(this); calcular();" class="registro-main-input" />
            </div>
        </div>

        <div class="registro-main-item">
            <span class="registro-main-label-item">Oferta - Missões</span>
            <div class="registro-main-input-wrapper">
                <span class="registro-main-currency">R$</span>
                <input id="oferta-missao" type="text" inputmode="numeric" placeholder="0,00"
                    onkeyup="formatarMoeda(this); calcular();" class="registro-main-input" />
            </div>
        </div>

        <div class="registro-main-item">
            <span class="registro-main-label-item">Dízimos</span>
            <div class="registro-main-input-wrapper">
                <span class="registro-main-currency">R$</span>
                <input id="dizimo" type="text" inputmode="numeric" placeholder="0,00"
                    onkeyup="formatarMoeda(this); calcular();" class="registro-main-input" />
            </div>
        </div>
    </div>


    <div class="registro-dynamic-section">
        <h4 class="registro-dynamic-title">Outras Entradas</h4>
        <div id="entradas-extras-list" class="registro-dynamic-list">
        </div>
        <button type="button" class="registro-btn-add" onclick="addCampoExtra('entradas')">
            + Adicionar Nova Entrada
        </button>
    </div>
    <div class="registro-main-total-box">
        <span class="registro-main-total-label">TOTAL ENTRADAS</span>
        <span id="total-entradas" class="registro-main-total-valor">R$ 0,00</span>
    </div>

</div>