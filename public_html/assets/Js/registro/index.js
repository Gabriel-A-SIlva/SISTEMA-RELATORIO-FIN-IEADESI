// Importações
import { formatarMoeda, setHoje, initDatas } from './modules/utils.js';
import { calcular } from './modules/calculos.js';
import { addCampoExtra, removerCampoExtra } from './modules/dinamicos.js';
import {
    toggleRegistroMain,
    abrirRegistroModal,
    fecharRegistroModal,
    initMobileFechamento,
} from './modules/ui.js';
import { salvarRelatorio, limparFormulario } from './modules/form.js';

// Expondo para o objeto global (window) pois seu HTML usa eventos inline (onclick, onkeyup)
window.formatarMoeda = formatarMoeda;
window.calcular = calcular;
window.setHoje = setHoje;
window.addCampoExtra = addCampoExtra;
window.removerCampoExtra = removerCampoExtra;
window.toggleRegistroMain = toggleRegistroMain;
window.abrirRegistroModal = abrirRegistroModal;
window.fecharRegistroModal = fecharRegistroModal;
window.salvarRelatorio = salvarRelatorio;
window.limparFormulario = limparFormulario;

// Inicializadores automáticos ao carregar a página
document.addEventListener('DOMContentLoaded', () => {
    initDatas();
    initMobileFechamento();
});
