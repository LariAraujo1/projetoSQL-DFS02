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
nome varchar(50) not null,
senha varchar(20) not null,
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

create table tbVendas(
codVend int not null auto_increment,
valor decimal(9,2),
data date,
hora time,
quantidade int,
codUsu int not null,
codProd int not null,
codCli int not null,
primary key(codVend),
foreign key(codUsu) references tbUsuarios(codUsu),
foreign key(codProd) references tbProdutos(codProd),
foreign key(codCli) references tbClientes(codCli)
);
