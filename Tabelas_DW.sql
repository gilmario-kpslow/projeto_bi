-- Database: BI_ERPDemo

-- DROP DATABASE "BI_ERPDemo";

CREATE DATABASE "BI_ERPDemo"
    WITH 
    OWNER = postgres
    TEMPLATE = template0
    ENCODING = 'LATIN1'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;


create table "BI_ERPDemo".public.dim_loja(
	dky_loja bigserial not null,
	cod_empresa varchar(2) not null,
	nome_empresa varchar(60),
	cod_loja varchar(5) not null,
	nome_loja varchar(30),
	cnpj_loja varchar(15),
	cep_loja varchar(8),
	bairro_loja varchar(50),
	cidade_loja varchar(50),
	estado_loja varchar(2),
	CONSTRAINT pk_dim_loja PRIMARY KEY (dky_loja)
);

create table "BI_ERPDemo".public.dim_tipo_pagamento(
	dky_tipo_pagamento bigserial not null,
	cod_tipo_pagamento varchar(5) not null,
	tipo_pagamento varchar(25),
	CONSTRAINT pk_dim_tipo_pagamento PRIMARY KEY (dky_tipo_pagamento)
);

create table "BI_ERPDemo".public.dim_forma_pagamento(
	dky_forma_pagamento bigserial not null,
	cod_forma_pagamento varchar(5) not null,
	forma_pagamento varchar(50),
	CONSTRAINT pk_dim_forma_pagamento PRIMARY KEY (dky_forma_pagamento)
);

create table "BI_ERPDemo".public.dim_fatura(
	dky_fatura bigserial not null,
	cod_fatura varchar(13) not null,
	cod_loja varchar(5) not null,
	num_nf varchar(15),
	cod_tipo_operacao varchar(15),
	tipo_operacao varchar(15),
	status_fatura varchar(15),
	bairro_entrega varchar(20), 
	cidade_entrega varchar(50),
	estado_entrega char(2),
	CONSTRAINT pk_dim_fatura PRIMARY KEY (dky_fatura)
);

create table "BI_ERPDemo".public.dim_produto(
	dky_produto bigserial not null,
	cod_produto varchar(10) not null,
	desc_produto varchar(100),
	cod_grupo_produto varchar(4),
	desc_grupo_produto varchar(60),
	marca_produto varchar(20),
	CONSTRAINT pk_dim_produto PRIMARY KEY (dky_produto)
);


create table "BI_ERPDemo".public.dim_pessoa(
	dky_pessoa bigserial not null,
	cod_pessoa varchar(10) not null,
	nome_pessoa varchar(50),
	cpf_pessoa varchar(20),
	cnpj_pessoa varchar(20),
	cep_pessoa varchar(8),
	bairro_pessoa varchar(20),
	cidade_pessoa varchar(60),
	estado_pessoa varchar(60),
	sexo_pessoa varchar(15),
	CONSTRAINT pk_dim_pessoa PRIMARY KEY (dky_pessoa)
);

create table "BI_ERPDemo".public.dim_tempo(
	dky_tempo bigserial not null,
	data date,
	dia char(2),
	mes char(2),
	ano char(4),
	semana int4,
	dia_semana varchar(20),
	semestre int4,
	trimestre int4,
	quadrimestre int4,
	nome_mes varchar(15),
	mes_ano char(6),
	CONSTRAINT pk_dim_tempo PRIMARY KEY (dky_tempo)
);

create table "BI_ERPDemo".public.fat_vendas(
	dky_fatura bigserial not null,
	dky_tempo int4 not null,
	dky_cliente int4 not null,
    dky_vendedor int4 not null,
	dky_produto int4 not null,
	dky_forma_pagamento int4 not null,
	dky_tipo_pagamento int4 not null,
	dky_loja int4 not null,
    valor_venda float8,
	valor_custo float8,
	valor_lucro float8,
	qtd_produto float8,
	CONSTRAINT pk_fat_vendas PRIMARY KEY (dky_fatura, dky_tempo, dky_cliente, dky_vendedor, dky_produto, dky_forma_pagamento, dky_tipo_pagamento),
	CONSTRAINT fk_dim_fatura FOREIGN KEY (dky_fatura) REFERENCES public.dim_fatura (dky_fatura) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION NOT VALID,
	CONSTRAINT fk_dim_loja FOREIGN KEY (dky_loja) REFERENCES public.dim_loja (dky_loja) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION NOT VALID,
	CONSTRAINT fk_dim_tempo FOREIGN KEY (dky_tempo) REFERENCES public.dim_tempo (dky_tempo) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION NOT VALID,
	CONSTRAINT fk_dim_vendendor FOREIGN KEY (dky_vendedor) REFERENCES public.dim_pessoa (dky_pessoa) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION NOT VALID,
	CONSTRAINT fk_dim_cliente FOREIGN KEY (dky_cliente) REFERENCES public.dim_pessoa (dky_pessoa) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION NOT VALID,
	CONSTRAINT fk_dim_produto FOREIGN KEY (dky_produto) REFERENCES public.dim_produto (dky_produto) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION NOT VALID,
	CONSTRAINT fk_dim_forma_pagamento FOREIGN KEY (dky_forma_pagamento) REFERENCES public.dim_forma_pagamento (dky_forma_pagamento) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION NOT VALID,
	CONSTRAINT fk_dim_tipo_pagamento FOREIGN KEY (dky_tipo_pagamento) REFERENCES public.dim_tipo_pagamento (dky_tipo_pagamento) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION NOT VALID
	
);



