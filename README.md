# TechMarket: Projeto Integrado Interdisciplinar

Projeto acadêmico desenvolvido por **Matheus de Medeiros Sousa** no 4º semestre do curso de Tecnologia em Análise e Desenvolvimento de Sistemas (Unopar), componente *Projeto Integrado Interdisciplinar* (2025/2). O cenário é uma empresa fictícia de e-commerce, a **TechMarket**, com problemas técnicos em picos de acesso, transações financeiras, interface mobile, banco de dados e cadastro.

## Conteúdo

| Pasta | O que é | Tecnologias |
|---|---|---|
| `api/` | API REST de transferência entre contas, com validação de dados, validação de saldo e geração de ID único por transação | Node.js, Express, body-parser, uuid |
| `web-extrato/` | Extrato de transações responsivo para desktop e mobile, com destaque em vermelho para valores acima de R$ 5.000 | HTML, CSS, JavaScript |
| `sql/` | Banco de dados, tabelas e *stored procedure* que calcula o saldo e lista as 10 últimas transações de um cliente em um período | MySQL |
| `web-cadastro/` | Formulário de abertura de conta com validação de CPF (11 dígitos), idade mínima de 18 anos e telefone (11 dígitos) | HTML, CSS, JavaScript |

A proposta de arquitetura em nuvem (escalonamento horizontal, microsserviços, Docker/Kubernetes, auto scaling e balanceamento de carga) faz parte do relatório do projeto e **não está implementada neste repositório**.

## Como executar

**API**
```bash
cd api
npm install
npm start
```
Exemplo de requisição:
```bash
curl -X POST http://localhost:3000/api/transferencia \
  -H "Content-Type: application/json" \
  -d '{"contaOrigem":"12345","contaDestino":"76498","valor":1500}'
```

**Páginas web:** abra `web-extrato/index.html` e `web-cadastro/index.html` no navegador.

**Banco de dados:** execute `sql/techmarket.sql` no MySQL Workbench (ou outro cliente MySQL).

## Origem do código (importante)

Os arquivos originais do projeto foram perdidos. Este repositório foi **reconstruído por transcrição dos prints do código no meu portfólio do projeto (outubro de 2025)**. Alterações feitas na transcrição:

1. `api/index.js`: corrigi um erro de digitação (`conta[contaDestino]` para `contas[contaDestino]`), que causaria erro de execução.
2. `web-cadastro/js/script.js`: a linha da validação de idade estava cortada no print, e completei a condição com a lógica usual de verificação do aniversário.
3. `api/package.json`: recriado, com as dependências usadas no código.
4. `sql/techmarket.sql`: os trechos de SQL foram reunidos em um único arquivo.

O repositório foi publicado depois do projeto original, então as datas dos *commits* refletem a publicação, e não o desenvolvimento.

## Limitações

Projeto didático: os dados da API ficam em memória (sem banco de dados), não há autenticação e o extrato usa dados simulados.
