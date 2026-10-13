drop database if exists skillbridge;
create database skillbridge;
use skillbridge;

create table usuarios(
    id int primary key auto_increment,
    nome varchar(50) not null,
    email varchar(100) not null unique,
    senha blob(128) not null comment "sha512",
    descricao longtext,
    endereco text not null,
    contato text
);

create table empresas(
    id int primary key auto_increment,
    cnpj char(14) not null unique,
    
    usuario int not null, foreign key(usuario) references usuarios(id)
);

create table instituicoes(
    id int primary key auto_increment,
    cnpj char(14) not null unique,

    usuario int not null, foreign key(usuario) references usuarios(id)
);

create table cursos(
    id int primary key auto_increment,
    nome varchar(50) not null unique
);

create table alunos(
    id int primary key auto_increment,
    ra char(13) not null unique,
    periodo char(1) not null,

    usuario int not null, foreign key(usuario) references usuarios(id),
    curso int not null, foreign key(curso) references cursos(id),
    instituicao int not null, foreign key(instituicao) references instituicoes(id)
);

create table vagas(
    id int primary key auto_increment,
    tipo varchar(20) not null,
    descricao longtext,
    salario decimal(11, 2) not null,
    horario_inicio time not null,
    horario_termino time not null,
    numero_de_vagas int,
    
    empresa int not null, foreign key(empresa) references empresas(id)
);

create table candidaturas(
    id int primary key auto_increment,
    aceito boolean,

    aluno int not null, foreign key(aluno) references alunos(id),
    vaga int not null, foreign key(vaga) references vagas(id)
);

create table categorias(
    id int primary key auto_increment,
    nome varchar(20) not null
);

create table tags(
    id int primary key auto_increment,
    nome varchar(30) not null
);

create table tags_x_categorias(
    tag int not null, foreign key(tag) references tags(id),
    categoria int not null, foreign key(categoria) references categorias(id),

    primary key(tag, categoria)
);

create table tags_x_vagas(
    tag int not null, foreign key(tag) references tags(id),
    vaga int not null, foreign key(vaga) references vagas(id),

    primary key(tag, vaga)
);

create table tags_x_alunos(
    tag int not null, foreign key(tag) references tags(id),
    aluno int not null, foreign key(aluno) references alunos(id),

    primary key(tag, aluno)
);

delimiter ;;
create function cadastrar_usuario(
    nome varchar(50),
    email varchar(100),
    senha varchar(50),
    endereco text,
    contato text,
    descricao longtext
)
returns int reads sql data
begin
    declare id int;

    insert into usuarios(nome, email, senha, endereco, contato, descricao)
    values(nome, email, sha2(senha, 512), endereco, contato, descricao);

    set id = last_insert_id();
    return id;
end;;
delimiter ;

delimiter ;;
create procedure cadastrar_empresa(
    nome varchar(50),
    email varchar(100),
    senha varchar(50),
    endereco text,
    contato text,
    descricao longtext,
    cnpj char(14)
)
begin
    declare id_usuario int;
    declare exit handler for sqlexception
    begin
        rollback;
        resignal;
    end;

    start transaction;

    insert into usuarios(nome, email, senha, endereco, contato, descricao)
    values(nome, email, sha2(senha, 512), endereco, contato, descricao);

    set id_usuario = last_insert_id();

    insert into empresas(cnpj, usuario)
    values(cnpj, id_usuario);

    commit;
end;;
delimiter ;

delimiter ;;
create procedure cadastrar_instituicao(
    nome varchar(50),
    email varchar(100),
    senha varchar(50),
    endereco text,
    contato text,
    descricao longtext,
    cnpj char(14)
)
begin
    declare id_usuario int;
    declare exit handler for sqlexception
    begin
        rollback;
        resignal;
    end;

    start transaction;

    insert into usuarios(nome, email, senha, endereco, contato, descricao)
    values(nome, email, sha2(senha, 512), endereco, contato, descricao);

    set id_usuario = last_insert_id();

    insert into instituicoes(cnpj, usuario)
    values(cnpj, id_usuario);

    commit;
