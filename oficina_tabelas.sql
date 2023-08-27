

-- Criar banco de dados para o cenário de Oficina
create database oficina;
use oficina;

-- criar tabela de clientes
create table clientes (
	idcliente int auto_increment primary key,
    nome_inicial varchar(30),
    nome_final varchar(255),
    cpf char(11) not null,
    endereco varchar(255),  
    constraint unique_cpf_cliente unique (cpf)
);

-- criar tabela de serviços
create table servicos (
	idservico int auto_increment primary key,
    descricao varchar(100) not null,
    categoria enum('Mecânico','Funilaria e Pintura','Revisão') not null,
    valor float default 0
);

-- criar tabela de empregado
create table empregados (
	idempregado int auto_increment primary key,
    nome_inicial varchar(30),
    nome_final varchar(255),
    especialidade enum('Mecânico','Pintor') default 'Mecânico',
    cpf char(11) not null,
    constraint unique_cpf_empregado unique (cpf)
);

-- criar tabela de ordem de serviço
create table ordem (
	idordem int auto_increment primary key,
    idcliente int,
    status enum('Em processamento','Encerrada','Cancelada') default 'Em processamento',
    descricao varchar(255),
    tipo_pagamento enum('Dinheiro','Cartão de crédito','Cartão de débito','PIX') default 'Dinheiro',
    constraint fk_ordem_cliente foreign key (idcliente) references clientes (idcliente)
);

-- criar tabela ordem_servico
create table ordem_servico (
	idordem int,
    idservico int,
    idempregado int,    
    observacao varchar(255) not null,
    valor float default 0,
    desconto float default 0,
    primary key (idordem,idservico,idempregado),
    constraint fk_ordem_servico_idordem foreign key (idordem) references ordem (idordem),
    constraint fk_ordem_servico_idservico foreign key (idservico) references servicos (idservico),
    constraint fk_ordem_servico_idempregado foreign key (idempregado) references empregados (idempregado)   
);

