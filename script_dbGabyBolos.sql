-- comentario apagando banco de dados
drop database dbGabyBolos;

-- criando banco de dados
create database dbGabyBolos;

-- Acessando banco de dados
use dbGabyBolos;

-- visualizando as tabelas no banco de dados
show tables;

-- criando tabelas
create table tbFuncionarios(
codfunc int,
nome varchar(100),
email varchar(100),
telefone char (9),
);

show tables;
desc tbFuncionarios;