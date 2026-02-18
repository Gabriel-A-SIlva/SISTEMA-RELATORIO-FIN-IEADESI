<div class="registro-coluna">
    <div class="registro-card registro--entrada">

        <!-- HEADER -->
        <div class="registro-header">
            <div class="registro-icone">💰</div>
            <h2 class="registro-titulo">ENTRADAS</h2>
        </div>

        <!-- SALDO ANTERIOR -->
        <div class="registro-saldo-anterior">
            <label class="registro-label">
                SALDO ANTERIOR
            </label>

            <div class="registro-input-grande-wrapper">
                <span class="registro-prefixo">R$</span>
                <input id="saldo-anterior" type="text" onkeyup="formatarMoeda(this); calcular();"
                    class="registro-input-grande" />
            </div>
        </div>

        <!-- LISTA DE ENTRADAS -->
        <div class="registro-lista">

            <div class="registro-item">
                <span class="registro-nome">Oferta Ordinária</span>
                <div class="registro-input-wrapper">
                    <span class="registro-prefixo">R$</span>
                    <input id="oferta-ordinaria" type="text" onkeyup="formatarMoeda(this); calcular();"
                        class="registro-input" />
                </div>
            </div>

            <div class="registro-item">
                <span class="registro-nome">Oferta - Voto</span>
                <div class="registro-input-wrapper">
                    <span class="registro-prefixo">R$</span>
                    <input id="oferta-voto" type="text" onkeyup="formatarMoeda(this); calcular();"
                        class="registro-input" />
                </div>
            </div>

            <div class="registro-item">
                <span class="registro-nome">Oferta - Escola Dominical</span>
                <div class="registro-input-wrapper">
                    <span class="registro-prefixo">R$</span>
                    <input id="oferta-escola" type="text" onkeyup="formatarMoeda(this); calcular();"
                        class="registro-input" />
                </div>
            </div>

            <div class="registro-item">
                <span class="registro-nome">Oferta - Construção</span>
                <div class="registro-input-wrapper">
                    <span class="registro-prefixo">R$</span>
                    <input id="oferta-construcao" type="text" onkeyup="formatarMoeda(this); calcular();"
                        class="registro-input" />
                </div>
            </div>

            <div class="registro-item">
                <span class="registro-nome">Oferta - Extraordinária</span>
                <div class="registro-input-wrapper">
                    <span class="registro-prefixo">R$</span>
                    <input id="oferta-extra" type="text" onkeyup="formatarMoeda(this); calcular();"
                        class="registro-input" />
                </div>
            </div>

            <div class="registro-item">
                <span class="registro-nome">Oferta - Evangelização e Missão</span>
                <div class="registro-input-wrapper">
                    <span class="registro-prefixo">R$</span>
                    <input id="oferta-missao" type="text" onkeyup="formatarMoeda(this); calcular();"
                        class="registro-input" />
                </div>
            </div>

            <div class="registro-item">
                <span class="registro-nome">Dízimo</span>
                <div class="registro-input-wrapper">
                    <span class="registro-prefixo">R$</span>
                    <input id="dizimo" type="text" onkeyup="formatarMoeda(this); calcular();" class="registro-input" />
                </div>
            </div>

        </div>

        <!-- TOTAL -->
        <div class="registro-total-box">
            <span class="registro-total-label">
                TOTAL ENTRADAS
            </span>
            <span id="total-entradas" class="registro-total-valor">
                R$ 0,00
            </span>
        </div>

    </div>
</div>