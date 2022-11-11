SELECT * FROM ABASTECIMENTOS, veiculos WHERE abastecimentos.idVEICULO = veiculos.idVEICULO and PLACA = "AAIIII" ORDER BY DATA;

SELECT NOME, Data, DESCRICAO 
	FROM MOTORISTAS, OCORRENCIAS 
    WHERE MOTORISTAS.IDMOTORISTA = OCORRENCIAS.IDMOTORISTA 
    ORDER BY NOME;

SELECT nome, DATA, DESCRICAO 
	FROM MOTORISTAS, OCORRENCIAS 
    WHERE MOTORISTAS.IDMOTORISTA = OCORRENCIAS.IDMOTORISTA 
    AND nome = "SERRA" ORDER BY DATA; 

SELECT PLACA, SUM(LITROS_ABASTECIDOS) AS TOTALLITROS, SUM(VALOR_PAGO) AS TOTALVALOR 
	FROM ABASTECIMENTOS, VEICULOS
    WHERE ABASTECIMENTOS.IDVEICULO = VEICULOS.IDVEICULO 
    AND (TIPO_COMBUSTIVEL = 1) GROUP BY PLACA HAVING TOTALVALOR > 10000; 

SELECT FABRICANTE, MODELO, AVG(VALOR_PAGO) AS MEDIA_ABASTECIMENTOS 
	FROM VEICULOS AS V, ABASTECIMENTOS AS A 
    WHERE (V.IDVEICULO = A.IDVEICULO)
	AND (MODELO = "TORO") GROUP BY FABRICANTE, MODELO;

CREATE VIEW V1 AS (
	SELECT NOME, COUNT(IDABASTECIMENTO) AS QTDABASTECIMENTO, AVG(VALOR_PAGO) AS MEDIAVALOR 
		FROM MOTORISTAS AS M, ABASTECIMENTOS AS A 
        WHERE (M.IDMOTORISTA = A.IDMOTORISTA) GROUP BY NOME
);

CREATE VIEW V2 AS (
	SELECT NOME, COUNT(IDOCORRENCIA) AS NUM_OCORRENCIAS 
		FROM MOTORISTAS AS M, OCORRENCIAS AS O 
        WHERE (M.IDMOTORISTA = O.IDMOTORISTA) GROUP BY NOME
);

SELECT NOME, QTDABASTECIMENTO, NUM_OCORRENCIAS
	FROM V1, V2 WHERE V1.NOME = V2.NOME ORDER BY NOME;


/*HAVING É TIPO O WHERE DO GROUP BY*
/*HAVING SE USA QUANDO NÃO SE TEM O VALOR NA TABELA, JÁ O WHERE QUANDO SE TEM O VALOR NA TABELA*