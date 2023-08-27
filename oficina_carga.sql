

use oficina;

insert into clientes (nome_inicial,nome_final,cpf,endereco) values
('Renato','Alberto da Silva',123456789,'Rua das Tulipas 51, Bairro dos Artistas - Rio de Janeiro - RJ'),
('Renata','Vieira',987654321,'Rua das Rosas 28, Centro - Rio de Janeiro - RJ'),
('João','da Silva',45678913,'Rua do Boldo 10, Centro - Rio de Janeiro - RJ'),
('Maria',' da França',789123456,'Rua do Limão 61, Bairro dos Artistas - Rio de Janeiro - RJ'),
('Renata','dos Santos',98745631,'Rua do Arroz 39, Bairro dos Artistas - Rio de Janeiro - RJ'),
('João','da Luz',654789123,'Rua do Capim 78, Centro - Rio de Janeiro - RJ');

insert into servicos (descricao,categoria,valor) values
('Revisão dos componentes do freio','Revisão',100),
('Manutenção de embreagem','Mecânico',500),
('Troca de filtros','Mecânico',350),
('Serviço de martelinho de ouro','Funilaria e Pintura',400);

insert into empregados (nome_inicial,nome_final,especialidade,cpf) values
('Mario','da Paz','Mecânico',123456708),
('Renato','Bello','Pintor',987605321),
('Julio','do Rio','Mecânico',45607813),
('Henrique','do Arroz','Pintor',789123456);

insert into ordem (idcliente,status,descricao,tipo_pagamento) values
(1,'Em processamento','Serviços de Revisão.','PIX'),
(3,'Encerrada','Serviços de Mecânica.','Cartão de crédito'),
(6,'Em processamento','Serviços de Funilaria.','Cartão de débito'),
(4,'Em processamento','Serviços de Mecânica.','Dinheiro');

insert into ordem_servico (idordem,idservico,idempregado,observacao,valor,desconto) values
(1,1,1,'Freios gastos.',100,10),
(2,2,3,'Manutenção concluída.',500,80),
(3,4,2,'Martelinha na porta direita e esquerda.',800,100),
(4,3,1,'Troca do filtro de combustível.',350,50);

