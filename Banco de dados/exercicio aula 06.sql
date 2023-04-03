/*
1) Criar um banco de dados chamado: Projeto_controle_compras
2) Criar uma tabela chamada Compras.
À saber:
 codigo → números sequencias;
Valor → tipo numérico com 8 digitos, sendo 2 casas decimais
Descricao → tipo literal com 50 caracteres
Recebido → tipo lógico
Obs: o campo código é chave primária.
INSERT INTO compras (valor, descricao, data_compra, recebido) VALUES 
(100.0, 'fone de ouvido', '2018-04-05', TRUE),
(12.35, 'caderno de capa dura', '2018-02-10', TRUE),
(165.76, 'compras de super mercado', '2018-08-23', TRUE),
(201.40, 'batedeira', '2018-07-15', FALSE),
(90.0, 'livro de algoritimos', '2018-08-01', FALSE),
(1245.0, 'celular', '2018-05-17', TRUE),
(800.0, 'HD externo', '2018-03-02', TRUE),
(905.50, 'Caixa de som', '2018-05-02', TRUE),
(450.0, 'óculos de sol', '2018-08-27', FALSE),
(50.0, 'compras na farmácia', '2018-06-11', TRUE);
3) Faça uma alteração na tabela de modo que o campo recebido seja obrigatório.
4) Faça uma alteração na tabela incluindo o campo data_compra com tipo date.
5) Insira 10 linhas de registros (compras) na tabela Compras como segue abaixo.
6) Mostre todos os dados da tabela.
7) Mostre as informações de descricao e data_compra da tabela compras.
8) Mostre os dados da compra cujo valor da compra é maior do que R$ 500.00.
9) Mostre a descricao e a data das compras com valores menores do R$ 500.00.
10 )Mostre os dados das compras cujos códigos estejam entre 1 e 4.
11) Mostre os dados das compras realizadas antes das férias de julho.
12) Mostre os dados das compras realizadas entre os meses 03 e 06
13) Pode- se usar between para verificar um intervalo.
14)Vamos deletar uma das compras. Faça uma consulta a compra.
a. Consulte os produtos que não foram recebidos ainda.
b. Vamos deletar a batedeira, pois o produto não foi entregue.
15)Mostre a coluna do valor da compras e uma coluna com o valor cobrado pela
operadora de cartão de crédito.
16) Altere na consulta (select) o nome na apresentação dos campos valor,
data_compra e descricao para preco, data_da_compra, observacoes.
17)Mostre os dados da compra de celular.
18)Mostre as compras que comecem com a letra c.
19)Mostre as compras que tenham a palavra compras em sua descricao.
20)Insira mais uma coluna na tabela imposto com tipo numeric(4,3).
21)Atualize a coluna imposto com todos os valores de imposto, sendo que o imposto
será de 3% sobre o valor dos compras.
22)Selecione as compras com valores menores do que 100,00.
23)Altere a descrição das compras menores do que 100,00 para “gastos pequenos.“
24)Delete o registro óculos de sol. */

CREATE DATABASE Projeto_controle_compras;

/*1 e 2*/
CREATE TABLE compras (
    codigo SERIAL,
    valor NUMERIC(8,2),
    descricao VARCHAR(50),
    recebido BOOLEAN,
    
    CONSTRAINT codpk PRIMARY KEY (codigo)
);

/*3*/
ALTER TABLE compras ALTER COLUMN recebido SET NOT NULL;

/*4*/
ALTER TABLE compras ADD COLUMN data_compra DATE;

/*5*/
INSERT INTO compras (valor, descricao, data_compra, recebido) VALUES 
(100.0, 'fone de ouvido', '2018-04-05', TRUE),
(12.35, 'caderno de capa dura', '2018-02-10', TRUE),
(165.76, 'compras de super mercado', '2018-08-23', TRUE),
(201.40, 'batedeira', '2018-07-15', FALSE),
(90.0, 'livro de algoritimos', '2018-08-01', FALSE),
(1245.0, 'celular', '2018-05-17', TRUE),
(800.0, 'HD externo', '2018-03-02', TRUE),
(905.50, 'Caixa de som', '2018-05-02', TRUE),
(450.0, 'óculos de sol', '2018-08-27', FALSE),
(50.0, 'compras na farmácia', '2018-06-11', TRUE);

/*6*/
SELECT * FROM compras;

/*7*/
SELECT descricao, data_compra FROM compras;

/*8*/ 
SELECT * FROM compras WHERE valor > 500;

/*9*/
SELECT descricao, data_compra FROM compras WHERE valor < 500;

/*10*/
SELECT * FROM compras WHERE codigo BETWEEN 1 AND 4 ORDER BY codigo ASC;

/*11*/
SELECT * FROM compras WHERE MONTH(data_compra) < 7;
/* SELECT * FROM compras WHERE MONTH(data_compra) < '2018-07-01'; */

/*12 e 13*/
SELECT * FROM compras WHERE MONTH(data_compra) BETWEEN 3 and 6;
/* SELECT * FROM compras WHERE MONTH(data_compra) < '2018-03-01' 
AND '2018-06-30'; */

/*14*/
SELECT * FROM compras WHERE recebido = FALSE;
DELETE FROM compras WHERE descricao = 'batedeira';

