CREATE TABLE filmes(

	codigo	SERIAL, /* serial é um tipo de dado inteiro que vai gerando automaticamente, em série */
	titulo VARCHAR(100),
	duracao INT,
	tipo VARCHAR(100),
	
	CONSTRAINT codpk PRIMARY KEY (codigo) /* dentro das chaves, coloca quem vc quer que seja a primary key
	*/

);

INSERT INTO filmes(titulo, duracao, tipo) VALUES
('O Poderoso Chefão', 153, 'Policial'),
('A Lista de Schindler', 189, 'Histórico'),
('O Rei Leão', 78, 'Animação'),
('Vingadores: Ultimato', 180, 'Fantasia'),
('De volta para o futuro', 94, 'Ficção Cientifica'),
('Interestelar', 169, 'Ficção Cientifica');

SELECT * FROM filmes;

ALTER TABLE filmes ADD COLUMN avaliacao INTEGER;

UPDATE filmes SET avaliacao = 5 WHERE codigo = 3;
UPDATE filmes SET avaliacao = 10 WHERE codigo = 6;
UPDATE filmes SET tipo = 'Fantasia/Ação' WHERE titulo = 'Vingadores: Ultimato';
UPDATE filmes SET duracao = '96' WHERE titulo = 'De volta para o futuro';
UPDATE filmes SET titulo = 'Tudo em todo lugar, ao mesmo tempo', tipo = 'Ficção Científica/Aventura', duracao = 139 WHERE codigo = 2
UPDATE filmes SET avaliacao = 10 WHERE codigo = 2

SELECT * FROM filmes; /* seleção para mostrar todos os dados */

SELECT titulo, duracao FROM filmes where duracao <100;

SELECT * FROM filmes WHERE duracao < 100;
/*Consulte todos os dados dos filmes que tem maior do que 100 minutos*/
SELECT * FROM filmes WHERE duracao > 100;
/*Consultar os filmes com os codigos de 2 a 4*/
SELECT * FROM filmes WHERE codigo >= 2 and codigo <= 4;
/* ou pode fazer assim: */
SELECT * FROM filmes WHERE codigo 	BETWEEN 2 and 4; 
/*Mostre os dados do filme Vingadores*/
SELECT * FROM filmes WHERE titulo = 'Vingadores: ultimato';
SELECT * FROM filmes WHERE titulo LIKE 'De volta para %'; /* usa o % para completar e 
pesquisa uma parte do titulo*/
SELECT * FROM filmes WHERE titulo ILIKE 'Animação'; /* não faz a diferenciação de 
maiúscula para minúsculas*/
SELECT * FROM filmes ORDER BY codigo ASC;
SELECT * FROM filmes ORDER BY titulo DESC;
/*Mostre os filmes dos tipos de animação e policial*/

SELECT titulo FROM filmes WHERE duracao BETWEEN 60 and 160 order by titulo asc;

SELECT * FROM filmes WHERE tipo = 'Animação' and tipo = 'Policial';
SELECT * FROM filmes WHERE tipo in ('Animação','Policial');





