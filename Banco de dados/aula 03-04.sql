/*

Modelo Relacional - MR

- é um modelo de dados representativo (ou de implementação), adequado a ser o modelo 
subjacente de um Sistema Gerenciador de Banco de Dados (SGBD), que se baseia no princípio 
de que todos os dados estão armazenados em tabelas (ou, matematicamente falando, relações).

São tabelas organizadas por linhas e colunas.

São modelados sob a forma de entidades e relacionamentos e depois mapeados para tabelas,
dessa maneira, cada tabela estara em um nivel de qualidade elevada, sem info repetidas, com facilidade
para alterar inserir e retirar dados(aplicadas as formas normais)

Quando se usa um gerenciador de BD relacional para implementar as relações, o MER deve ser mapeado 
para o Modelo Relacional, ou seja, para tabelas.

Chave primaria 
- Pode ser constituída de um campo (chave simples) ou pela combinação de dois ou mais campos 
(chave composta), de tal maneira que não existam dois registros com o mesmo valor de chave primária.

A constraint Primary Key (chave primaria), não permite valores nulos e impõe a exclusividade de linhas.

Chave candidata - dados que podem ser chaves primarias

Chave estrangeira (foreign key) é o campo que estabelece o relacionamento entre duas tabelas. Assim, uma 
coluna corresponde à mesma coluna que é a chave primária de outra tabela.

Cardinalidade
- A cardinalidade é um número que expressa o comportamento (número de ocorrências) de determinada 
entidade associada a uma ocorrência da entidade em questão através do relacionamento.

- Relacionamento 1..1 (um para um): cada uma das duas entidades envolvidas 
        referenciam obrigatoriamente apenas uma unidade da outra. 
        
- Relacionamento 1..n ou 1..* (um para muitos): uma das entidades envolvidas pode 
referenciar várias unidades da outra, porém, do outro lado cada uma das várias unidades 
referenciadas só pode estar ligada uma unidade da outra entidade.
        
- Relacionamento n..n ou *..* (muitos para muitos): neste tipo de relacionamento cada 
entidade, de ambos os lados, podem referenciar múltiplas unidades da outra.
    \-> Neste relacionamento, o relacionamento das tabelas, obrigatoriamente vai ser uma tabela.

Cardinalidade: (só existe MAXIMA e MINIMA)

Minimo: 0 - Opcional
	1 - Minimo

Maximo: N - Inumeros

--------------------------

Cardinalidade 1:1

(1,1)		       (1,1)
pessoa -- usa -- computador

UMA pessoa USA apenas UM computador
UM computador só pode ser USADO por UMA pessoa

em ambos os casos, não pode haver mais que UM.

---------------------------

(1,1)		        (0,1)
pessoa -- usa -- computador

UMA pessoa USA apenas UM computador
UM computador só pode ser USADO por UMA ou NENHUMA pessoa

---------------------------

(0,1)		        (0,1)
pessoa -- usa -- computador

1 Pessoa USA no minimo 0 e no maximo 1 computador
1 computador é USADO por no minimo 0 e no maximo 1 pessoa

(ou seja, o 0 seria : uma pessoa NAO ESTA USANDO o computador, ou
um computador NAO ESTA SENDO USADO por uma pessoa)

---------------------------

Cardinalidade 1:N

(1,N)	
	 
pessoa -- usa -- computador

1 pessoa USA quantos computadores ela quiser.
1 computador pode ser usado por somente 1 pessoa.

---------------------------

Cardinalidade N:N

(0,N)		         (0,N)
Aluno -- <CURSA> -- Disciplina

a Disciplina pode ter 0 ou N alunos
o Aluno pode cursar 0 Disciplinas ou muitas (N)

Neste relacionamento, o relacionamento das tabelas, obrigatoriamente vai ser uma tabela.

*/

/*
EXEMPLO 1:1

create table pessoa (
    cpf varchar(11),
    nome varchar(50),
    primary key (cpf)
);

create table computador(
    codigo integer primary key,
    modelo varchar(30),
    cpffk varchar (11) not null,
    foreign key (cpffk) references pessoa(cpf)
);

insert into pessoa (cpf, nome) values
('1111', 'nome111'),
('2222', 'nome222');

insert into computador (codigo, modelo, cpffk) values
(11, 'apple', '1111'),
(22, 'samsung', '2222');

select * from computador;
 
*/

/*
EXEMPLO N:N

create table Aluno (
    nome varchar(50),
    rgm varchar(11),
    primary key (rgm)
);

create table disciplina (
    codigo integer primary key,
    nome varchar(50) not null,
    num_credito integer not null,
);

create table cursa (
    codigo integer,
    id_aluno varchar(5),
    id_disciplina integer,
    
    primary key (codigo),
    foreign key (id_aluno) references aluno(rgm),
    foreign key (id_disciplina) references disciplina(codigo)
);

*/





