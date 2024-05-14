drop database dbClinicaMedica;

create database dbClinicaMedica;

use dbClinicaMedica;	


create table tbMedico(
idMedico int not null auto_increment,
nmMedico varchar(45),
telefoneMedico varchar(9),
primary key(idMedico)
);

create table tbReceitaMedica(
idReceitaMedica int not null,
descricao varchar(500),
primary key(idReceitaMedica)
);

create table tbPaciente(
idPaciente int not null auto_increment,
nmPaciente varchar(45),
telefonePaciente varchar(9),
convenio varchar(45),
primary key(idPaciente)
);

create table tbConsulta(
idConsulta int not null auto_increment,
dt_consulta datetime,
Medico_idMedico int,
Paciente_idPaciente int,
ReceitaMedica_idReceitaMedica int,
primary key(idconsulta),
foreign key (Medico_idMedico) references tbMedico(idMedico),
foreign key (Paciente_idPaciente) references tbPaciente(idPaciente),
foreign key(ReceitaMedica_idReceitaMedica) references tbReceitaMedica(idReceitaMedica)
);

desc tbMedico;
desc tbReceitaMedica;
desc tbPaciente;
desc tbConsulta;