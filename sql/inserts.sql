INSERT INTO autores (id, nome) VALUES
(1, "Billie Eilish"),
(2, "Caetano Veloso"),
(3 ,"Tame Impala"),
(4, "Anitta"),
(5, "Bob Dylan"),
(6, "Shakira"),
(7, "Travis Scott"),
(8, "Gal Costa"),
(9, "Ariana Grande"),
(10, "Jimi Hendrix");

INSERT INTO gravadoras (id, nome) VALUES
(1, "Universal Music Group"),
(2, "Sony Music Entertainment"),
(3, "Warner Music Group"),
(4, "Island Records"),
(5, "Columbia Records"),
(6, "RCA Records"),
(7, "Atlantic Records"),
(8, "Capitol Records"),
(9, "Def Jam Recordings"),
(10, "Parlophone Records");

INSERT INTO dvds (id, titulo, nome, valor, quantidade, categoria, gravadora) VALUES
(1, "Beyoncé - I Am... World Tour", "-", 40.00, 3, "Pop", 3),
(2, "The Rolling Stones - Shine a Light", "-", 30.00, 5, "Rock", 7),
(3, "AC/DC - Live at River Plate", "-", 20.00, 2, "Metal", 1),
(4, "Metallica - S&M2", "-", 20.00, 2, "Soul / Pop", 9),
(5, "Paul McCartney - Good Evening New York City", "-", 150.00, 4, "Rock Clássico", 5),
(6, "Pink Floyd - Pulse", "-", 100.00, 6, "Rock Clássico / Hard Rock", 8),
(7, "Adele - Live at the Royal Albert Hall", "-", 100.00, 1, "Pop / Latin", 2),
(8, "Madonna - The Confessions Tour", "-", 65.00, 7, "Rock / Alternativo", 6),
(9, "Queen - Live at Wembley Stadium", "-", 35.00, 3, "Pop / Rock Alternativo", 10),
(10, "Nirvana - Live! Tonight! Sold Out!!", "-", 150.00, 5, "Pop / Dance", 4);

INSERT INTO dvd_tem_autor (dvd, autor) VALUES
(4, 7),
(1, 10),
(3, 8),
(6, 2),
(5, 9),
(3, 6),
(9, 2),
(7, 4),
(8, 1),
(5, 10);

INSERT INTO enderecos (id, estado, cidade, logradouro) VALUES
(1, "São Paulo", "São Paulo", "Rua das Flores, 123"),
(2, "Rio de Janeiro", "Rio de Janeiro", "Avenida Atlântica, 456"),
(3, "Minas Gerais", "Belo Horizonte", "Rua do Mercado, 789"),
(4, "Paraná", "Curitiba", "Avenida Paraná, 321"),
(5, "Rio Grande do Sul", "Porto Alegre", "Rua das Acácias, 654"),
(6, "Bahia", "Salvador", "Rua da Liberdade, 987"),
(7, "Ceará", "Fortaleza", "Rua São João, 159"),
(8, "Pernambuco", "Recife", "Avenida Boa Viagem, 753"),
(9, "Goiás", "Goiânia", "Rua do Sol, 258"),
(10, "São Paulo", "Campinas", "Avenida dos Trabalhadores, 468"),
(11, "Santa Catarina", "Florianópolis", "Rua dos Três Corais, 111"),
(12, "Mato Grosso", "Cuiabá", "Avenida dos Verdes Campos, 222"),
(13, "Espírito Santo", "Vitória", "Rua das Palmeiras, 333"),
(14, "Alagoas", "Maceió", "Avenida do Mar, 444"),
(15, "Amazonas", "Manaus", "Rua da Paz, 555"),
(16, "Pará", "Belém", "Avenida Centenário, 666"),
(17, "Rio Grande do Norte", "Natal", "Rua das Pedras, 777"),
(18, "Maranhão", "São Luís", "Avenida Beira-Mar, 888"),
(19, "Distrito Federal", "Brasília", "Rua do Lago, 999"),
(20, "Sergipe", "Aracaju", "Rua do Comércio, 1000");

INSERT INTO clientes (id, nome, sexo, renda, estado_civil, endereco) VALUES
(1, "João Silva", "Masculino", 3500.00, "Solteiro", 1),
(2, "Maria Oliveira", "Feminino", 5000.00, "Casada", 2),
(3, "Carlos Pereira", "Masculino", 4500.00, "Divorciado", 3),
(4, "Ana Souza", "Feminino", 3200.00, "Solteira", 4),
(5, "Roberto Costa", "Masculino", 6000.00, "Casado", 5),
(6, "Juliana Santos", "Feminino", 4000.00, "Viúva", 6),
(7, "Fernando Lima", "Masculino", 8000.00, "Casado", 7),
(8, "Patrícia Gomes", "Feminino", 2700.00, "Solteira", 8),
(9, "Marcelo Rocha", "Masculino", 5500.00, "Divorciado", 9),
(10, "Fernanda Alves", "Feminino", 3800.00, "Casada", 10);

INSERT INTO conjuges (id, nome, renda, sexo, cliente) VALUES
(1, "Mariana Silva", 4500.00, "Feminino", 1),
(2, "Roberto Costa", 5200.00, "Masculino", 2),
(3, "Juliana Pereira", 3800.00, "Feminino", 3),
(4, "Carlos Oliveira", 6700.00, "Masculino", 4),
(5, "Patrícia Lima", 5000.00, "Feminino", 5),
(6, "André Souza", 6200.00, "Masculino", 6),
(7, "Fernanda Gomes", 3900.00, "Feminino", 7),
(8, "Lucas Almeida", 5500.00, "Masculino", 8),
(9, "Sofia Rocha", 4300.00, "Feminino", 9),
(10, "Eduardo Martins", 5100.00, "Masculino", 10);

INSERT INTO funcionarios (id, nome, sexo, salario, endereco) VALUES
(1, "Carlos Silva", "Masculino", 3500.00, 11),
(2, "Mariana Oliveira", "Feminino", 4200.00, 12),
(3, "Roberto Souza", "Masculino", 2800.00, 13),
(4, "Ana Costa", "Feminino", 3200.00, 14),
(5, "Fernanda Pereira", "Feminino", 3900.00, 15),
(6, "João Lima", "Masculino", 5500.00, 16),
(7, "Patrícia Almeida", "Feminino", 4700.00, 17),
(8, "Lucas Martins", "Masculino", 4000.00, 18),
(9, "Marta Rocha", "Feminino", 5100.00, 19),
(10, "Eduardo Santos", "Masculino", 4500.00, 20);

INSERT INTO dependentes (id, nome, sexo, tipo, funcionario) VALUES
(1, "Ana Silva", "Feminino", "Filho", 1),
(2, "João Souza", "Masculino", "Filho", 2),
(3, "Maria Costa", "Feminino", "Esposa", 3),
(4, "Carlos Oliveira", "Masculino", "Filho", 4),
(5, "Fernanda Pereira", "Feminino", "Esposa", 5),
(6, "Lucas Almeida", "Masculino", "Filho", 6),
(7, "Juliana Lima", "Feminino", "Esposa", 7),
(8, "Pedro Rocha", "Masculino", "Filho", 8),
(9, "Marta Almeida", "Feminino", "Esposa", 9),
(10, "Lucas Martins", "Masculino", "Filho", 10);

INSERT INTO pedidos (id, cliente, dvd) VALUES
(1, 1, 3),
(2, 2, 5),
(3, 3, 7),
(4, 4, 9),
(5, 5, 1),
(6, 6, 4),
(7, 7, 6),
(8, 8, 2),
(9, 9, 8),
(10, 10, 10);