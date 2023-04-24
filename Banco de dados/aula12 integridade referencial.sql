/*--- Integridade Referencial ---

Determina que os valores de campos que aparecem em uma FK devem aparecer, obrigatoriamente, na PK de uma tabela referenciada

Se uma relação R2 inclui uma FK equivalente a chave primaria de uma relação R1, então todo valor de FK em R2 deve:
- Ou ser igual ao valor de pk em alguma tupla de R1.
- Ou ser totalmente nulo.

Assim, utilizamos o ON DELETE CASCADE e o ON UPDATE CASCADE para deletar ou atualizar em "cascata", se eu deletar algo, 
ele vai deletar nos lugares que ele se relazciona tambem. */

CREATE TABLE tabelaPai (
 id_pai 	serial PRIMARY KEY,
 nome_pai	VARCHAR(50)
);

CREATE TABLE tabelaFilho (
 id_filho	serial PRIMARY KEY,
 nome_filho VARCHAR(50),
 fkid_pai   integer,
 CONSTRAINT fkid_pai FOREIGN KEY (fkid_pai)
 	REFERENCES tabelaPai(id_pai)
 	ON DELETE CASCADE
 	ON UPDATE CASCADE
);

--DELETE CASCADE
/*Dados deletados na tabela pai refletem na tabela filho
Agora o que ocorre de deleÃ§Ã£o da tabela filho nÃ£o reflete na tabela pai. */
--UPDATE CASCADE
/*Atualizações na tabela pai refletem na tabela filho
Agora atulizaÃ§Ãµes da tabela filho nÃ£o reflete na tabela pai. */

drop table tabelaPai;
drop table tabelaFilho;

INSERT INTO tabelaPai(nome_pai)
	VALUES ('Ana'), ('Daniel'), ('Caio'), ('Bruna'), ('Luis');
INSERT INTO tabelaFilho (nome_filho, fkid_pai)
	VALUES ('Clara',1), ('Amanda',1), ('Vera',2), ('Sueli',4), ('Marcia',3);

SELECT * FROM tabelaPai;
SELECT * FROM tabelaFilho;
SELECT * FROM tabelaPai, tabelafilho 
	WHERE tabelafilho.fkid_pai = tabelaPai.id_pai;

--Agora vamos testar deletar um dos filhos (Vera)

DELETE FROM tabelaFilho
	WHERE nome_filho = 'Vera';
	
SELECT * FROM tabelaFilho;
SELECT * FROM tabelaPai;

DELETE FROM  tabelaPai
	WHERE nome_pai = 'Ana';
	
--UPDATE CASCADE
/*AtualizaÃ§Ãµes na tabela pai refletem na tabela filho
Agora atulizaÃ§Ãµes da tabela filho nÃ£o reflete na tabela pai. */

--Vamos alterar o id_pai de Caio de 3 para 10
UPDATE tabelaPai SET id_pai = 10 
	WHERE Id_pai = 3;