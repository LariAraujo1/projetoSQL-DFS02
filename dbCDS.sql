drop database dbCDS;

create database dbCDS;

use dbCDS;

create table tbArtistas(
codArt int not null,
nomeArt varchar(100) not null unique,
primary key(codArt)
);

create table tbFuncionarios(
codFunc int not null,
nomeFunc varchar(50) not null,
endFunc varchar(100) not null,
salFunc decimal(9,2) not null default 0 check(salFunc >=0),
sexoFunc char(1) not null default 'F' check(sexoFunc in('F','M')),
primary key(codFunc)
);

create table tbGravadoras(
codGrav int not null,
nomeGrav varchar(50) not null unique,
primary key(codGrav)
);

create table tbCategorias(
codCat int not null,
nomeCat varchar(50) not null unique,
primary key(codCat)
);

create table tbEstados(
siglaEst char(2) not null,
nomeEst varchar(50) not null unique,
primary key(siglaEst)
);

create table tbCidades(
codCid int not null,
nomeCid varchar(50) not null,
siglaEst char(2) not null,
primary key(codCid),
foreign key(siglaEst) references tbEstados(siglaEst)
);

create table tbClientes(
codCli int not null,
nomeCli varchar(50) not null,
endCli varchar(100) not null,
rendaCli decimal(9,2) not null default 0 check(rendaCli >= 0),
sexoCli char(1) not null default 'F' check(sexoCli in('F','M')),
codCid int not null, 
primary key(codCli),
foreign key (codCid) references tbCidades(codCid)
);

create table tbConjuges(
codConj int not null,
nomeConj varchar(50) not null,
rendaConj decimal(9,2) not null default 0 check(rendaConj >=0),
sexoConj char(1) not null default 'F' check(sexoConj in('F','M')),
codCli int not null,
primary key(codConj),
foreign key(codCli) references tbClientes(codCli) 
);

create table tbDependentes(
codDep int not null,
nomeDep varchar(100) not null,
sexoDep char(1) not null default 'F' check(sexoDep in ('F','M')),
codFunc int not null, 
primary key(codDep),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbTitulos(
codTit int not null,
nomeCd varchar(50) not null unique,
valCd decimal(9,2) not null check(valCd >0),
qtdEstq int not null check(qtdEstq>=0),
codCat int not null,
codGrav int not null,
primary key(codTit),
foreign key(codCat) references tbCategorias(codCat),
foreign key(codGrav) references tbGravadoras(codGrav) 
);

create table tbPedidos(
codPed int not null,
dataPed datetime not null,
valPed decimal(9,2) not null default 0 check(valPed >=0),
codCli int not null,
codFunc int not null,
primary key(codPed),
foreign key(codCli) references tbClientes(codCli),
foreign key(codFunc) references tbFuncionarios(codFunc) 
);

create table tbTitulos_Pedidos(
codPed int not null,
codTit int not null,
qtdCd int not null check(qtdcd >=1),
valCd decimal(9,2) not null check(valCd >0),
foreign key(codPed) references tbPedidos(codPed),
foreign key(codTit) references tbTitulos(codTit)
);

create table tbTitulosArtista(
codTit int not null,
codArt int not null,
foreign key(codTit) references tbTitulos(codTit),
foreign key(codArt) references tbArtistas(codArt)
);


desc tbArtistas;
desc tbFuncionarios;
desc tbGravadoras;
desc tbCategorias;
desc tbEstados;
desc tbCidades; --foreign key, siglasEstados
desc tbClientes; --foreign key, tbcidades 
desc tbConjuges; --foreign key, tbClientes 
desc tbDependentes; --foreign key, tbFuncionarios
desc tbTitulos; -- 2 foreign key categorias, gravadoras
desc tbPedidos; -- 2 foreign key clientes, funcionarios
desc tbTitulos_Pedidos -- não tem chave primaria, TbPedidos e tbTitulos  
desc tbTitulosArtista; -- não tem chave primaria, tbArtistas e tbTitulos  