drop database dbEscola;

create database dbEscola;

use dbEscola;


create table tbTurmas(
idTurma int not null auto_increment,
nome varchar(100) not null,
primary key(idTurma)
);


create table tbFuncionarios(
idfunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
telefone char(9) not null,
cpf char(14) not null unique,
primary key(idFunc)
);

create table tbSalas(
idSala int not null auto_increment,
descricao varchar(100),
localizacao varchar(30),
data datetime,
hora datetime,
primary key(idSala)
);


create table tbAlunos(
idAluno int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
cpf char (14) not null unique,
sexo char(1) default 'F' check(sexo in('F','M')),
idade int default 0 check(idade <0),
primary key(idAluno)
);

create table tbProfessores(
re char(7) not null,
idFunc int not null,
primary key(re),
foreign key(idFunc) references tbFuncionarios(idFunc)
);

create table tbCursos(
idCurso int not null auto_increment,
nome varchar(100) not null,
data date not null,
hora time not null,
re char(7) not null,
idSala int not null,
primary key(idCurso),
foreign key(re) references tbProfessores(re), 
foreign key(idSala) references tbSalas(idSala)
);

create table tbUsuarios(
idUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(30) not null,
idFunc int not null,
primary key(idUsu),
foreign key(idFunc) references tbFuncionarios(idFunc) 
);


create table tbMatriculas(
idMatr int(13) not null auto_increment,
idCurso int not null, 
idTurma int not null,
idUsu int not null,
idAluno int not null,
data date,
hora time,
primary key(idMatr),
foreign key(idCurso) references tbCursos(idCurso),
foreign key(idTurma) references tbTurmas(idTurma),
foreign key(idUsu) references tbUsuarios(idUsu),
foreign key(idAluno) references tbAlunos(idAluno) 
);


desc tbTurmas;
desc tbFuncionarios;
desc tbSalas;
desc tbAlunos; 
desc tbProfessores;
desc tbCursos;
desc tbUsuarios;
desc tbMatriculas;

