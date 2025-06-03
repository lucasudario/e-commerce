CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    tipoPessoa ENUM('PF', 'PJ'),
    cpf VARCHAR(14) UNIQUE,
    cnpj VARCHAR(18) UNIQUE,
    endereco VARCHAR(255),
    CHECK (
        (tipoPessoa = 'PF' AND cpf IS NOT NULL AND cnpj IS NULL) OR
        (tipoPessoa = 'PJ' AND cnpj IS NOT NULL AND cpf IS NULL)
    )
);

CREATE TABLE Produto (
    idProduto INT PRIMARY KEY,
    categoria VARCHAR(100),
    descricao TEXT,
    valor DECIMAL(10,2)
);

CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY,
    statusPedido ENUM('Aberto', 'Pago', 'Enviado', 'Entregue', 'Cancelado'),
    cliente_id INT,
    frete DECIMAL(10,2),
    dataPedido DATETIME,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(idCliente)
);

CREATE TABLE Pagamento (
    idPagamento INT PRIMARY KEY,
    pedido_id INT,
    valor DECIMAL(10,2),
    metodoPagamento ENUM('Cartão', 'Boleto', 'PIX'),
    dataPagamento DATETIME,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(idPedido)
);

CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY,
    razaoSocial VARCHAR(100),
    cnpj VARCHAR(18) UNIQUE
);

CREATE TABLE Vendedor_Terceiro (
    idVendedor INT PRIMARY KEY,
    razaoSocial VARCHAR(100),
    local VARCHAR(100)
);

CREATE TABLE Produto_Vendedor (
    vendedor_id INT,
    produto_id INT,
    quantidade INT,
    FOREIGN KEY (vendedor_id) REFERENCES Vendedor_Terceiro(idVendedor),
    FOREIGN KEY (produto_id) REFERENCES Produto(idProduto)
);

CREATE TABLE Disponibilidade_Produto (
    fornecedor_id INT,
    produto_id INT,
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (produto_id) REFERENCES Produto(idProduto)
);

CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY,
    local VARCHAR(100)
);

CREATE TABLE Produto_Estoque (
    produto_id INT,
    estoque_id INT,
    quantidade INT,
    FOREIGN KEY (produto_id) REFERENCES Produto(idProduto),
    FOREIGN KEY (estoque_id) REFERENCES Estoque(idEstoque)
);

CREATE TABLE Pedido_Produto (
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    vendedor_id INT,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(idPedido),
    FOREIGN KEY (produto_id) REFERENCES Produto(idProduto),
    FOREIGN KEY (vendedor_id) REFERENCES Vendedor_Terceiro(idVendedor)
);
