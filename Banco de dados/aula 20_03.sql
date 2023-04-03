/* 

funções programadas:

essas funções processam um conj. de valores ar,azemados 
em uma unica coluna na tabela e retorna um valor como resultado

NOME_DA_FUNCAO(COLUNA)

no comando select é possivel usar uma ou mais funcoes 

count() - retorna a quantidade de registros existem na tabela
sum() - soma todos os valores da coluna
max() - retorna o maior valor da coluna
min() - retorna o menor valor da coluna
avg() - retorna a media dos valores da coluna

*/

create table produtos (
	
	codigo serial,
	nome varchar(50) not null,
	valor numeric (10,2) not null,
	quantidade numeric (10,2) not null,
	
	primary key(codigo)

);

insert into produtos (nome, valor, quantidade) values
('borracha', 4.5, 2),
('caneta', 7.9, 3),
('caderno', 12.3, 4),
('sufite', 24, 2),
('cola', 8.75, 1),
('régua', 6.0, 1);

select * from produtos;

select count(*) from produtos;
select count(nome) from produtos;

alter table produtos alter column quantidade drop not null;

insert into produtos (nome, valor) values
('lápis', 4.5);

select count(quantidade) from produtos;

select sum(quantidade) from produtos;
select sum(valor) from produtos;

select max(valor) from produtos;
select min(valor) from produtos;

select round(avg(valor),2) from produtos;

---------------------------------------------------------------------------

create table funcionarios(
	
	id_func serial,
	nome varchar(50),
	cargo varchar(50),
	salario numeric(15,2),
	dt_inicio date,
	primary key (id_func)
);

insert into funcionarios(nome, cargo, salario, dt_inicio) values
('Ana', 'vendedor', 1200, '2022-01-02'),
('Bruna', 'vendedor', 1500, '2022-04-12'),
('Claudia', 'caixa', 3200, '2022-02-10'),
('Fernanda', 'vendedor', 2000, '2022-01-07'),
('Carlos', 'vendedor', 1200, '2022-01-03'),
('Mateus', 'gerente',4500,'2021-09-10'),
('Daniel', 'vendedor', 1200, '2022-03-14'),
('julia', 'estoquista', 1350, '2022-05-20'),
('Maria', 'vendedor', 1300, '2022-02-02'),
('Caio', 'estoquista', 1300,'2022-09-09'),
('Luís', 'limpeza', 1100, '2022-01-24');

select * from funcionarios;

select sum(salario) as total_da_folha from funcionarios;

select sum(salario) as total_salario_vendedor from funcionarios where cargo = 'vendedor';

select cargo, salario from funcionarios order by cargo asc;

select cargo, sum(salario) from funcionarios group by cargo order by sum desc;

select cargo, count(*) from funcionarios group by cargo;

select cargo, count(*) from funcionarios group by cargo having count(*) > 1;
/*
o group by faz com q faça a somatoria de salarios por grupos (por cargo nesse caso)

 o having complementa o group by e qunado vc tem um group by e quer 
 usar uma condição pra testar esses valores, vc usa o having

*/





