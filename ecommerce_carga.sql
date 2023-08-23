

use ecommerce;

insert into clients (fname,minit,lname,cpf,address) values
('Maria','M','Silva',123456789,'rua silva de prata 29, Carangola - Cidade das Flores'),
('Matheus','O','Pimentel',987654321,'rua alemeda 289, Centro - Cidade das Flores'),
('Ricardo','F','Silva',45678913,'avenida alemeda vinha 1009, Centro - Cidade das Flores'),
('Julia','S','França',789123456,'rua lareijras 861, Centro - Cidade das Flores'),
('Roberta','G','Assis',98745631,'avenida koller 19, Centro - Cidade das Flores'),
('Isabela','M','Cruz',654789123,'rua alemeda das flores 28, Centro - Cidade das Flores');

insert into product (descricao,classification_kids,category,avaliacao,size) values
('Fone de ouvido',false,'Eletrônico','4',null),
('Barbie Elsa',true,'Briquedos','3',null),
('Body Carters',true,'Vestimenta','5',null),
('Microfone Vedo - Youtuber',false,'Eletrônico','4',null),
('Sofá retrátil',false,'Móveis','3','3x57x80'),
('Farinha de arroz',false,'Alimentos','2',null),
('Fire Stick Amazon',false,'Eletrônico','3',null);

insert into orders (idclient,orderstatus,orderdescription,sendvalue,paymentcash) values
(1,default,'compra via aplicativo',null,1),
(2,default,'compra via aplicativo',50,0),
(3,'Confirmado',null,null,1),
(4,default,'compra via web site',150,0);

insert into storage (location,quantity) values
('Rio de Janeiro',1000),
('Rio de Janeiro',500),
('São Paulo',10),
('São Paulo',100),
('São Paulo',10),
('Brasília',60);

insert into supplier (socialname,cnpj,contact) values
('Almeida e filhos',123456789123456,'21985474'),
('Eletrônicos Silva',854519649143457,'21985474'),
('Eletrônicos Valma',934567893934695,'21975474');

insert into seller (socialname,abstname,cnpj,cpf,location,contact) values
('Tech eletronics',null,123456789456321,null,'Rio de Janeiro',219946287),
('Botique Durgas',null,null,123456783,'Rio de Janeiro',219567895),
('Kids World',null,456789123654485,null,'São Paulo',1198657484);

insert into productseller (idseller,idproduct,psquantity) values
(1,6,80),
(2,7,10);

insert into productorder (idproduct,idorder,poquantity,postatus) values
(1,1,2,default),
(2,1,1,default),
(3,2,1,default);

insert into productstorage (idproduct,idstorage,location) values
(1,2,'RJ'),
(2,6,'GO');

insert into productsupplier (idsupplier,idproduct,quantity) values
(1,1,500),
(1,2,400),
(2,4,633),
(3,3,5),
(2,5,10);

