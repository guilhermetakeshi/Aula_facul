create table medico (
	nome varchar (150) not null,
	crm numeric (15,2) not null,
	
	constraint pk_medico_crm Primary Key (crm)	
);

create table paciente (
	nome varchar (150) not null,
	codigo serial,
	
	constraint pk_paciente_cod Primary Key (codigo)	
);

create table especialidade (
	nome varchar (150) not null,
	codigo serial,
	
	constraint pk_espec_cod Primary Key (codigo)
);

create table exame (
	descricao varchar (150) not null,
	codigo serial,
	
	constraint pk_exame_cod Primary Key (codigo)
);

create table convenio (
	nome varchar (150) not null,
	codigo serial,
	
	constraint pk_conv_cod Primary Key (codigo)
);

create table atende (
	numero serial,
	data date not null,
	diagnostico varchar (200) not null,
	crm_medico NUMERIC(15,2) NOT NULL,
    codigo_paciente SERIAL NOT NULL,
	cod_convenio serial,
	cod_especi serial,
	
	constraint pk_atende_numero primary key (numero),
	constraint fk_atende_medico foreign key (crm_medico) references medico (crm),
    constraint fk_atende_paciente foreign key  (codigo_paciente) references paciente (codigo),
	constraint fk_atende_especi foreign key (cod_especi) references especialidade (codigo),
	constraint fk_atende_convenio foreign key (cod_convenio) references convenio (codigo)
	
);

create table contem (
	numero serial,
	numero_atende serial,
	cod_exame serial,

	constraint pk_contem_numero primary key (numero),
	constraint fk_contem_cod_exame foreign key (cod_exame) references exame (codigo),
	constraint fk_contem_num_atende foreign key (numero_atende) references atende (numero)
);

insert into medico (nome, crm) values 
('Dra Maria Cristina', 11111), ('Dr Eduardo', 22222), ('Dr José Antonio', 33333);

insert into especialidade (nome) values 
('Dermatologia'), ('Clinica Geral'), ('Oftalmologia');

insert into convenio (nome) values
('Amil'), ('Saúde Bradesco'), ('Unimed');

insert into exame (descricao) values 
('Ultrassom'), ('Fundo de olho'), ('Glicemia');