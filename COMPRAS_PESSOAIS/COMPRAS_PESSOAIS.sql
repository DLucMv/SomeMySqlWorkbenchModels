SELECT * FROM credores;
SELECT idCREDORES,CREDOR FROM compras_pessoais.credores order by CREDOR;
select CREDOR,QUANTIDADE_PARCELAS,DATA_COMPRA 
	from compras_pessoais.compras,compras_pessoais.credores
		order by CREDOR, DATA_COMPRA;