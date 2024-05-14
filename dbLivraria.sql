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

create table tbVendas(
idVenda int not null auto_increment,
data date,
total decimal(9,2),
idCliente int,
primary key(idVenda),
foreign key(idcliente) references tbClientes(idCliente)
);

create table tbLivros(
idLivro int not null auto_increment,
titulo varchar(10),
preco decimal(9,2),
estoque int,
idGenero int not null,
primary key(idLivro),
foreign key(idGenero) references tbGeneros(idGenero) 
);

create table tbEscreve(
idLivro int not null,
idAutor int not null,	
foreign key(idLivro) references tbLivros(idLivro),
foreign key(idAutor) references tbAutores(idAutor) 
);

create table tbItens_Vendas(
idVenda int not null,
idLivro int not null,
qtd int,
subtotal decimal(9,2),
foreign key (idVenda) references tbVendas(idVenda),
foreign key (idLivro) references tbLivros(idLivro)
);


desc tbGeneros;
desc tbAutores;
desc tbClientes;
desc tbVendas;
desc tbLivros;
desc tbEscreve;
desc tbItens_Vendas;