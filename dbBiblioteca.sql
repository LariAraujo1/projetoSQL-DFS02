drop database dbBiblioteca;

create database dbBiblioteca;

use dbBiblioteca;

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(30),
email varchar(100),
telefone char(20),  
endereco char(50),
numero varchar(30),
cep char(15),
bairro varchar(50), 
cidade varchar(20),
estado varchar(15),
primary key(codFunc)
);

insert into tbFuncionarios(nome,email,telefone,endereco,numero,cep,bairro,cidade,estado)
	values('Alfredo','aaaa@gmail','92335-4125','Rua das ortencias','35','111111','Triangulo azul','Sao Paulo','SP');

insert into tbFuncionarios(nome,email,telefone,endereço,numero,cep,bairro,cidade,estado)
	values('Maria madalena','madinha@gmail.com','97451-5441','Rua dos Manacas','56','25422680','Jardim florida','Maceio','Alagoas');

insert into tbFuncionarios(nome,email,telefone,endereço,numero,cep,bairro,cidade,estado)
	values('Anisia', 'anisinha@gmail.com','98525-5445','Rua Coronel Ricioti Alegrete','25','0485235','Bom Retiro','Curitiba','Parana');

insert into tbFuncionarios(nome,email,telefone,endereco,numero,cep,bairro,cidade,estado)
	values('Geronimo','gesilva@gmail.com','95632-5864','Rua moisaco Portugues','2','2541512','Jardim das Pedras','Sao paulo','Sao paulo');

insert into tbFuncionarios(nome,email,telefone,endereco,numero,cep,bairro,cidade,estado)
	values('Agatha','agathachristie@gmail.com','9542-3254','Rua Serra de Bragança','5','054251365','Araçatuba','Sao Paulo');

	desc dbBiblioteca;

select * tbFuncionarios;

update tbFuncionarios set nome = 'Alfredinho', email = 'Alfredinho@gmail.com', telefone = '11563254', endereço = 'Rua das ortencias', numero = '53', cep = '1111111', bairro = 'Jardim mirna', cidade = 'Araçatuba', estado = 'Sao Paulo' where codFunc=1;
update tbFuncionarios set nome = 'Madinha', email= 'Madu@gmail.com', telefone = '115368452', endereço = 'Avenida Esbertalina Barbosa Damiani', numero= '12', cep='15362541', bairro = 'Jardim florida',cidade='Jataí',estado='Goias' where codFunc=2;
update tbFuncionarios set nome = 'Antonina', email='Antonina@gmail.com', telefone='124558834', endereco= 'Franca',numero='25',cep='455874664', bairro='Rua Frederico Moura',cidade='jundiai' estado='Sao Paulo' where codFunc=3; 

select codFunc as 'código', nome as 'Funcionario', email as 'E-mail',telefone as 'Numero' from tbFuncionarios; 

delete from tbFuncionarios where codFunc=2;

