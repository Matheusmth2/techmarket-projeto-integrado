// Lista de transações simuladas
const transacoes = [
  { descricao: "Pagamento no site", valor: 340.00, data: "01/10/2025" },
  { descricao: "Compra em Eletrônicos", valor: 7200.00, data: "05/10/2025" },
  { descricao: "Assinatura mensal", valor: 49.90, data: "08/10/2025" },
  { descricao: "Transferência bancária", valor: 12000.00, data: "15/10/2025" },
  { descricao: "Compra de roupas", valor: 210.00, data: "16/10/2025" }
];

const container = document.getElementById("extrato");

// Formata valores como moeda brasileira
function formatarReal(valor) {
  return valor.toLocaleString('pt-BR', {
    style: 'currency',
    currency: 'BRL'
  });
}

// Cria e insere os elementos das transações no HTML
transacoes.forEach(t => {
  const transacaoEl = document.createElement("div");
  transacaoEl.classList.add("transacao");

  // Destaque se o valor for maior que 5000
  if (t.valor > 5000) {
    transacaoEl.classList.add("alta");
  }

  transacaoEl.innerHTML = `
    <strong>${t.descricao}</strong>
    <span>${formatarReal(t.valor)} - ${t.data}</span>
  `;

  container.appendChild(transacaoEl);
});
