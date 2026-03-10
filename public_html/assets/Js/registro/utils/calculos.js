import { getValor } from './index.js';

export function calcular() {
    // 1. Entradas Fixas
    let entradas = [
        getValor('oferta-ordinaria'),
        getValor('oferta-voto'),
        getValor('oferta-escola'),
        getValor('oferta-construcao'),
        getValor('oferta-extra'),
        getValor('oferta-missao'),
        getValor('dizimo'),
    ].reduce((a, b) => a + b, 0);

    // Entradas Dinâmicas
    document.querySelectorAll('.valor-extra-entradas').forEach((el) => {
        entradas +=
            parseFloat(el.value.replace(/\./g, '').replace(',', '.')) || 0;
    });

    const saldoAnterior = getValor('saldo-anterior');
    const totalEntradas = saldoAnterior + entradas;

    // 2. Saídas Fixas
    let saidas = [
        getValor('energia-agua'),
        getValor('material-limpeza'),
        getValor('manutencao'),
        getValor('evangelizacao'),
        getValor('material-expediente'),
        getValor('repasse-central'),
        getValor('dirigente-80'),
        getValor('dizimo-dirigente'),
        getValor('secretaria'),
        getValor('maestro'),
        getValor('construcao-saida'),
        getValor('vigia'),
        getValor('zeladora'),
        getValor('aluguel'),
        getValor('ajuda'),
        getValor('equipamento'),
        getValor('santa-ceia'),
        getValor('ebd'),
        getValor('moveis'),
        getValor('hospedagem'),
        getValor('criancas'),
        getValor('despesas-extras'),
    ].reduce((a, b) => a + b, 0);

    // Saídas Dinâmicas
    document.querySelectorAll('.valor-extra-saidas').forEach((el) => {
        saidas +=
            parseFloat(el.value.replace(/\./g, '').replace(',', '.')) || 0;
    });

    const saldoFinal = totalEntradas - saidas;

    // 3. Atualizar Interface
    const formatar = (val) =>
        val.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });

    document.getElementById('total-entradas').textContent =
        formatar(totalEntradas);
    document.getElementById('total-saidas').textContent = formatar(saidas);
    document.getElementById('fech-total-entradas').textContent =
        formatar(totalEntradas);
    document.getElementById('fech-total-saidas').textContent = formatar(saidas);

    const saldoEl = document.getElementById('saldo-final');
    saldoEl.textContent = formatar(saldoFinal);
    saldoEl.classList.toggle('text-[#f6220e]', saldoFinal < 0);

    document.getElementById('valor-transportar').textContent =
        formatar(saldoFinal);
}
