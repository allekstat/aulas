drop database if exists alex;
create database alex;
use alex;

create table clientes 
(cod_cli int primary key auto_increment not null, 
nome_cli varchar(30),
end_cli varchar(45),
fone_cli varchar(10),
email_cli varchar (20));

create table treinamento
(cod_trein int primary key auto_increment not null,
Nome_trein varchar (30),
valor decimal (10,2));

Create table funcionarios
(cod_func int primary key auto_increment not null,
Nome_func varchar (30),
End_func varchar (30),
Fone_func varchar(30),
Email_func varchar (45),
Sal_func decimal (10,2),
Data_func date);

Create table consultores
(cod_cons int primary key auto_increment not null,
Nome_cons varchar (30),
End_cons varchar (30),
Fone_cons varchar(30),
Email_cons varchar(45),
Sal_cons decimal (10,2),
Data_cons date);

create table empregados
(cod_emp int primary key auto_increment not null,
nome_emp varchar(30),
data_emp date);

create table produtos
(cod_prod int primary key auto_increment not null,
nome_prod varchar(45),
tipo_prod varchar(20),
Qtd_prod int,
Val_prod decimal(10,2));

