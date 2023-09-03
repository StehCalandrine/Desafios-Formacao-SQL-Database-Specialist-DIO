-- Criar o banco de dados "oficina"
CREATE DATABASE oficina;

-- Usar o banco de dados "oficina"
USE oficina;

-- Definir as tabelas e relacionamentos
CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255)
);

CREATE TABLE Veiculo (
    veiculo_id INT PRIMARY KEY,
    cliente_id INT,
    placa VARCHAR(10),
    marca VARCHAR(255),
    modelo VARCHAR(255),
    ano INT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

CREATE TABLE Mecanico (
    mecanico_id INT PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    especialidade VARCHAR(255)
);

CREATE TABLE OrdemServico (
    os_id INT PRIMARY KEY,
    veiculo_id INT,
    mecanico_id INT,
    data_emissao DATE,
    valor_total DECIMAL(10, 2),
    status VARCHAR(50),
    data_conclusao DATE,
    FOREIGN KEY (veiculo_id) REFERENCES Veiculo(veiculo_id),
    FOREIGN KEY (mecanico_id) REFERENCES Mecanico(mecanico_id)
);

CREATE TABLE Servico (
    servico_id INT PRIMARY KEY,
    descricao VARCHAR(255),
    valor DECIMAL(10, 2)
);

CREATE TABLE ItemServico (
    item_id INT PRIMARY KEY,
    os_id INT,
    servico_id INT,
    FOREIGN KEY (os_id) REFERENCES OrdemServico(os_id),
    FOREIGN KEY (servico_id) REFERENCES Servico(servico_id)
);