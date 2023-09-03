Use Oficina;

--- Verificando qual a marca do carro de Julia
SELECT cliente.*, veiculo.marca
FROM cliente
LEFT JOIN veiculo ON cliente.cliente_id = veiculo.cliente_id
where nome = 'Julia';

--- Verificando o status do carro de Jose
SELECT cliente.*,ordemservico.status
FROM cliente
LEFT JOIN veiculo ON cliente.cliente_id = veiculo.cliente_id
LEFT JOIN ordemservico ON veiculo.veiculo_id = ordemservico.veiculo_id
where nome = 'Jose';

--- Verificando quem é o mecanico que está consertando o carro de Helena
SELECT cliente.*, mecanico.nome as mecanico
FROM cliente
LEFT JOIN veiculo ON cliente.cliente_id = veiculo.cliente_id
LEFT JOIN ordemservico ON veiculo.veiculo_id = ordemservico.veiculo_id
LEFT JOIN mecanico ON ordemservico.mecanico_id = mecanico.mecanico_id
where cliente.nome = 'Helena';

--- Verificando quantos carros o mecanico Aldo está consertando
SELECT nome as mecanico,count(os_id)
FROM mecanico
LEFT JOIN ordemservico ON mecanico.mecanico_id = ordemservico.mecanico_id
group by mecanico
having mecanico = 'Aldo';