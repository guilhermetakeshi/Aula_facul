create table vendas (
	codigo serial,
	nome varchar(50),
	datavenda date,
	valor numeric(10,2),
	bonus numeric(10,2),

	primary key (codigo)
);

insert into vendas (nome, datavenda, valor) values
('Guilherme', '2023-02-09', 5000),
('Guilherme', '2023-01-05', 4200),
('Guilherme', '2023-02-15', 3000),
('Guilherme', '2023-02-15', 1600),
('Guilherme', '2023-03-21', 2990),
('Tuco', '2023-03-21', 9700),
('Julia', '2023-01-09', 3012),
('Julia', '2023-01-09', 1970),
('Julia', '2023-01-25', 7510),
('Julia', '2023-02-23', 2010),
('Bruno', '2023-01-14', 900),
('Bruno', '2023-03-15', 8100),
('Bruno', '2023-01-16', 9000),
('Bruno', '2023-02-01', 920),
('Tuco', '2023-01-18', 400);

update vendas set bonus = valor * 0.03;
select * from vendas;

select sum(valor) as total_vendas from vendas;

select nome, sum(valor) as qtd_vendas from vendas group by nome;

select count(nome) as total_guilherme from vendas where nome = 'Guilherme';

select nome, count(nome) as numero_de_vendas from vendas group by nome;

select min(valor), max(valor) from vendas;

select nome, min(valor), max(valor) from vendas group by nome;

select round(avg(valor),2) from vendas;

select min(valor) from vendas
	where datavenda >= '2023-02-02' and datavenda <='2023-03-15';
	
select nome, min(valor) from vendas where datavenda < '2023-02-01' group by nome;

select nome, sum(valor) from vendas group by nome having sum(valor) > 5000;

select max(bonus) as bonus_maior from vendas;

select nome, sum(valor), sum(bonus) from vendas group by nome;

select nome, sum(valor), sum(bonus) from vendas group by nome having sum(bonus) > 500;

select sum(valor) as total_tuco from vendas where nome = 'Tuco';

alter table vendas 
	alter column nome set not null,
	alter column valor set not null,
	alter column bonus set not null,
	alter column datavenda set not null;

alter table vendas 
	alter column bonus drop not null;
	
update vendas set valor = 1000, bonus = 50 where nome = 'Tuco' and datavenda = '2023-01-18';

select * from vendas;