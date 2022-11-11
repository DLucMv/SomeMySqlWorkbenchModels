/* A */
SELECT contas_a_pagar.parcelas.DATA_VENCIMENTO, SUM(contas_a_pagar.parcelas.VALOR) AS TOTAL_FATURA
	FROM contas_a_pagar.PARCELAS 
    GROUP BY contas_a_pagar.parcelas.DATA_VENCIMENTO 
    ORDER BY contas_a_pagar.parcelas.DATA_VENCIMENTO;
    
/* B */ 
SELECT COMPRAS.DATA, SUM(PARCELAS.VALOR) FROM contas_a_pagar.compras, contas_a_pagar.parcelas
	WHERE contas_a_pagar.compras.idCOMPRA = contas_a_pagar.parcelas.idCOMPRA
    GROUP BY contas_a_pagar.compras.DATA;
    
/* C */
SELECT CREDORES.CREDOR, SUM(PARCELAS.VALOR) 
	FROM contas_a_pagar.compras, contas_a_pagar.parcelas, contas_a_pagar.credores
	WHERE contas_a_pagar.compras.idCOMPRA = contas_a_pagar.parcelas.idCOMPRA
    AND contas_a_pagar.CREDORES.idCREDORE = contas_a_pagar.compras.idCREDORE
    GROUP BY contas_a_pagar.credores.CREDOR;
    
/* D */
select DATA_PAGAMENTO, SUM(VALOR) AS TOTA
	from contas_a_pagar.parcelas, contas_a_pagar.pagamentos 
	where contas_a_pagar.parcelas.idCOMPRA = contas_a_pagar.pagamentos.idCOMPRA
    AND contas_a_pagar.parcelas.idPARCELA = contas_a_pagar.pagamentos.idPARCELA
    GROUP BY contas_a_pagar.pagamentos.DATA_PAGAMENTO;
    
/* E */
SELECT CREDORES.CREDOR, SUM(PARCELAS.VALOR) AS TOTAL_DEBITO
	FROM contas_a_pagar.compras, contas_a_pagar.parcelas, 
			contas_a_pagar.credores
	WHERE contas_a_pagar.compras.idCOMPRA = contas_a_pagar.parcelas.idCOMPRA
    AND contas_a_pagar.CREDORES.idCREDORE = contas_a_pagar.compras.idCREDORE
    AND contas_a_pagar.compras.idCOMPRA = contas_a_pagar.parcelas.idCOMPRA
    AND contas_a_pagar.PARCELAS.DATA_VENCIMENTO > "2022-10-15"
    GROUP BY contas_a_pagar.credores.CREDOR;
    
/* F */
SELECT CREDORES.CREDOR, COUNT(compras.idCOMPRA) AS QTD_COMPRAS
	FROM contas_a_pagar.compras, contas_a_pagar.credores
    WHERE contas_a_pagar.CREDORES.idCREDORE = contas_a_pagar.compras.idCREDORE
    GROUP BY contas_a_pagar.credores.CREDOR;
    
/* G */
SELECT CREDORES.CREDOR, AVG(parcelas.VALOR) AS VALOR_MEDIO_COMPRAS
	FROM contas_a_pagar.compras, contas_a_pagar.credores, contas_a_pagar.parcelas
    WHERE contas_a_pagar.CREDORES.idCREDORE = contas_a_pagar.compras.idCREDORE
    AND contas_a_pagar.compras.idCOMPRA = contas_a_pagar.parcelas.idCOMPRA
    GROUP BY contas_a_pagar.credores.CREDOR;

/* H */
SELECT compras.idCOMPRA, COMPRAS.DATA, COUNT(idPARCELA) AS QTD_PARCELAS
	FROM contas_a_pagar.compras, contas_a_pagar.parcelas
    WHERE contas_a_pagar.compras.idCOMPRA = contas_a_pagar.parcelas.idCOMPRA
    GROUP BY contas_a_pagar.compras.idCOMPRA;

/* I */
CREATE VIEW V1 AS (
	SELECT credores.idCREDORE, SUM(parcelas.VALOR) AS TOTAL_COMPRA
	FROM contas_a_pagar.compras, contas_a_pagar.credores, contas_a_pagar.parcelas
    WHERE contas_a_pagar.CREDORES.idCREDORE = contas_a_pagar.compras.idCREDORE
    AND contas_a_pagar.compras.idCOMPRA = contas_a_pagar.parcelas.idCOMPRA
    GROUP BY contas_a_pagar.compras.idCOMPRA);
    
select * FROM V1;

SELECT credores.CREDOR, MAX(V1.TOTAL_COMPRA) from V1, contas_a_pagar.credores 
    ORDER BY contas_a_pagar.CREDORES.CREDOR;
    
/* J */
CREATE VIEW V2 AS (
	SELECT COMPRAS.idCOMPRA, COUNT(parcelas.idPARCELA) AS TOTAL_PARCELAS
	FROM contas_a_pagar.compras, contas_a_pagar.credores, contas_a_pagar.parcelas
    WHERE contas_a_pagar.CREDORES.idCREDORE = contas_a_pagar.compras.idCREDORE
    AND contas_a_pagar.compras.idCOMPRA = contas_a_pagar.parcelas.idCOMPRA
    GROUP BY contas_a_pagar.compras.idCOMPRA ORDER BY contas_a_pagar.compras.idCOMPRA);

SELECT * FROM V2 WHERE TOTAL_PARCELAS > 3;

/* K */
CREATE VIEW V3 AS (
	SELECT COMPRAS.idCOMPRA, credores.CREDOR, compras.DATA, SUM(parcelas.VALOR) AS TOTAL_DA_COMPRA
	FROM contas_a_pagar.compras, contas_a_pagar.credores, contas_a_pagar.parcelas
    WHERE contas_a_pagar.CREDORES.idCREDORE = contas_a_pagar.compras.idCREDORE
    AND contas_a_pagar.compras.idCOMPRA = contas_a_pagar.parcelas.idCOMPRA
    GROUP BY contas_a_pagar.compras.idCOMPRA ORDER BY contas_a_pagar.compras.DATA);

SELECT * FROM V3 WHERE TOTAL_DA_COMPRA > 600;

/* L */
CREATE VIEW V4 AS (
	SELECT COMPRAS.idCOMPRA, credores.CREDOR, compras.DATA, SUM(parcelas.VALOR) AS TOTAL_DA_COMPRA
	FROM contas_a_pagar.compras, contas_a_pagar.credores, contas_a_pagar.parcelas
    WHERE contas_a_pagar.CREDORES.idCREDORE = contas_a_pagar.compras.idCREDORE
    AND contas_a_pagar.compras.idCOMPRA = contas_a_pagar.parcelas.idCOMPRA
    AND compras.DATA < "2022-10-01"
    GROUP BY contas_a_pagar.compras.idCOMPRA ORDER BY contas_a_pagar.compras.DATA);

CREATE VIEW V5 AS (
	SELECT V4.CREDOR, V4.DATA, AVG(TOTAL_DA_COMPRA) AS VALOR_MEDIO_DE_COMPRAS_POR_CREDOR
	FROM V4 GROUP BY CREDOR);

SELECT * FROM V5;

