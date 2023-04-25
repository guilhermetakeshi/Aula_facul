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
 	ON DELETE SET NULL
 	ON UPDATE SET NULL
);

--DELETE CASCADE
/*Dados deletados na tabela pai nÃ£o reflete na tabela filho
O que ocorre de deleÃ§Ã£o da tabela filho nÃ£o reflete na tabela pai. */

--UPDATE CASCADE
/*AtualizaÃ§Ãµes na tabela pai refletem na tabela filho
Agora atulizaÃ§Ãµes da tabela filho nÃ£o reflete na tabela pai. */


drop table tabelaPai;
drop table tabelaFilho;

INSERT INTO tabelaPai(nome_pai)
VALUES ('Ana'), ('Daniel'), ('Caio'), ('Bruna'), ('Luis');
INSERT INTO tabelaFilho (nome_filho, fkid_pai)
VALUES ('Clara',1), ('Amanda',1), ('Vera',2), ('Sueli',4), ('Marcia',3);

select* from tabelaPai;
select* from tabelaFilho;

DELETE FROM  tabelaPai
	WHERE nome_pai = 'Ana';
	
UPDATE tabelaPai SET id_pai = 10 
	WHERE id_pai = 3;