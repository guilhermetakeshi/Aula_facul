/* Famoso FOR*/

create sequence seqteste
	minvalue 1
	maxvalue 50
	start with 1
	increment by 1;
	
/* rodando o proximo valor*/	
select nextval('seqteste');

/* exibindo o valor atual */
select currval('seqteste');

/* settando o valor para :  */
select setval('seqteste', 5);

create table pessoa(
	codigo serial,
	nome varchar(50)
);


insert into pessoa (nome) values('a');
insert into pessoa (nome) values
	('b'),('c'),('d'),('e'),('f'),
	('g'),('h'),('i');
insert into pessoa (nome) values('l');

select * from pessoa;

create sequence sequ1;
select nextval('sequ1');

create sequence sequ2
	start with 15
	minvalue 10
	maxvalue 50
	increment by 5;

select nextval('sequ2');

create sequence sequ3
	start with 15
	minvalue 10
	maxvalue 50
	increment by 5
	cycle;
	
create sequence sequ4
	increment -1;
	
select nextval('sequ4');
	
	
alter sequence sequ4
	increment by -10
	cycle;
	
drop sequence sequ4;

create sequence sequ5;

create table aluno (
	codigo integer default nextval('sequ5'),
	nome varchar(20)
);

insert into aluno(nome) values
	('a4'),('a5'),('a6');

select * from aluno;

alter sequence sequ5 
	increment by 5;

select currval('sequ5');

create table funcionario (
	codigo integer,
	nome varchar(20)
)

create sequence sequ6
	minvalue 100
	maxvalue 500
	increment by 5;

insert into funcionario(codigo, nome) values( nextval('sequ6'), 'Ana');

select * from funcionario;