/*15*/
SELECT valor, valor * 1.1 AS valor_cobrado_operadora FROM compras;
/* ALTER TABLE compras ADD COLUMN valor_credito NUMERIC(8,2);
INSERT INTO compras (valor_credito) 
VALUES (valor * 1.1) */

/*16*/
SELECT valor AS preco, data_compra AS data_da_compra, descricao AS observacoes FROM compras;
/* SELECT valor, data_compra, descricao AS preco, data_da_compra, observacoes FROM compras; */

/*17*/
SELECT * FROM compras WHERE descricao = 'celular';

/*18*/
SELECT * FROM compras WHERE descricao LIKE 'c%'; /* usa o % para completar e 
pesquisa uma parte do titulo*/

/*19*/
SELECT * FROM compras WHERE descricao LIKE '%compras%';

/*20*/
ALTER TABLE compras ADD COLUMN imposto NUMERIC(4,3);

/*21*/
UPDATE compras SET imposto = valor*0.03;
ALTER TABLE compras ALTER COLUMN imposto TYPE NUMERIC(8,3);
SELECT * FROM compras;

/*22*/
SELECT * FROM compras WHERE valor < 100; 

/*23*/
UPDATE compras SET descricao = 'gastos pequenos' WHERE valor < 100;

/*24*/
DELETE FROM Compras WHERE descricao = 'óculos de sol';

=---------------------------------------------------------------------------------------

RESPOSTA DA PROF

=---------------------------------------------------------------------------------------

/*1 - Criar a tabela*/
create table compras(
codigo serial,
valor numeric(8,2),
descricao varchar(50),
recebido boolean,
constraint cod_pk primary key(codigo)
);
/*3) Faça uma alteração na tabela de modo que o campo recebido seja
obrigatório. */
alter table compras alter column recebido set not null;
/*4) Faça uma alteração na tabela incluindo o campo data_compra com tipo
date.*/
alter table compras add column data_compra date;
/*5) Insira 10 linhas de registros (compras) na tabela Compras como segue
abaixo.*/
insert into compras(valor, descricao, data_compra, recebido)
values (100.0, 'fone de ouvido', '2018-04-05', true),
(12.35, 'caderno de capa duro', '2018-02-10', true),
(165.76, 'compras de supermercado', '2018-08-03', true),
(201.40, 'batedeira', '2018-07-15',false),
(90.0, 'livro de algoritmos', '2018-08-01', false),
(1245.0, 'celular', '2018-05-17', true),
(800.0, 'HD externa', '2018-03-02', true),
(905.50, 'caixa de som', '2018-05-02', true),
(450.0, 'óculos de sol', '2018-08-27', false),
(50.0, 'compras de farmácia', '2018-06-11', true);
/*6) Mostre todos os dados da tabela.*/
select * from compras;
/*7) Mostre as informações de descricao e data_compra da tabela compras.*/
select descricao, data_compra from compras;
/*8) Mostre os dados da compra cujo valor da compra é
maior do que R$ 500.00.*/
select * from compras where valor > 500;
/*9) Mostre a descricao e a data das compras com
valores menores do R$ 500.00.*/
select descricao, data_compra from compras where valor < 500;
/*10) Mostre os dados das compras cujos códigos estejam entre 1 e 4.*/
select * from compras where codigo >=1 and codigo <= 4;
/*11) Mostre os dados das compras realizadas antes das férias de julho.*/
select * from compras where data_compra < '2018-07-01';
/*12) Mostre os dados das compras realizadas entre os meses 03 e 06*/
select * from compras
 where data_compra >= '2018-03-01' and data_compra <='2018-06-30';
/*13) Pode- se usar between para verificar um intervalo.*/
select * from compras where data_compra between '2018-03-01' and '2018-06-
30';
/*14) Vamos deletar uma das compras. Faça uma consulta a compra.
a. Consulte os produtos que não foram recebidos ainda.
b. Vamos deletar a batedeira, pois o produto não foi entregue. */
select * from compras where recebido = false;
delete from compras where codigo = 4;
/*15) Mostre a coluna do valor da compras e uma coluna com o
valor cobrado pela operadora de cartão de crédito.*/
select valor, valor * 0.03 as taxa from compras;
/*16) Altere na consulta (select) o nome na apresentação dos campos valor,
data_compra e descricao para preco, data_da_compra, observacoes.*/
select valor as preco, data_compra as data_da_compra, descricao as observacoes
from compras;
/*17) Mostre os dados da compra de celular.*/
select * from compras where descricao = 'celular';
/*18) Mostre as compras que comecem com a letra c. */
select * from compras where descricao ilike 'c%';
/*19) Mostre as compras que tenham a palavra compras em sua descricao. */
select * from compras where descricao ilike '%compras%';
/*20) Insira mais uma coluna na tabela imposto com tipo numeric(4,3).*/
alter table compras add column imposto numeric(4,3);
/*21) Atualize a coluna imposto com todos os valores de imposto,
sendo que o imposto será de 3% sobre o valor dos compras. */
alter table compras alter column imposto type numeric(10,3);
update compras set imposto = valor * 0.03;
select * from compras;
/*22) Selecione as compras com valores menores do que 100,00. */
select * from compras where valor < 100;
/*23) Altere a descrição das compras menores do que 100,00
para “gastos pequenos.“*/
update compras set descricao = 'gastos pequenos' where valor < 100;
/*24) Delete o registro óculos de sol. */
delete from compras where descricao = 'óculos de sol';
select * from compras;



