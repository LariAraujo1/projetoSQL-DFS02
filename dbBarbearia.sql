drop database dbBarbearia;

create database dbBarbearia;

use dbBarbearia;

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
marca varchar(50),
preco decimal(9,2),
primary key(codProd)
);

insert into tbProdutos(descricao,marca,preco)
    values('Shampoo', 'nivea', 30.0);

insert into tbProdutos(descricao,marca,preco)
    values('Sabonete', 'phebo', 50.0);

insert into tbProdutos(descricao,marca,preco)
    values('Creme de barbear','Barbers', 70.0);

insert into tbProdutos(descricao,marca,preco)
    values('Gel para cabelos','Salonline', 25.0);


-- select * from tbProdutos;

-- delete from tbProdutos where codProd=2;

select * from tbProdutos;


select codProd as 'Código', descricao as 'Descrição', marca as 'Marca', preco as 'Preço' from tbProdutos;

--Colunas virtuais

-- select codProd,descricao, 'promoção' as 'promo', marca,preco from tbProdutos;

select codProd as 'Código', descricao as 'Descrição', marca as 'Marca', 'Sim' as 'Vendido', preco as 'Preço' from tbProdutos;

--utilizando calculos no sql

update tbProdutos set preco= preco*1.10 where codProd=3;
--caso eu queira modificar todos basta tirar o where codProd=3

update tbProdutos set preco=preco*0.20 where codProd=1;

select * from tbProdutos; 