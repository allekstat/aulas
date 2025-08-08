-- Inserção de dados na tabela artistas
INSERT INTO artistas (codigo, nome) VALUES 
(1, 'Marisa Monte'),
(2, 'Gilberto Gil'),
(3, 'Caetano Veloso'),
(4, 'Milton Nascimento'),
(5, 'Legião Urbana'),
(6, 'The Beatles'),
(7, 'Rita Lee');

-- Inserção de dados na tabela gravadoras
INSERT INTO gravadoras (codigo, nome) VALUES
(1, 'Polygram'),
(2, 'EMI'),
(3, 'Som Livre'),
(4, 'Sony Music');

-- Inserção de dados na tabela categorias
INSERT INTO categorias (codigo, nome) VALUES
(1, 'MPB'),
(2, 'Trilha Sonora'),
(3, 'Rock Internacional'),
(4, 'Rock Nacional');

-- Inserção de dados na tabela estados
INSERT INTO estados (sigla, nome) VALUES
('SP', 'São Paulo'),
('MG', 'Minas Gerais'),
('RJ', 'Rio de Janeiro');

-- Inserção de dados na tabela cidades
INSERT INTO cidades (codigo, estado, nome) VALUES
(1, 'SP', 'São Paulo'),
(2, 'SP', 'Sorocaba'),
(3, 'SP', 'Jundiaí'),
(4, 'SP', 'Americana'),
(5, 'SP', 'Araraquara'),
(6, 'MG', 'Ouro Preto'),
(7, 'SP', 'Cachoeiro de Itapemirim');

-- Inserção de dados na tabela clientes
INSERT INTO clientes (codigo, cidade, nome, endereco, renda, sexo) VALUES
(1, 1, 'José Nogueira', 'Rua A', 1500.00, 'm'),
(2, 1, 'Angelo Pereira', 'Rua B', 2000.00, 'm'),
(3, 1, 'Além Mar paranhos', 'Rua C', 1500.00, 'f'),
(4, 1, 'Catarina Souza', 'Rua D', 892.00, 'f'),
(5, 1, 'Vagner Costa', 'Rua E', 950.00, 'm'),
(6, 2, 'Antenor da Costa', 'Rua F', 1582.00, 'm'),
(7, 2, 'Maria Amélia de Sousa', 'Rua G', 1152.00, 'f'),
(8, 2, 'Paulo Roberto Silva', 'Rua H', 3250.00, 'm'),
(9, 3, 'Fátima Souza', 'Rua I', 1632.00, 'f'),
(10, 3, 'Joel da Rocha', 'Rua J', 2000.00, 'm');

-- Inserção de dados na tabela conjuges
INSERT INTO conjuges (cliente, nome, renda, sexo) VALUES
(1, 'Carla Nogueira', 2500.00, 'f'),
(2, 'Emília Pereira', 5500.00, 'f'),
(6, 'Altiva da Costa', 3000.00, 'f'),
(7, 'Carlos de Souza', 3250.00, 'm');

-- Inserção de dados na tabela funcionarios
INSERT INTO funcionarios (codigo, nome, endereco, salario, sexo) VALUES
(1, 'Vânia Gabriela Pereira', 'Rua A', 2500.00, 'f'),
(2, 'Norberto Pereira da Silva', 'Rua B', 3000.00, 'm'),
(3, 'Olavio Linhares', 'Rua C', 5800.00, 'm'),
(4, 'Paula da Silva', 'Rua D', 3000.00, 'f'),
(5, 'Rolando Rocha', 'Rua E', 2000.00, 'm');

-- Inserção de dados na tabela dependentes
INSERT INTO dependentes (codigo, funcionario, nome, sexo) VALUES
(1, 1, 'Ana Pereira', 'f'),
(2, 1, 'Roberto Pereira', 'm'),
(3, 1, 'Celso Pereira', 'm'),
(4, 3, 'Brisa Linhares', 'f'),
(5, 3, 'Mari Sol Linhares', 'f'),
(6, 4, 'Sonia da Silva', 'f');

-- Inserção de dados na tabela titulos
INSERT INTO titulos (codigo, categoria, gravadora, nome, valor, quantidade) VALUES
(1, 1, 1, 'Tribalista', 30.00, 1500),
(2, 1, 2, 'Tropicália', 50.00, 500),
(3, 1, 1, 'Aquele Abraço', 50.00, 600),
(4, 1, 2, 'Refazenda', 60.00, 1000),
(5, 1, 3, 'Totalmente demais', 50.00, 2000),
(6, 1, 3, 'Travessia', 55.00, 500),
(7, 1, 2, 'Courage', 30.00, 200),
(8, 4, 3, 'Legião Urbana', 20.00, 100),
(9, 3, 2, 'The Beatles', 30.00, 300),
(10, 4, 1, 'Rita Lee', 30.00, 500);

-- Inserção de dados na tabela pedidos
INSERT INTO pedidos (numero, cliente, funcionario, data_pedido, valor) VALUES
(1, 1, 2, '2022-02-02', 1500.00),
(2, 3, 4, '2022-05-02', 50.00),
(3, 4, 3, '2022-06-02', 100.00),
(4, 1, 4, '2023-02-02', 200.00),
(5, 7, 5, '2023-03-02', 300.00),
(6, 4, 4, '2023-03-02', 100.00),
(7, 5, 5, '2023-03-02', 50.00),
(8, 8, 2, '2023-03-02', 50.00),
(9, 2, 2, '2023-03-02', 2000.00),
(10, 7, 1, '2023-03-02', 3000.00);

-- Inserção de dados na tabela titulos_artistas
INSERT INTO titulos_artistas (titulo, artista) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 3),
(6, 4),
(7, 4),
(8, 5),
(9, 6),
(10, 7);

-- Inserção de dados na tabela titulos_pedidos
INSERT INTO titulos_pedidos (pedido, titulo, quantidade, valor) VALUES
(1, 1, 2, 30.00),
(1, 2, 3, 20.00),
(2, 1, 1, 50.00),
(2, 2, 3, 30.00),
(3, 1, 2, 40.00),
(4, 2, 3, 20.00),
(5, 1, 2, 25.00),
(6, 2, 3, 30.00),
(7, 4, 2, 55.00),
(8, 1, 4, 60.00),
(9, 2, 3, 15.00),
(10, 7, 2, 15.00);