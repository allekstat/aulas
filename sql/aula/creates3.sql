DROP DATABASE IF EXISTS alex;
CREATE DATABASE alex;
USE alex;

CREATE TABLE clientes 
(cod_cli INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
nome_cli VARCHAR(30),
end_cli VARCHAR(45),
fone_cli VARCHAR(10),
email_cli VARCHAR (20));

CREATE TABLE treinamento
(cod_trein INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Nome_trein VARCHAR (30),
valor DECIMAL (10,2));

CREATE TABLE funcionarios
(cod_func INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Nome_func VARCHAR (30),
End_func VARCHAR (30),
Fone_func VARCHAR(30),
Email_func VARCHAR (45),
Sal_func DECIMAL (10,2),
Data_func DATE);

CREATE TABLE consultores
(cod_cons INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Nome_cons VARCHAR (30),
End_cons VARCHAR (30),
Fone_cons VARCHAR(30),
Email_cons VARCHAR(45),
Sal_cons DECIMAL (10,2),
Data_cons DATE);

CREATE TABLE empregados
(cod_emp INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_emp VARCHAR(30),
data_emp DATE);

CREATE TABLE produtos
(cod_prod INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_prod VARCHAR(45),
tipo_prod VARCHAR(20),
Qtd_prod INT,
Val_prod DECIMAL(10,2));
