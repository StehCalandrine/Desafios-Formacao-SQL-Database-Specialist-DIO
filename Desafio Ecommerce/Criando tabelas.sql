CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE Clientes(
	id_Cliente INT auto_increment PRIMARY KEY,
    Nome_Completo VARCHAR(45),
    Endereço VARCHAR(45),
	CPF CHAR (11) NOT NULL,
    CNPJ VARCHAR(18),
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF),
    CONSTRAINT unique_cnpj_cliente UNIQUE (CNPJ)
    );

DESC Clientes;

CREATE TABLE Produtos(
	id_Produto INT auto_increment PRIMARY KEY,
    Descrição VARCHAR(45),
    Categoria VARCHAR(45),
	Valor FLOAT
);

DESC Produtos;

CREATE TABLE Pagamentos(
	id_Pagamento INT auto_increment PRIMARY KEY,
    PagamentoCliente INT,
	Tipo_pagamento enum('Boleto','Cartão','Dois cartões'),
    CONSTRAINT fk_pagamento_cliente FOREIGN KEY (PagamentoCliente) REFERENCES Clientes(id_Cliente)
);

DESC Pagamentos;

CREATE TABLE Entrega(
	id_Entrega INT auto_increment PRIMARY KEY,
    StatusEntrega enum('Concluído', 'Em andamento'),
    CodigoRastreio VARCHAR(45),
    DataEntrega DATE
);

DESC Entrega;

CREATE TABLE Pedido(
	id_Pedido INT auto_increment PRIMARY KEY,
    StatusPedido enum('Preparando','Enviado'),
    Frete FLOAT,
    Descrição VARCHAR(45),
    CONSTRAINT fk_entrega FOREIGN KEY (id_Pedido) REFERENCES Entrega(id_Entrega)
);

DESC Pedido;

CREATE TABLE Estoque(
	id_Estoque INT auto_increment PRIMARY KEY,
    Local VARCHAR(45)
);

DESC Estoque;

CREATE TABLE EstoqueProduto(
	id_Produto INT PRIMARY KEY,
    id_EstoqueProduto INT,
    Quantidade FLOAT,
    CONSTRAINT fk_estoque FOREIGN KEY (id_Produto) REFERENCES Produtos(id_Produto),
    CONSTRAINT fk_produto_estoque FOREIGN KEY (id_EstoqueProduto) REFERENCES Estoque(id_Estoque)
);

DESC EstoqueProduto;

CREATE TABLE Fornecedor(
	id_Fornecedor INT auto_increment PRIMARY KEY,
    RazãoSocial VARCHAR(45),
    Contato CHAR(11) not null,
    CPF CHAR (11) NOT NULL,
    CNPJ VARCHAR(18),
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF),
    CONSTRAINT unique_cnpj_cliente UNIQUE (CNPJ)
);

DESC Fornecedor;

CREATE TABLE Terceiro(
	id_Terceiro INT auto_increment PRIMARY KEY,
	RazãoSocial VARCHAR(45),
    Contato CHAR(11) not null,
    Localização VARCHAR(45),
    CPF CHAR (11) NOT NULL,
    CNPJ VARCHAR(18),
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF),
    CONSTRAINT unique_cnpj_cliente UNIQUE (CNPJ)
);

DESC Terceiro;
CREATE TABLE PedidoProduto(
	id_Pedido INT,
    id_Produto INT,
    Quantidade FLOAT DEFAULT 1,
    CONSTRAINT fk_pedido FOREIGN KEY (id_Pedido) REFERENCES Terceiro(id_Terceiro),
    CONSTRAINT fk_produto FOREIGN KEY (id_Produto) REFERENCES Produtos(id_Produto)
);

DESC PedidoProduto;

CREATE TABLE PedidoFornecedor(
	id_CompraFornecedor INT,
    id_FornecedorPedido INT,
    Quantidade FLOAT DEFAULT 1,
    CONSTRAINT fk_pedido_forncedor FOREIGN KEY (id_CompraFornecedor) REFERENCES Fornecedor(id_Fornecedor),
    CONSTRAINT fk_fornecedor_pedido FOREIGN KEY (id_FornecedorPedido) REFERENCES Pedido(id_Pedido)
);

DESC PedidoFornecedor;

CREATE TABLE EstoqueFornecedor(
	id_EstoqueFornecedor INT,
    id_ProdutoFornecedor INT,
    CONSTRAINT fk_estoque_fornecedor FOREIGN KEY (id_EstoqueFornecedor) REFERENCES Fornecedor(id_Fornecedor),
    CONSTRAINT fk_produtos_fornecedor FOREIGN KEY (id_ProdutoFornecedor) REFERENCES Produtos(id_Produto)
);

DESC EstoqueFornecedor;

CREATE TABLE EstoqueTerceiro(
	id_ProdutosEstoque INT,
    id_POFornecedor INT,
    CONSTRAINT fk_produtos_estoque FOREIGN KEY (id_ProdutosEstoque) REFERENCES Produtos(id_Produto),
    CONSTRAINT fk_po_fornecedor FOREIGN KEY (id_POFornecedor) REFERENCES Terceiro(id_Terceiro)
);

DESC EstoqueTerceiro;