<div class="col-fechamento">
    <div class="sticky-box">
        <div class="total-box">
            <h3 class="fechamento-title">FECHAMENTO</h3>

            <div class="fechamento-content">
                <!-- seu conteúdo atual -->
                <div class="linha"><span class="label">Total Entradas</span><span id="fech-total-entradas"
                        class="valor">R$ 0,00</span></div>
                <div class="divider"></div>
                <div class="linha"><span class="label">Total Saídas</span><span id="fech-total-saidas" class="valor">R$
                        0,00</span></div>
                <div class="divider"></div>
                <div class="linha saldo">
                    <span class="saldo-label">SALDO FINAL</span>
                    <span id="saldo-final" class="saldo-valor">R$ 0,00</span>
                </div>
                <div class="transportar-box">
                    <div class="linha transportar">
                        <span class="transportar-label">VALOR A TRANSPORTAR</span>
                        <span id="valor-transportar" class="transportar-valor">R$ 0,00</span>
                    </div>
                </div>
            </div>

            <!-- BOTÕES MOBILE DENTRO DO PAINEL -->
            <div class="fechamento-actions-mobile">
                <button onclick="salvarRelatorio()" class="btn-mobile-salvar">
                    <i class="fa-solid fa-floppy-disk"></i> SALVAR RELATÓRIO
                </button>
                <button onclick="limparFormulario()" class="btn-mobile-limpar">
                    <i class="fa-solid fa-trash"></i> LIMPAR TUDO
                </button>
            </div>
        </div>
    </div>
</div>

<!-- OVERLAY MOBILE -->
<div id="overlay-mobile" class="overlay-mobile"></div>