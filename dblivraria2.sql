drop database dbLivraria;
 
create database dbLivraria;
 
use dbLivraria;
 
create table tbGeneros(
idGenero int not null auto_increment,
descricao varchar(100),
primary key(idGenero)
);
 
create table tbAutores(
idAutor int not null auto_increment,
nome varchar(100),
email varchar(100),
primary key(idAutor)
);
 
 
create table tbClientes(
idCliente int not null auto_increment,
nome varchar(100),
telefone char(9),
primary key(idCliente)
);

create table tbLivros(
idLivro int not null auto_increment,
titulo varchar(100),
preco decimal (9,2),
estoque int,
idGenero int not null,
primary key(idLivro),
foreign key(idGenero) references tbGeneros(idGenero)
);
 
 
create table tbVendas(
idVenda int not null auto_increment,
data date,
total decimal (9,2),
idCliente int not null,
primary key(idVenda),
foreign key(idCliente) references tbClientes(idCliente)
);
 
 
create table tbItens_Vendas(
idVenda int not null,
idLivro int not null,
quantidade int,
subTotal decimal(9,2),
foreign key(idVenda) references tbVendas(idVenda),
foreign key(idLivro) references tbLivros(idLivro)
);
 
create table tbEscreve(
idLivro int not null,
idAutor int not null,
foreign key(idLivro) references tbLivros(idLivro),
foreign key(idAutor) references tbAutores(idAutor)
);
 
 
desc tbLivros;
desc tbAutores;
desc tbClientes;
desc tbGeneros;
desc tbEscreve;
desc tbVendas;
desc tbItens_Vendas;
 
-- cadastrando os registros nas tabelas
insert into tbGeneros (descricao)values('Acao');
insert into tbGeneros (descricao)values('Ficcao');
insert into tbGeneros (descricao)values('Aventura');
insert into tbGeneros (descricao)values('Terror'); 
insert into tbGeneros (descricao)values('Comedia');
insert into tbGeneros (descricao)values('Romance');
insert into tbGeneros (descricao)values('Documentario');	
 
 
insert into tbAutores (nome, email) values('Rowling','rowling@hotmail.com');
insert into tbAutores (nome, email) values('George Orwell','georgeorwell@hotmail.com');
insert into tbAutores (nome, email) values('Tolkien','tolkien@hotmail.com');
insert into tbAutores (nome, email) values('Jane Austen','janeausten@gmail.com');
insert into tbAutores (nome, email) values('Stephen King','stephenking@hotmail.com');
insert into tbAutores (nome, email) values('Agatha Christie','agathachristie@hotmail.com');
insert into tbAutores (nome, email) values('Gabriel Garcia Marquez','gabrielgarciamarquez@gmail.com');
 
 
insert into tbClientes(nome, telefone)values('Alfredo', '954548723');	
insert into tbClientes(nome, telefone)values('Joaquim', '953403589');
insert into tbClientes(nome, telefone)values('Joao', '9525067398');
 
 
insert into tbLivros (titulo,preco,estoque,idGenero)values('Harry Potter and the Chamber of Secrets', 59.94, 12, 1);
insert into tbLivros (titulo,preco,estoque,idGenero)values('Animal Farm', 39.57, 9, 2);
insert into tbLivros (titulo,preco,estoque,idGenero)values('The Silmarillion', 41.82, 6, 3);
insert into tbLivros (titulo,preco,estoque,idGenero)values('Sense and Sensibility', 64.76, 31, 4);
insert into tbLivros (titulo,preco,estoque,idGenero)values('The Shining', 29.45, 8, 5);
insert into tbLivros (titulo,preco,estoque,idGenero)values('Murder on the Orient Express', 34.62, 21, 6);
insert into tbLivros (titulo,preco,estoque,idGenero)values('Cem Anos de Solidão', 41.51, 38,7);	
 
 
insert into tbVendas(data,total,idCliente) values('2024-05-16', 150.50,2);
insert into tbVendas(data,total,idCliente) values('2024-04-23', 98.47,1);
insert into tbVendas(data,total,idCliente) values('2024-03-26', 84.98,3);
 
 
insert into tbEscreve (idLivro, idAutor)values(4,7);
insert into tbEscreve (idLivro, idAutor)values(1,3);
insert into tbEscreve (idLivro, idAutor)values(2,6);
 
 
insert into tbItens_Vendas(idVenda, idLivro, qtd, subtotal) values(1, 5, 5, 150.26);
insert into tbItens_Vendas(idVenda, idLivro, qtd, subtotal) values(3, 2, 8, 267.78);	
insert into tbItens_Vendas(idVenda, idLivro, qtd, subtotal) values(2, 1, 13, 376.60);
insert into tbEscreve(idLivro,idAutor)values(4,7);
insert into tbEscreve(idLivro,idAutor)values(3,5);
insert into tbEscreve(idLivro,idAutor)values(1,6);
 
 
-- Pesquisar os campos das tabelas
select * from tbGeneros;
select * from tbAutores;
select * from tbClientes;
select * from tbLivros;
select * from tbVendas;
select * from tbItens_Vendas;
select * from tbEscreve;


-- Alterando registros das tabelas 

update tbClientes set nome = 'Antonina da silva' where idCliente=2;
update tbClientes set nome = 'Patolino ino' , telefone ='958456584' where idCliente=1;
update tbClientes set nome= 'Geronimo liberalus' , telefone = '0000000' where idCliente=3;

select * from tbClientes;

update tbLivros set titulo = 'The Invisible Life of Addie Larue', preco = 60.50, estoque = 3, idGenero = 2 where idLivro = 1;
update tbLivros set titulo = 'The Seven Husbands of Evelyn Hugo', preco = 33.91, estoque = 5, idGenero = 6 where idLivro = 5; 
update tbLivros set titulo = 'One Hundred Years of Solitude', preco = 41.51, estoque = 60, idGenero =6 where idLivro = 7;  

select * from tbLivros;


--Apagando o registro da tabela

delete from tbItens_Vendas where idVenda=2;
delete from tbVendas where idVenda=1;
delete from tbClientes where idCliente = 1;

select * from tbVendas;
select * from tbClientes;
select * from tbItens_Vendas;
