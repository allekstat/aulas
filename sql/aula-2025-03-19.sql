CREATE TABLE gravadoras (
	gravadora_id INT PRIMARY KEY AUTO_INCREMENT,

	gravadora_nome VARCHAR(31)
);

CREATE TABLE artistas (
	artista_id INT PRIMARY KEY AUTO_INCREMENT,

	artista_nome VARCHAR(31)
);

CREATE TABLE dvds (
	dvd_id INT PRIMARY KEY AUTO_INCREMENT,

	dvd_nome VARCHAR(31),
	dvd_titulo VARCHAR(31),
	dvd_valor DECIMAL(5,2),
	dvd_quantidade_estoque INT,
	dvd_gravadora INT,
	

	FOREIGN KEY dvd_gravadora REFERENCES gravadora (gravadora_id)
);
