<div class="registro-main-card registro-main--saida">

    <div class="registro-main-header">
        <div class="registro-main-icon">
            <svg fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.25 18L9 11.25l4.306 4.307a11.95 11.95 0 015.814-5.519l2.74-1.22m0 0l-5.94-2.28m5.94 2.28l-2.28 5.941" />
            </svg>
        </div>
        <h2 class="registro-main-title">SAÍDAS</h2>
    </div>

    <div class="registro-main-grid">
        <div class="registro-main-item">
            <span class="registro-main-label-item">Energia / Água</span>
            <div class="registro-main-input-wrapper">
                <span class="registro-main-currency">R$</span>
                <input id="energia-agua" type="text" inputmode="numeric" placeholder="0,00"
                    onkeyup="formatarMoeda(this); calcular();" class="registro-main-input" />
            </div>
        </div>

        <div class="registro-main-item">
            <span class="registro-main-label-item">Material de Limpeza</span>
            <div class="registro-main-input-wrapper">
                <span class="registro-main-currency">R$</span>
                <input id="material-limpeza" type="text" inputmode="numeric" placeholder="0,00"
                    onkeyup="formatarMoeda(this); calcular();" class="registro-main-input" />
            </div>
        </div>

        <div class="registro-main-item">
            <span class="registro-main-label-item">Manutenção de Patrimônio</span>
            <div class="registro-main-input-wrapper">
                <span class="registro-main-currency">R$</span>
                <input id="manutencao" type="text" inputmode="numeric" placeholder="0,00"
                    onkeyup="formatarMoeda(this); calcular();" class="registro-main-input" />
            </div>
        </div>

        <div class="registro-main-item">
            <span class="registro-main-label-item">Evangelização e Missão</span>
            <div class="registro-main-input-wrapper">
                <span class="registro-main-currency">R$</span>
                <input id="evangelizacao" type="text" inputmode="numeric" placeholder="0,00"
                    onkeyup="formatarMoeda(this); calcular();" class="registro-main-input" />
            </div>
        </div>

        <div class="registro-main-item">
            <span class="registro-main-label-item">Construção</span>
            <div class="registro-main-input-wrapper">
                <span class="registro-main-currency">R$</span>
                <input id="construcao-saida" type="text" inputmode="numeric" placeholder="0,00"
                    onkeyup="formatarMoeda(this); calcular();" class="registro-main-input" />
            </div>
        </div>

        <div class="registro-main-item">
            <span class="registro-main-label-item">Aluguel</span>
            <div class="registro-main-input-wrapper">
                <span class="registro-main-currency">R$</span>
                <input id="aluguel" type="text" inputmode="numeric" placeholder="0,00"
                    onkeyup="formatarMoeda(this); calcular();" class="registro-main-input" />
            </div>
        </div>

        <div class="registro-main-item">
            <span class="registro-main-label-item">Despesas Extras</span>
            <div class="registro-main-input-wrapper">
                <span class="registro-main-currency">R$</span>
                <input id="despesas-extras" type="text" inputmode="numeric" placeholder="0,00"
                    onkeyup="formatarMoeda(this); calcular();" class="registro-main-input" />
            </div>
        </div>
    </div>
    <!-- ENTRADAS EXTRAS DINÂMICAS -->
    <hr class="registro-main-divider">

    <div class="registro-dynamic-section">
        <h4 class="registro-dynamic-title">Outras Saídas</h4>
        <div id="saidas-extras-list" class="registro-dynamic-list">
        </div>
        <button type="button" class="registro-btn-add" onclick="addCampoExtra('saidas')">
            + Adicionar Nova Saída
        </button>
    </div>
    <div class="registro-main-total-box">
        <span class="registro-main-total-label">TOTAL SAÍDAS</span>
        <span id="total-saidas" class="registro-main-total-valor">R$ 0,00</span>
    </div>

</div>