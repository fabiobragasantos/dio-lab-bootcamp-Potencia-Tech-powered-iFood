

-- Criar banco de dados para o cenário de E-commerce
-- drop database ecommerce;

create database ecommerce;
use ecommerce;

-- criar tabela de clientes
create table clients (
	idclient int auto_increment primary key,
    fname varchar(10),
    minit char(3),
    lname varchar(20),
    cpf char(11) not null,
    address varchar(255),  
    constraint unique_cpf_client unique (cpf)
);

-- criar tabela de produtos
create table product (
	idproduct int auto_increment primary key,
    descricao varchar(45) not null,
    classification_kids boolean default false,
    category enum('Eletrônico','Vestimenta','Briquedos','Alimentos','Móveis') not null,
    avaliacao float default 0,
    size varchar(10)
);

-- criar tabela de pedidos
create table orders (
	idorder int auto_increment primary key,
    idclient int,
    orderstatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    orderdescription varchar(255),
    sendvalue float default 10,
    paymentcash boolean default false,
    constraint fk_orders_client foreign key (idclient) references clients(idclient)
);

-- criar tabela de estoque
create table storage (
	idstorage int auto_increment primary key,
    location varchar(255),
    quantity int default 0
);

-- criar tabela de fornecedor
create table supplier (
	idsupplier int auto_increment primary key,
    socialname varchar(255) not null,
    cnpj char(15) not null,
    contact char(11) not null,
    constraint unique_cnpj_supplier unique (cnpj)
);

-- criar tabela de vendedor
create table seller (
	idseller int auto_increment primary key,
    socialname varchar(255) not null,
    abstname varchar(255),
    cnpj char(15),
    cpf char(11),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (cnpj),
    constraint unique_cpf_seller unique (cpf)
);

-- criar tabela productseller
create table productseller (
	idseller int,
    idproduct int,
    psquantity int default 1,
    primary key (idseller,idproduct),
    constraint fk_productseller_seller foreign key (idseller) references seller(idseller),
    constraint fk_productseller_product foreign key (idproduct) references product(idproduct)
);

-- criar tabela productorder
create table productorder (
	idproduct int,
    idorder int,
    poquantity int default 1,
    postatus enum('Disponível','Sem estoque') default 'Disponível',    
    primary key (idproduct,idorder),
    constraint fk_productorder_product foreign key (idproduct) references product(idproduct),
    constraint fk_productorder_seller foreign key (idorder) references orders(idorder)
);

-- criar tabela productstorage
create table productstorage (
	idproduct int,
    idstorage int,
    location varchar(255) not null,   
    primary key (idproduct,idstorage),
    constraint fk_storagelocation_product foreign key (idproduct) references product(idproduct),
    constraint fk_storagelocation_storage foreign key (idstorage) references storage(idstorage)
);

-- criar tabela productsupplier
create table productsupplier (
	idsupplier int,
    idproduct int,
    quantity int not null,   
    primary key (idsupplier,idproduct),
    constraint fk_productsupplier_supplier foreign key (idsupplier) references supplier(idsupplier),
    constraint fk_productsupplier_product foreign key (idproduct) references product(idproduct)
);

