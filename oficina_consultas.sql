

use oficina;

-- 1. Consulta simples
select t1.* from clientes t1;
select t1.* from servicos t1;
select t1.* from empregados t1;
select t1.* from ordem t1;
select t1.* from ordem_servico t1;

-- 2. Filtros com where e com expressóes
select t1.idordem as 'Ordem de Serviço', 
t1.status as 'Status', 
concat(t1.idcliente,' - ',t2.nome_inicial,' ', t2.nome_final) as 'Cliente',
t2.cpf as 'CPF', 
t2.endereco as 'Endereço', 
t1.descricao as 'Descrição',
t1.tipo_pagamento as 'Tipo de Pagamento',
t3.valor_total as 'Valor Total'
from ordem t1
inner join clientes t2 on t1.idcliente = t2.idcliente 
inner join (
select t1.idordem, sum(t1.valor - t1.desconto) as valor_total from ordem_servico t1
group by t1.idordem
) t3 on t1.idordem = t3.idordem
order by t1.idordem;

select t1.idordem as 'Ordem de Serviço', 
t1.status as 'Status', 
concat(t2.idservico,' - ',t3.descricao) as 'Serviço',
t3.categoria as 'Categoria', 
t2.observacao as 'Observação',
t2.valor as 'Valor',
t2.desconto as 'Desconto',
(t2.valor - t2.desconto) as 'Valor Total'
from ordem t1
inner join ordem_servico t2 on t1.idordem = t2.idordem
inner join servicos t3 on t2.idservico = t3.idservico 
order by t1.idordem, t2.idservico;

