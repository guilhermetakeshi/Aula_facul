/*

Aula 24/04/23

Select com junções utilizando a função JOIN

*/

CREATE TABLE material (
	id_material INTEGER PRIMARY KEY, 	
	nome VARCHAR(30) 
); 
CREATE TABLE pessoa (
	id_pessoa INTEGER PRIMARY KEY, 	
	nome VARCHAR(30), 	
	id_materialfk INTEGER, 
	CONSTRAINT material_if_fk FOREIGN KEY(id_materialfk) 
	REFERENCES material(id_material) 
); 

INSERT INTO  material (id_material, nome) VALUES
(1,'bola'),(2,'capacete'),(3,'bone'),(4,'luva'),(5,'chuteira'),(6,'globo'),(7,'taco'); 
INSERT INTO  pessoa (id_pessoa, nome,id_materialfk) VALUES
(1,'Pedro',1),(2,'Rafael',6),(3,'Marcos',7);   
INSERT INTO  pessoa (id_pessoa, nome) VALUES
(4,'Daniel');   



--Para sabermos quais matÃ©rias cada pessoa possui Ã© necessÃ¡rio 
--fazer uma consulta verificando quais materiais sÃ£o utilizados pelas pessoas. 
SELECT material.nome, pessoa.nome 
	FROM material, pessoa
	WHERE material.id_material = pessoa.id_materialfk;
	
-- fazendo a mesma coisa com o INNER JOIN:
	
SELECT material.nome, pessoa.nome
	FROM pessoa INNER JOIN material
	ON material.id_material = pessoa.id_materialfk;
	
-- left join te entrega a mesma coisa que o inner join, com a adição daquele que não tem representande na outra tabela
-- vai mostrar tudo que tem na tabela A com e sem relacionamento com a tabela b

SELECT pessoa.nome, material.nome
	FROM pessoa LEFT JOIN material
	ON material.id_material = pessoa.id_materialfk;
	
-- neste left join abaixo, mostra só aquele da tabela A que não tem relação com a tabela B

SELECT pessoa.nome, material.nome
	FROM pessoa LEFT JOIN material
	ON material.id_material = pessoa.id_materialfk
	WHERE material.id_materialfk IS NULL;
	
-- a mesma coisa para o right join, vai te mostrar toda a tabela B a parte com relacionamento e a parte sem relacionamento com a tabela B

SELECT pessoa.nome, material.nome
	FROM pessoa RIGHT JOIN material
	ON material.id_material = pessoa.id_materialfk;

SELECT pessoa.nome, material.nome
	FROM pessoa RIGHT JOIN material
	ON material.id_material = pessoa.id_materialfk
	WHERE pessoa.id_materialfk IS NULL;
	
-- temos a situação de querer trazer todas as informações / informações que estão na tabela A, na tabela B e a intersecção deles

SELECT pessoa.nome, material.nome
	FROM pessoa FULL OUTER JOIN material
	ON material.id_material = pessoa.id_materialfk;

-- temos a situação de querer quem não tem relação com nada tanto da tabela A que não tem relação com a tabela B ou da tabela B que não tem relação com a tabelas A

SELECT pessoa.nome, material.nome
	FROM pessoa FULL OUTER JOIN material
	ON material.id_material = pessoa.id_materialfk
	WHERE pessoa.id_materialfk is null or material.id_material IS NULL;


