create table Cargo (
	codigo numeric(5),
	nome varchar(100) not null,
	salario_base numeric(10,2) not null,
	Constraint pk_cargo_cod Primary Key (codigo)
);
	
create table Cidade (
	codigo numeric(5),
	nome varchar(100) not null,
	Constraint pk_cidade_cod Primary Key (codigo)
);

create table Departamento (
	codigo numeric(5),
	nome varchar(100) not null,
	Constraint pk_depto_cod Primary Key (codigo)
);

create table Funcionario(
	codigo numeric(5),
	nome varchar(100) not null,
	telefone varchar(50) null,
	salario numeric(10,2) not null,
	cod_cargo numeric(5) not null,
	cod_cidade numeric(5) not null,
	cod_depto numeric(5) not null,
	gerente numeric(5),
	
	Constraint pk_func_cod Primary Key (codigo),
	Constraint fk_func_cargo
	Foreign Key (cod_cargo) References Cargo (codigo),
	Constraint fk_func_cidade
	Foreign Key(cod_cidade) References Cidade (codigo),
	Constraint fk_func_depto
	Foreign Key (cod_depto) References Departamento (codigo),
	Constraint fk_func_gerente
	Foreign Key (gerente) References Funcionario (codigo)
);

insert into cargo(codigo, nome, salario_base)
values(1, 'estagiário', 800.00);
insert into cargo(codigo, nome, salario_base)
values(2, 'gerente', 2000.00);
insert into cargo(codigo, nome, salario_base)
values(3, 'supervisor', 1800.00);
insert into cargo(codigo, nome, salario_base)
values(4, 'encarregado', 1500.00);
insert into cargo(codigo, nome, salario_base)
values(5, 'auxiliar', 1000.00);

insert into cidade (codigo, nome) values(1, 'Mogi das Cruzes');
insert into cidade (codigo, nome) values(2, 'São Paulo');
insert into cidade (codigo, nome) values(3, 'Campinas');
insert into cidade (codigo, nome) values(4, 'São José dos Campos');

insert into departamento values(1, 'vendas');
insert into departamento values(2, 'compras');
insert into departamento values(3, 'PCP');
insert into departamento values(4, 'produção');

insert into funcionario values
(1, 'Antonio Leite', '99989 0999', 10000.00, 2, 3, 2, null),
(2, 'Lucas Silva', '98778 7878', 7000.00, 2, 1, 1, 1),
(3, 'Bruna Santos', '99899 9987', 2000.80, 3, 3, 4, 2),
(4, 'Camila Rocha', '99871 5454', 4000.00, 4, 2, 1, 1),
(5, 'Dayna Santos', '99765 2211', 600.00, 1, 4, 3, 1),
(6, 'Emerson Santos', '99995 4433', 6000.00, 2, 3, 4, 2);

update funcionario SET salario = 6000.98 where codigo = 6;

/*1*/
select nome, salario from funcionario where salario > 6000 and salario < 8000 order by salario asc;

/*2*/
select f.nome, c.nome 
	from funcionario as f, cargo as c
	where f.cod_cargo = c.codigo order by f.nome asc;

/*3*/
select d.nome, f.nome
	from departamento as d, funcionario as f
	where d.codigo = f.cod_depto order by d.nome, f.nome asc;

/*4*/
select f.nome, f.salario 
	from funcionario as f, departamento as d
	where f.cod_depto = d.codigo and d.nome = 'compras';

/*5*/
select f.nome, c.nome
	from funcionario as f, cidade as c
	where f.cod_cidade = c.codigo and c.nome LIKE 'São%';

/*6*/
select f.nome, f.salario, c.nome
	from funcionario as f, cargo as c, cidade as cid
	where f.cod_cargo = c.codigo and f.cod_cidade = cid.codigo and cid.nome = 'Campinas' 
	order by f.salario desc;
	
/*7*/
select f.nome, cid.nome, d.nome 
	from funcionario as f, cargo as c, cidade as cid, departamento as d
	where f.cod_cidade = cid.codigo and f.cod_depto = d.codigo and f.cod_cargo = c.codigo
	and c.nome = 'estagiário';

/*8*/
select nome
	from funcionario
	where gerente = (select codigo from funcionario where nome = 'Antonio Leite')
	order by nome;