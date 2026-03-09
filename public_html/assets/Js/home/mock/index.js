export const dadosResumoAreas = [
    {
        nome: 'Área 1 - Norte',
        entradas: 80000,
        saidas: 60000,
    },
    {
        nome: 'Área 2 - Sul',
        entradas: 50000,
        saidas: 52000,
    },
    {
        nome: 'Área 3 - Leste',
        entradas: 54000,
        saidas: 40000,
    },
];
// ======================== DADOS MOCK (substitua pelo fetch da sua API) ========================
export const dadosCampo = {
    entradas: [
        {
            tipo: 'Dízimo',
            valor: 85000,
        },
        {
            tipo: 'Oferta Ordinária',
            valor: 40200,
        },
        {
            tipo: 'Oferta Missão',
            valor: 18400,
        },
        {
            tipo: 'Construção',
            valor: 22000,
        },
        {
            tipo: 'Extraordinária',
            valor: 6000,
        },
    ],
    saidas: [
        {
            tipo: 'Energia/Água',
            valor: 22000,
        },
        {
            tipo: 'Aluguel',
            valor: 30000,
        },
        {
            tipo: 'Manutenção',
            valor: 18500,
        },
        {
            tipo: 'Construção',
            valor: 12000,
        },
        {
            tipo: 'Despesas Extras',
            valor: 9800,
        },
    ],
};
// ======================== DADOS MOCK (pode vir da API depois) ========================
export const dadosPorArea = {
    1: {
        nome: 'Área 1 - Norte',
        entradas: [
            {
                tipo: 'Dízimo',
                valor: 85000,
            },
            {
                tipo: 'Oferta Ordinária',
                valor: 40200,
            },
            {
                tipo: 'Oferta Missão',
                valor: 18400,
            },
            {
                tipo: 'Construção',
                valor: 22000,
            },
        ],
        saidas: [
            {
                tipo: 'Energia/Água',
                valor: 22000,
            },
            {
                tipo: 'Aluguel',
                valor: 30000,
            },
            {
                tipo: 'Manutenção',
                valor: 18500,
            },
            {
                tipo: 'Despesas Extras',
                valor: 9800,
            },
        ],
        congregacoes: [
            {
                nome: 'Congregação Central',
                entradas: 42000,
                saidas: 31000,
            },
            {
                nome: 'Congregação Nova Esperança',
                entradas: 28000,
                saidas: 19500,
            },
            {
                nome: 'Congregação Betel',
                entradas: 35000,
                saidas: 28000,
            },
        ],
    },
    2: {
        nome: 'Área 2 - Sul',
        entradas: [
            {
                tipo: 'Dízimo',
                valor: 62000,
            },
            {
                tipo: 'Oferta Ordinária',
                valor: 31500,
            },
            {
                tipo: 'Oferta Missão',
                valor: 12800,
            },
        ],
        saidas: [
            {
                tipo: 'Aluguel',
                valor: 24500,
            },
            {
                tipo: 'Energia/Água',
                valor: 17800,
            },
            {
                tipo: 'Manutenção',
                valor: 14200,
            },
        ],
        congregacoes: [
            {
                nome: 'Congregação Sul A',
                entradas: 29000,
                saidas: 27500,
            },
            {
                nome: 'Congregação Paz',
                entradas: 22500,
                saidas: 19800,
            },
        ],
    },
    3: {
        nome: 'Área 3 - Leste',
        entradas: [
            {
                tipo: 'Dízimo',
                valor: 71000,
            },
            {
                tipo: 'Oferta Ordinária',
                valor: 38000,
            },
            {
                tipo: 'Construção',
                valor: 19500,
            },
        ],
        saidas: [
            {
                tipo: 'Energia/Água',
                valor: 21000,
            },
            {
                tipo: 'Aluguel',
                valor: 27000,
            },
            {
                tipo: 'Despesas Extras',
                valor: 11500,
            },
        ],
        congregacoes: [
            {
                nome: 'Congregação Leste 1',
                entradas: 33000,
                saidas: 24000,
            },
            {
                nome: 'Congregação Filadélfia',
                entradas: 24500,
                saidas: 21000,
            },
        ],
    },
};
