/*
Índices - select com query - view

chaves primarias são um exemplo de indices pq não tem itens repetidos.

- indices são estruturas que melhoram a performance do banco de dados.
- essas estruturas organizam as referencias de localização de dados nas tabelas.
- quando se cria um indice, este indice está relacionado a uma determinada coluna, portanto, este
índice não pode auxiliar no acesso de informações em outras colunas pq os indices são classificados de acordo
com a coluna correspondente.

view é como o private ou o public do java no "private static void" nas classes.
é um encapsulamento para que algumas colunas não sejam "visíveis.

se vc quiser atualizar a sua pseudotabela view, basta atualizar a tablea original que a atualização
vem automaticamente.

*/

create table pessoa (
	codigo serial,
	nome varchar(50) not null,
	numero integer,
	constraint pes_codigopk primary key (codigo)
);

-- isso faz um loop de criação de numeros aleatorios e insere eles na tabela pessoa automaticamente.
do $$
	declare
	begin
		for i in 1..10000000 loop
			insert into pessoa (nome, numero) values 
				('nome(a)' || i, random() * 10000 + i);
		end loop;
	end;
$$;
			
select * from pessoa;

select * from pessoa where numero between 1000 and 3000;

explain select * from pessoa where numero between 1000 and 3000;

create index numero_idx
	on pessoa(numero);

-- dps da criação do indice, o tempo de busca por valores diminui em 10x 

create table cliente(
	cpf numeric(11),
	nome varchar(50) not null,
	rua varchar(50),
	numero varchar(10),
	cidade varchar(50),
	tel varchar(15),
	email varchar(20),
	constraint pk_cliente primary key (cpf),
	constraint uk_email unique (email)
);

select * from funcionario;

create table cliente2(
	cpf numeric(11),
	nome varchar(50) not null,
	tel varchar(15),
	email varchar(20),
	constraint pk_cliente2 primary key (cpf),
	constraint uk_email2 unique (email)
);

insert into cliente values (123456789, 'Maria', 'Rua A', '10', 'Mogi', '1111-1111', 'maria@gmail.com');

insert into cliente values (186413132, 'Jose', 'Rua B', '100', 'Suzano', '2222-2222', 'jose@gmail.com');

select * from cliente2;

insert into cliente2 (select cpf, nome, tel, email from cliente);
-- isso eu to fazendo um insert com query, que é inserir dados que eu quero e q estão em outra tabela, eu faço 
-- o select pra ele saber o que e aonde ele tem q buscar os dados.

create sequence seqfunc;

create table funcionario(
	codigo integer primary key,
	nome varchar(50),
	dt_nascimento date,
	salario numeric(10,2),
	depto integer,
	constraint fk_depto foreign key (depto) references departamento (codigo)
);

create sequence seqdepto;
create table departamento(
	codigo integer primary key,
	nome varchar (50)
);

insert into departamento (codigo, nome) values
	(nextval('seqdepto'), 'rh'),
	(nextval('seqdepto'), 'vendas'),
	(nextval('seqdepto'), 'compras'),
	(nextval('seqdepto'), 'estoque');
	
insert into funcionario (codigo, nome, dt_nascimento, salario, depto) values
	(nextval('seqfunc'), 'Ana', '1996-01-01', 2000, (select codigo from departamento where nome = 'rh')),
	(nextval('seqfunc'), 'Caio', '1999-11-01', 10000, (select codigo from departamento where nome = 'vendas')),
	(nextval('seqfunc'), 'Valter', '1994-08-15', 5500, (select codigo from departamento where nome = 'compras')),
	(nextval('seqfunc'), 'Paulo', '1985-10-17', 3000, (select codigo from departamento where nome = 'estoque'));
	
-- views

create view view_funcionario as 
select departamento.nome as departamento,
	funcionario.nome as funcionario
	from departamento inner join funcionario 
	on departamento.codigo = funcionario.depto;
	
select departamento from view_funcionario;
