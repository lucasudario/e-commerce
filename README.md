# 🛒 Projeto E-commerce Multivendedor

Este projeto é um sistema de e-commerce completo onde múltiplos vendedores podem oferecer produtos para compra por clientes do tipo pessoa física (PF) ou jurídica (PJ). O sistema controla pedidos, frete, pagamentos, estoque, fornecedores e a relação de produtos por vendedor.

---

## ⚙️ Funcionalidades

- Cadastro de clientes (PF ou PJ, nunca ambos).
- Cadastro único por e-mail.
- Controle de produtos com categorias, descrição e valor.
- Pedidos com cálculo de frete no momento da compra.
- Registro e rastreamento do status do pedido.
- Pagamento associado ao pedido (PIX, Boleto, Cartão).
- Relacionamento entre produtos, vendedores e fornecedores.
- Controle de estoque por localidade.

---

## 🗃️ Modelo de Dados (Resumido)

### Cliente
- `idCliente`, `nome`, `email` (único), `tipoPessoa` (PF/PJ), `cpf`, `cnpj`, `endereco`.

### Produto
- `idProduto`, `categoria`, `descricao`, `valor`.

### Pedido
- `idPedido`, `statusPedido`, `cliente_id`, `frete`, `dataPedido`.

### Pagamento
- `idPagamento`, `pedido_id`, `valor`, `metodoPagamento`, `dataPagamento`.

### Fornecedor
- `idFornecedor`, `razaoSocial`, `cnpj`.

### Vendedor_Terceiro
- `idVendedor`, `razaoSocial`, `local`.

### Estoque
- `idEstoque`, `local`.

---

## 🔗 Relacionamentos

- Um **cliente** pode fazer vários **pedidos**.
- Um **pedido** pode conter vários **produtos**.
- Um **produto** pode estar disponível por vários **vendedores**.
- Cada **produto** é controlado em locais de **estoque**.
- Cada **pedido** tem um **pagamento** associado.
- **Fornecedores** abastecem **produtos**.

---

## 📁 Estrutura de Arquivos (esperada)

