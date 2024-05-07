--Apagando bd se existir
drop database dbLoja;

--visualizando banco de dados
show databases;

--criando banco de dados
create database dbLoja;

--acessando banco de dados
use dbLoja;

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCel char(10),
cpf char(14) not null unique, -- not null para que o cpf seja obrigatorio/ não nulo
logradouro varchar(100),
numero char(10),
cep char(9),
bairro varchar(100),
cidade varchar(100),
estado char (2),
primary key(codFunc)
);

create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100),
email varchar(100),
cnpj char(16) not null unique,
primary key(codForn)
);

create table tbClientes(
codCli int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char (14) not null unique,
primary key(codCli)
);

--criando as tabelas no bd;
create table tbUsuarios(
codUsu int auto_increment,
nome varchar(50),
senha varchar(20),
codFunc int not null,
primary key(codUsu),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
valor decimal(9,2),
quantidade int,
data date,
hora time,
codForn int not null,
primary key(codProd),
foreign key (codForn) references tbFornecedores(codForn)
);

--visualizando as tabelas criadas
show tables;

--visualizando as estruturas das tabelas
describe tbUsuarios;
desc tbFuncionarios;


--inserindo valores registros nas tabelas

insert into tbFuncionarios(nome,email,cpf,telCel,logradouro,numero,cep, bairro, cidade, estado)
	values('lara Araujo','larissa.tanascimento@senacsp.edu.br','526.287.456.32','95874-5525', 'Rua Dr. Antonio Bento', '355','05422-000','Santo Amaro', 'Sao Paulo', 'SP'); -- o ~ de são paulo nao funciona no prompt mas esta correto

insert into tbFuncionarios(nome,email,cpf,telCel,logradouro,numero,cep, bairro, cidade, estado)
	values('larissa Araujo','larissatamiresar@gmail.com','527.287.656.82','95885-5525', 'Rua Dr. Antonio Bento', '358','04752-000','Santo Amaro', 'Sao Paulo', 'SP');

insert into tbUsuarios(nome,senha,codFunc)
	values('lara.araujo','deximbranco',1);
insert into tbUsuarios(nome,senha,codFunc)
	values('Ana.frios','1234',2);

--visualizando os registros nos campos das tabelas
select * from tbUsuarios;
select * from tbFuncionarios;


