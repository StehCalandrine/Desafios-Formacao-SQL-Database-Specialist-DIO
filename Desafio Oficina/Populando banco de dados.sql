-- Populando a tabela de referência de mão-de-obra (Servico)
INSERT INTO Servico (servico_id, descricao, valor)
VALUES
    (1, 'Troca de óleo', 50.00),
    (2, 'Troca de pneus', 150.00),
    (3, 'Reparo de freios', 80.00),
    (4, 'Revisão periódica', 120.00);

-- Exemplo de inserção de dados para Clientes, Veículos e Ordem de Serviço
INSERT INTO Cliente (cliente_id, nome, endereco)
VALUES
    (123, 'Francisco', 'Avenida das Acacias 132'),
    (124, 'Helena', 'Travessa Bento 16'),
    (125, 'Jose', 'Avenida Agusto 14'),
    (126, 'Julia', 'Rua aguas claras 1');

INSERT INTO Veiculo (veiculo_id, cliente_id, placa, marca, modelo, ano)
VALUES
    (133, 123, 'LDC3775', 'Ford', 'Fiesta', 2018),
    (234, 124, 'XYZ789', 'Toyota', 'Corolla', 2020),
	(135, 125, 'ABC123', 'Citroen', 'C3', 2018),
    (236, 126,'MIU6668', 'Fiat', 'Ducato', 2020);

INSERT INTO Mecanico (mecanico_id, nome, endereco, especialidade)
VALUES
    (212, 'Jose', 'Rui branco 113', 'Motor'),
    (213, 'Aldo', 'Passagem flores 144', 'Freios');

INSERT INTO OrdemServico (os_id, veiculo_id, mecanico_id, data_emissao, valor_total, status, data_conclusao)
VALUES
    (1, 133, 212, '2023-09-01', 200.00, 'Em andamento', NULL),
    (2, 234, 213, '2023-09-02', 350.00, 'Concluída', '2023-09-03'),
    (3, 135, 212, '2023-09-02', 350.00, 'Concluída', '2023-09-03'),
    (4, 236, 213, '2023-09-02', 350.00, 'Concluída', '2023-09-03');

INSERT INTO ItemServico (item_id, os_id, servico_id)
VALUES
    (1, 1, 1),
    (2, 2, 3),
    (3, 3, 2),
    (4, 4, 4);