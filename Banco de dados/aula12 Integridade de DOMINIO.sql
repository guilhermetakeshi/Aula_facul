/*--- Integridade de DOMINIO - CLÁUSULA CHECK (parecido com o not null) ---

O valor de uma coluna deve obedecer a definilçao de valores admitidos para ela.

É a forma mais elementas de restrição de Integridade.

Este é o tipo de restrição testa valores inseridos no banco e testam também as consultas 
para que as comparações fazem sentido.

Fatores:
- Tipo de dados
- represendação do dado 
- o dado pode ou não estar presente no campo 
- intervalo de valores 
- conjunto de valores discretos
*/

create table passagem(
	num 	integer,
	valor	numeric(5,2) not null check(valor>100.00 and valor <200.0),
	poltrona integer not null,
	data_compra	timestamp	default current_timestamp,
	tipo_cartao	integer,
	num_cartao	varchar(30) not null,
	cod_cli		integer		not null,
	num_voo		integer		not null,
	constraint pkpassagem	primary key(num)
);

insert into passagem (num, valor, poltrona, tipo_cartao, num_cartao, cod_cli, num_voo)
values(3, 150, 33, 1, '121', 3, 4);

create table piloto(
	num_inscricao	integer,
	nome		varchar(40) not null unique,
	data_adm	date	    not null,
	num_voo		integer     not null,
        constraint pk_piloto primary key(num_inscricao),
        unique(nome, data_adm)
);

insert into piloto(num_inscricao, nome, data_adm, num_voo)
values(1, 'Daniel', '2021-01-01', 1);


insert into piloto(num_inscricao, nome, data_adm, num_voo)
values(2, 'Daniel', '2021-01-01', 1);

insert into piloto(num_inscricao, nome, data_adm, num_voo)
values(3, 'Carlos', '2021-01-01', 3);


insert into piloto(num_inscricao, nome, data_adm, num_voo)
values(4, 'Carlos', '2021-01-01', 3);

create table passagem(
	num 	integer,
	valor	numeric(5,2) not null check(valor>100.00 and valor <200.0),
	poltrona integer not null,
	data_compra	timestamp	default current_timestamp,
	tipo_cartao	integer,
	num_cartao	varchar(30) not null,
	cod_cli		integer		not null,
	num_voo		integer		not null,
	constraint pkpassagem	primary key(num)
	constraint compra check(tipo_cartao = 1 and valor > '150.0')
);