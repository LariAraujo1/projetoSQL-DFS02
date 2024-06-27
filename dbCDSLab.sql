drop database dbCDSLab;

create database dbCDSLab;

use dbCDSLab;

create table tbArtistas(
codArt int not null auto_increment,
nomeArt varchar(100) not null unique,
primary key(codArt)
);
create table tbFuncionarios(
codFunc int not null auto_increment,
nomeFunc varchar(50) not null,
endFunc varchar(100) not null,
salFunc decimal(9,2) not null default 0 check(salFunc >=0),
sexoFunc char(1) not null default 'F' check(sexoFunc in('F','M')),
primary key(codFunc)
);
create table tbGravadoras(
codGrav int not null auto_increment,
nomeGrav varchar(50) not null unique,
primary key(codGrav)
);
create table tbCategorias(
codCat int not null auto_increment,
nomeCat varchar(50) not null unique,
primary key(codCat)
);
create table tbEstados(
siglaEst char(2) not null,
nomeEst varchar(50) not null unique,
primary key(siglaEst)
);
create table tbCidades(
codCid int not null auto_increment,
nomeCid varchar(50) not null,
siglaEst char(2) not null,
primary key(codCid),
foreign key(siglaEst) references tbEstados(siglaEst)
);
create table tbClientes(
codCli int not null auto_increment,
nomeCli varchar(50) not null,
endCli varchar(100) not null,
rendaCli decimal(9,2) not null default 0 check(rendaCli >= 0),
sexoCli char(1) not null default 'F' check(sexoCli in('F','M')),
codCid int not null,
primary key(codCli),
foreign key (codCid) references tbCidades(codCid)
);
create table tbConjuges(
codConj int not null auto_increment,
nomeConj varchar(50) not null,
rendaConj decimal(9,2) not null default 0 check(rendaConj >=0),
sexoConj char(1) not null default 'F' check(sexoConj in('F','M')),
codCli int not null,
primary key(codConj),
foreign key(codCli) references tbClientes(codCli)
);
create table tbDependentes(
codDep int not null auto_increment,
nomeDep varchar(100) not null,
sexoDep char(1) not null default 'F' check(sexoDep in ('F','M')),
codFunc int not null,
primary key(codDep),
foreign key(codFunc) references tbFuncionarios(codFunc)
);
create table tbTitulos(
codTit int not null auto_increment,
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
codPed int not null auto_increment,
dataPed datetime not null,
valPed decimal(9,2) not null default 0 check(valPed >=0),
codCli int not null,
codFunc int not null,
primary key(codPed),
foreign key(codCli) references tbClientes(codCli),
foreign key(codFunc) references tbFuncionarios(codFunc)
);
create table tbTitulosPedidos(
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
desc tbTitulosPedidos; -- não tem chave primaria, TbPedidos e tbTitulos  
desc tbTitulosArtista; -- não tem chave primaria, tbArtistas e tbTitulos  


--insert artistas
insert into tbArtistas (nomeArt) values 
	('Marisa Monte'),('Gilberto Gil'),('Milton Nascimento'),('Legião Urbana'),('The Beatles'),('Caetano Veloso'),('Rita Lee');
--insert Funcionarios
insert into tbFuncionarios (nomeFunc,endFunc,salFunc,sexoFunc) values 
	('Vania Gabriela Pereira', 'Rua A', 2500.00, 'F'),
	('Norberto Pereira da Silva', 'Rua B', 300.00, 'M'),
	('Olavo Linhares', 'Rua C', 580.00, 'M'),
	('Paula da Silva', 'Rua D', 3000.00, 'F'),
	('Rolando Rocha', 'Rua E', 2000.00, 'M');
--insert Gravadoras
insert into tbGravadoras (nomeGrav) values 
('Polygram'),('Emi'),('Som Livre'),('Som Music');
--insert Categorias
insert into tbCategorias(nomeCat) values 
('Mpb'),('Trilha Sonora'),('Rock Internacional'),('Rock Nacional');
--insert Estados
insert into tbEstados (siglaEst, nomeEst) values 
('SP', 'São Paulo'),('MG', 'Minas Gerais'),('RJ', 'Rio de Janeiro'),('ES', 'Espirito Santo');
--insert Cidades
insert into tbCidades (siglaEst, nomeCid) values 
('SP', 'São Paulo'),('SP', 'Sorocaba'),('SP', 'Jundiaí'),('SP', 'Americana'),('SP','Araraquara'),('MG', 'Ouro Preto'),('ES', 'Cachoeira do Itapemirim');
--insert  Clientes
insert into tbClientes (codCid, nomeCli, endCli, rendaCli, sexoCli) values 
(1,'Jose Nogueira', 'Rua A', 1500.00, 'M'),
(1,'Angelo Pereira', 'Rua B',2000.00,'M'),
(1,'Alem Mar Paranhos', 'Rua C', 1500.00,'M'),
(1,'Catarina Souza', 'Rua D',892.00,'F'),
(1,'Vagner Costa','Rua E',950.00,'M'),
(2,'Antenor da Costa', 'Rua F',1582.00,'M'),
(2,'Maria Amélia de souza', 'Rua G',1152.00,'F'),
(2,'Paulo Roberto Silva', 'Rua H',3250.00,'M'),
(2,'Fatima Souza', 'Rua I', 1632.00,'F'),
(2,'Joel da Rocha', 'Rua J',2000.00,'M');
--insert conjuge
insert into tbConjuges(codCli, nomeConj, codConj, sexoConj) values 
(1,'Carla Nogueira', 2500.00,'F'),
(2,'Emilia Pereira', 5500.00,'F'),
(6,'Altiva da Costa', 3000.00,'F'),
(6,'Carlos de Souza', 3250.00,'M');
--Insert dependentes
insert into tbDependentes(codFunc, nomeDep, sexoDep) values 
(1, 'Ana Pereira', 'F'),
(1, 'Roberto Pereira', 'M'),
(1, 'Celso Pereira', 'M'),
(3, 'Brisa Linhares', 'F'),
(3, 'Mari Sol Linhares', 'F'),
(4, 'Sonia da Silva', 'F');
--insert Titulos
insert into tbTitulos(codCat,codGrav,nomeCd,valCd,qtdEstq) values 
(1, 1, 'Tribalistas', 30.00, 1500),
(1, 2, 'Tropicalia', 50.00, 500),
(1, 1, 'Aquele abraco', 50.00, 600),
(1, 2, 'Refazenda', 60.00, 1000),
(1, 3, 'Totalmente Demais', 50.00, 2000),
(1, 3, 'Travessia', 55.00, 500),
(1, 2, 'Courage', 30.00, 200),
(4, 3, 'Legiao Urbana', 20.00, 100),
(3, 2, 'The Beatles', 30.00, 300),
(4, 1, 'Rita Lee', 30.00, 500);
--insert pedidos
insert into tbPedidos(codCli,codFunc,dataPed,valPed) values 
(1, 2, '02/05/02', 1500.00),
(3, 3, '02/05/02', 50.00),
(4, 4, '02/06/02', 100.00),
(1, 4, '02/02/03', 200.00),
(7, 5, '02/03/03', 300.00),
(4, 4, '02/03/03', 100.00),
(5, 5, '02/03/03', 50.00),
(8, 2, '02/03/03', 50.00),
(2, 2, '02/03/03', 2000.00),
(7, 1, '02/03/03', 3000.00);
 
 
--insert titulos_Pedidos
insert into tbTitulosPedidos(codPed,codTit,qtdCd,valCd) values
	(1,1,2,30.00),
	(1,2,3,20.00),
	(2,1,1,50.00),
	(2,2,3,30.00),
	(3,1,2,40.00),
	(4,2,3,20.00),
	(5,1,2,25.00),
	(6,2,3,30.00),
	(6,3,1,35.00),
	(7,4,2,55.00),
	(8,1,4,60.00),
	(9,2,3,15.00),
	(10,7,2,15.00);
 
--insert titulos_artista
insert into tbTitulosArtista(codTit,codArt)values
(1,1),(2,2),(3,2),(4,2),(5,3),(6,4),(7,4),(8,5),(9,6),(10,7);

---------------------------------------------------------------------------------------------------------------------------------------------------------------

--- Laboratório --- pag88-pag89 - Join

-- 1. Selecione o nome dos CDs e o nome da gravadora de cada CD. 

-- select nomeCd,nomeGrav from tbTitulos inner join tbGravadoras on tbTitulos.codGrav = tbGravadoras.codGrav; 
-- O contrario não funcionaria pois tbGravadora não possui chave estrangeira

select tit.nomeCd,grav.nomeGrav from tbTitulos as tit inner join tbGravadoras as grav on tit.codGrav = grav.codGrav;


-- 2. Selecione o nome dos CDs e o nome da categoria de cada CD. 
-- select nomeCd, nomeCat from tbTitulos inner join tbCategorias on tbTitulos.codCat = tbCategorias.codCat;
select tit.nomeCd as "Título", cat.nomeCat as "Categoria" from tbTitulos as tit inner join tbCategorias as cat on tit.codCat = cat.codCat;


--3. Selecione o nome dos CDs, o nome das gravadoras de cada CD e o nome da categoria de cada CD.

-- select nomeCd,nomeGrav, nomeCat from tbTitulos inner join tbGravadoras on tbTitulos.codGrav=tbGravadoras.codGrav inner join tbCategorias on tbTitulos.codGrav = tbCategorias.codCat;   

select tit.nomeCd as "Título", grav.nomeGrav as "Gravadora", cat.nomeCat as "Categoria" from tbTitulos as tit 
inner join tbGravadoras as grav on tit.codGrav=grav.codGrav inner join tbCategorias as cat on grav.codGrav = cat.codCat;   


--4. Selecione o nome dos clientes e os títulos dos CDs vendidos em cada pedido que o cliente fez. 
select  from tbTitulosPedidos as tit inner join tbClientes as cli on tit.codCli = cli.codCli 
