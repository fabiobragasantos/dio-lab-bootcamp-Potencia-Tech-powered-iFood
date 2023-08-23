

use ecommerce;

-- 1. Consulta simples
select t1.* from clients t1;
select t1.* from product t1;
select t1.* from orders t1;
select t1.* from storage t1;
select t1.* from supplier t1;
select t1.* from seller t1;
select t1.* from productseller t1;
select t1.* from productorder t1;
select t1.* from productstorage t1;
select t1.* from productsupplier t1;

-- 2. Filtros com where e com expressóes
select t1.idorder as 'Pedido', 
t2.orderstatus as 'Status', 
concat(t2.idclient,' - ',t3.fname,' ', t3.lname) as 'Cliente',
t3.cpf as 'CPF', 
t3.address as 'Endereço', 
t2.sendvalue as 'Valor',
case when t2.paymentcash = 1 then 'Sim' else 'Não' end as 'Pagamento em dinheiro',
concat(t1.idproduct,' - ',t4.descricao) as 'Produto',
t1.poquantity as 'Quantidade'
from productorder t1
inner join orders t2 on t1.idorder = t2.idorder 
inner join clients t3 on t2.idclient = t3.idclient
inner join product t4 on t1.idproduct = t4.idproduct 
order by t1.idorder, t1.idproduct;

select concat(t1.idseller,' - ', t2.socialname) as 'Vendedor', 
case when t2.cnpj is not null then concat('CNPJ - ', t2.cnpj) else concat('CPF - ',t2.cpf) end as 'Documento',
t2.location as 'Localização',
t2.contact as 'Contato',
concat(t1.idproduct,' - ',t3.descricao) as 'Produto',
t3.category as 'Categoria',
t3.avaliacao as 'Avaliação',
t3.`size` as 'Tamanho',
t1.psquantity as 'Quantidade'
from productseller t1
inner join seller t2 on t1.idseller = t2.idseller
inner join product t3 on t1.idproduct = t3.idproduct 
order by t1.idseller, t1.idproduct; 

select t1.idstorage as 'Estoque', 
concat(t2.location,' - ',t1.location) as 'Localização',
concat(t1.idproduct,' - ',t3.descricao) as 'Produto',
t3.category as 'Categoria',
t3.avaliacao as 'Avaliação',
t3.`size` as 'Tamanho',
t2.quantity as 'Quantidade'
from productstorage t1
inner join storage t2 on t1.idstorage = t2.idstorage 
inner join product t3 on t1.idproduct = t3.idproduct 
order by t1.idstorage, t1.idproduct;

select concat(t1.idsupplier,' - ', t2.socialname) as 'Fornecedor', 
t2.cnpj as 'CNPJ',
t2.contact as 'Contato',
concat(t1.idproduct,' - ',t3.descricao) as 'Produto',
t3.category as 'Categoria',
t3.avaliacao as 'Avaliação',
t3.`size` as 'Tamanho',
t1.quantity as 'Quantidade'
from productsupplier t1
inner join supplier t2 on t1.idsupplier = t2.idsupplier 
inner join product t3 on t1.idproduct = t3.idproduct 
order by t1.idsupplier, t1.idproduct;