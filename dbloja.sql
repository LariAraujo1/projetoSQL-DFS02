--Apagando bd se existir
drop database dbLoja;

--visualizando banco de dados
show databases;

--criando banco de dados
create database dbLoja;

--acessando banco de dados
use dbLoja;

--criando as tabelas no bd;
create table tbUsuarios(
codUsu int,
nome varchar(50),
senha varchar(20)
);


create table tbFuncionarios(
codFunc int,
nome varchar(100),
email varchar(100),
cpf char(14),
telCel char(10)
);

--visualizando as tabelas criadas
show tables;

--visualizando as estruturas das tabelas
describe tbUsuarios;
desc tbFuncionarios;

--inserindo valores registros nas tabelas
insert into tbUsuarios(codUsu,nome,senha)
	values(1, 'lara.araujo','deximbranco');

insert into tbFuncionarios(codFunc,nome,email,cpf,telCel)
	values(1,'Lara Araujo','larissa.tanascimento@senacsp.edu.br','526.287.456.32','95874-5525');

--visualizando os registros nos campos das tabelas
select * from tbUsuarios;
select * from tbFuncionarios;