end;;
delimiter ;

delimiter ;;
create procedure cadastrar_aluno(
    nome varchar(50),
    email varchar(100),
    senha varchar(50),
    endereco text,
    contato text,
    descricao longtext,
    ra char(13),
    periodo char(1),
    curso int,
    instituicao int
)
begin
    declare id_usuario int;
    declare exit handler for sqlexception
    begin
        rollback;
        resignal;
    end;

    start transaction;

    insert into usuarios(nome, email, senha, endereco, contato, descricao)
    values(nome, email, sha2(senha, 512), endereco, contato, descricao);

    set id_usuario = last_insert_id();

    insert into alunos(ra, periodo, usuario, curso, instituicao)
    values(ra, periodo, id_usuario, curso, instituicao);

    commit;
end;;
delimiter ;

-- ---------------------------------------------------------------------------
-- Dados de teste
-- ---------------------------------------------------------------------------

insert into usuarios(nome, email, senha, endereco, contato, descricao) values
('Maria Silva', 'maria@teste.com', sha2('123456', 512), 'Rua A, 10', '(11)1111-1111', 'Estudante de tecnologia'),
('João Souza', 'joao@teste.com', sha2('123456', 512), 'Rua B, 20', '(11)2222-2222', 'Desenvolvedor backend'),
('Ana Costa', 'ana@teste.com', sha2('123456', 512), 'Rua C, 30', '(11)3333-3333', 'Analista de dados'),
('Pedro Lima', 'pedro@teste.com', sha2('123456', 512), 'Rua D, 40', '(11)4444-4444', 'Empresário'),
('Lucas Rocha', 'lucas@teste.com', sha2('123456', 512), 'Rua E, 50', '(11)5555-5555', 'Professor universitário'),
('Beatriz Alves', 'beatriz@teste.com', sha2('123456', 512), 'Rua F, 60', '(11)6666-6666', 'Coordenadora acadêmica'),
('Carlos Mendes', 'carlos@teste.com', sha2('123456', 512), 'Rua G, 70', '(11)7777-7777', 'Aluno do curso de TI'),
('Fernanda Reis', 'fernanda@teste.com', sha2('123456', 512), 'Rua H, 80', '(11)8888-8888', 'Aluna do curso de TI'),
('Rafael Nunes', 'rafael@teste.com', sha2('123456', 512), 'Rua I, 90', '(11)9999-9999', 'Empresa de software'),
('Julia Ramos', 'julia@teste.com', sha2('123456', 512), 'Rua J, 100', '(11)1010-1010', 'Gestora de instituição');

insert into empresas(cnpj, usuario) values
('12345678000100', 4),
('98765432000199', 9);

insert into instituicoes(cnpj, usuario) values
('11111111000111', 5),
('22222222000122', 10);

insert into cursos(nome) values
('Engenharia de Software'),
('Ciência da Computação'),
('Análise e Desenvolvimento de Sistemas');

insert into alunos(ra, periodo, usuario, curso, instituicao) values
('202300000001', 'm', 1, 1, 1),
('202300000002', 't', 2, 2, 1),
('202300000003', 'n', 3, 3, 2),
('202300000004', 'm', 7, 1, 1),
('202300000005', 't', 8, 2, 2);

insert into vagas(tipo, descricao, salario, horario_inicio, horario_termino, numero_de_vagas, empresa) values
('Estágio', 'Vaga para estágio em desenvolvimento web', 2500.00, '08:00:00', '12:00:00', 3, 1),
('CLT', 'Desenvolvedor backend pleno', 6000.00, '09:00:00', '18:00:00', 2, 1),
('Freelance', 'Aplicativo mobile para empresa', 3500.00, '10:00:00', '16:00:00', 1, 2),
('PJ', 'Suporte técnico para sistemas', 4200.00, '13:00:00', '19:00:00', 2, 2);

insert into candidaturas(aceito, aluno, vaga) values
(0, 1, 1);
