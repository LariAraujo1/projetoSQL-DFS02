-- versão professor

drop database dbConsultorio;


create database dbConsultorio;

use dbConsultorio;

create table tbMedicos(
idMedico int not null auto_increment,
nome varchar(100),
telefone char(10) unique,
primary key(idMedico)
);

create table tbPacientes(
idPaciente int not null auto_increment,
nome varchar(100),
telefone char(10) unique,
convenio varchar(100),
primary key(idPaciente)
);



create table tbReceitaMedica(
idReceitaMedica int not null auto_increment,
descricao varchar(100),
primary key(idReceitaMedica)
);
create table tbConsultas(
idConsulta int not null auto_increment,
data datetime,
idMedico int not null,
idPaciente int not null,
idReceitaMedica int not null,
primary key(idConsulta),
foreign key(idMedico) references tbMedicos(idMedico),
foreign key(idPaciente) references tbPacientes(idPaciente),
foreign key(idReceitaMedica) references tbReceitaMedica(idReceitaMedica)
);

desc tbMedicos;
desc tbPacientes;
desc tbReceitaMedica;
desc tbConsultas;

--inserindo registros

insert into tbMedicos(nome,telefone) values('Divaldo Antunes', '97326-5488'); 
insert into tbMedicos(nome,telefone) values('Edinaldo Silva', '978632-8523'); 
insert into tbMedicos(nome,telefone) values('Lima Barreto', '95362-5852'); 

insert into tbPacientes(nome,telefone, convenio) values('Sabrina Vieira', 9125-5851, 'Porto Saude');
insert into tbPacientes(nome,telefone, convenio) values('Pedro Oliveira', 9555-5641, 'Amil');
insert into tbPacientes(nome,telefone, convenio) values('Vania Salgueira', 9632-3214, 'Unimed');
insert into tbPacientes(nome,telefone, convenio) values('Sonia Antunes', 9856-2256, 'Porto Saude');
insert into tbPacientes(nome,telefone, convenio) values('Mila Alves', 9256-8569, 'Notredame');

insert into tbReceitaMedica(descricao) values('Fazer exercicios');
insert into tbReceitaMedica(descricao) values('Tomar suco');
insert into tbReceitaMedica(descricao) values('Correr duas vezes na semana');
insert into tbReceitaMedica(descricao) values('Andar de bicicleta');
insert into tbReceitaMedica(descricao) values('Brincar');


insert into tbConsultas(data,idMedico,idPaciente,idReceitaMedica) values('2024/06/18',2,5,3);
insert into tbConsultas(data,idMedico,idPaciente,idReceitaMedica) values('2024/06/18',1,2,2);
insert into tbConsultas(data,idMedico,idPaciente,idReceitaMedica) values('2024/06/18',3,4,5);
insert into tbConsultas(data,idMedico,idPaciente,idReceitaMedica) values('2024/06/18',2,3,1);
insert into tbConsultas(data,idMedico,idPaciente,idReceitaMedica) values('2024/06/18',1,1,4);

---Pesquisando registros

select * from tbMedicos;
select * from tbPacientes;
select * from tbReceitaMedica;
select * from tbConsultas;

select med.nome as 'Medico', pac.nome as 'Paciente', rec.descricao as 'Receita' from tbConsultas as con
 inner join tbMedicos as med on con.idMedico =med.idMedico 
 inner join tbPacientes as pac on con.idPaciente=pac.idPaciente 
 inner join tbReceitaMedica as rec on con.idReceitaMedica=rec.idReceitaMedica;

select * from tbMedicos where nome like 'l%';

select pac.nome as 'Nome do Paciente', med.nome as 'Nome do Medico' from tbConsultas as con inner join tbMedicos as med on con.idMedico=med.idMedico
inner join tbPacientes as pac on con.idPaciente=pac.idPaciente;  