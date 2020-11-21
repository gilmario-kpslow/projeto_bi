INSERT INTO public.dim_fatura(
	dky_fatura, cod_fatura, num_nf, cod_tipo_operacao, tipo_operacao, status_fatura, bairro_entrega, cidade_entrega, estado_entrega)
	VALUES (-1, '-1', 'N/I', 'N/I', 'N/I', 'N/I', 'N/I', 'N/I', null);
	
	
INSERT INTO public.dim_forma_pagamento(
	dky_forma_pagamento, cod_forma_pagamento, forma_pagamento)
	VALUES ('-1', '-1', 'N/I');


INSERT INTO public.dim_loja(
	dky_loja, cod_empresa, nome_empresa, cod_loja, nome_loja, cnpj_loja, cep_loja, bairro_loja, cidade_loja, estado_loja)
	VALUES (-1, '-1', 'N/I', '-1', 'N/I', 'N/I', 'N/I', 'N/I', 'N/I', null);
	
	
INSERT INTO public.dim_pessoa(
	dky_pessoa, cod_pessoa, nome_pessoa, cpf_pessoa, cnpj_pessoa, cep_pessoa, bairro_pessoa, cidade_pessoa, estado_pessoa, sexo_pessoa)
	VALUES (-1, '-1', 'N/I', 'N/I', 'N/I', 'N/I', 'N/I', 'N/I', 'N/I', 'N/I');
	
	
INSERT INTO public.dim_produto(
	dky_produto, cod_produto, desc_produto, cod_grupo_produto, desc_grupo_produto, marca_produto)
	VALUES (-1, '-1', 'N/I', '-1', 'N/I', 'N/I');
	
INSERT INTO public.dim_tipo_pagamento(
	dky_tipo_pagamento, cod_tipo_pagamento, tipo_pagamento)
	VALUES (-1, '-1', 'N/I');