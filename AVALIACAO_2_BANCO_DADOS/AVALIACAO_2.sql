/* A */
SELECT * FROM avaliacao2.cartoes, avaliacao2.bandeiras 
	WHERE avaliacao2.cartoes.idBANDEIRA = avaliacao2.bandeiras.idBANDEIRA 
	ORDER BY avaliacao2.bandeiras.BANDEIRA; 

/* B */
SELECT * FROM avaliacao2.cartoes, avaliacao2.bandeiras 
	WHERE avaliacao2.cartoes.idBANDEIRA = avaliacao2.bandeiras.idBANDEIRA 
	AND avaliacao2.bandeiras.BANDEIRA = "VISA";

/* C */
SELECT compras.DATA, compras.VENDEDOR, compras.PARCELAS, cartoes.idNUMERO, PARCELAS.VALOR  
	FROM avaliacao2.bandeiras, avaliacao2.CARTOES, avaliacao2.compras, avaliacao2.parcelas
	WHERE avaliacao2.cartoes.idBANDEIRA = avaliacao2.bandeiras.idBANDEIRA 
	AND avaliacao2.compras.idNUMERO = avaliacao2.cartoes.idNUMERO
    AND avaliacao2.parcelas.COMPRAS_idCOMPRA = avaliacao2.compras.idCOMPRA
    AND avaliacao2.compras.idCOMPRA = 1;
    
/* D */
SELECT compras.DATA, compras.VENDEDOR, compras.PARCELAS, PARCELAS.VALOR  
	FROM avaliacao2.bandeiras, avaliacao2.CARTOES, avaliacao2.compras, avaliacao2.parcelas
	WHERE avaliacao2.cartoes.idBANDEIRA = avaliacao2.bandeiras.idBANDEIRA 
	AND avaliacao2.compras.idNUMERO = avaliacao2.cartoes.idNUMERO
    AND avaliacao2.parcelas.COMPRAS_idCOMPRA = avaliacao2.compras.idCOMPRA
    AND avaliacao2.cartoes.idNUMERO = "9530";
    
/* E */
SELECT cartoes.idNUMERO, cartoes.TITULAR,  bandeiras.BANDEIRA,  SUM(PARCELAS.VALOR) AS TOTAL_FATURA  
	FROM avaliacao2.bandeiras, avaliacao2.CARTOES, avaliacao2.compras, avaliacao2.parcelas
	WHERE avaliacao2.cartoes.idBANDEIRA = avaliacao2.bandeiras.idBANDEIRA 
	AND avaliacao2.compras.idNUMERO = avaliacao2.cartoes.idNUMERO
    AND avaliacao2.parcelas.COMPRAS_idCOMPRA = avaliacao2.compras.idCOMPRA
    GROUP BY avaliacao2.cartoes.idNUMERO ORDER BY avaliacao2.cartoes.idNUMERO;
    
/* F */
SELECT bandeiras.BANDEIRA, cartoes.TITULAR, cartoes.idNUMERO, SUM(PARCELAS.VALOR) AS TOTAL_FATURA  
	FROM avaliacao2.bandeiras, avaliacao2.CARTOES, avaliacao2.compras, avaliacao2.parcelas
	WHERE avaliacao2.cartoes.idBANDEIRA = avaliacao2.bandeiras.idBANDEIRA 
	AND avaliacao2.compras.idNUMERO = avaliacao2.cartoes.idNUMERO
    AND avaliacao2.parcelas.COMPRAS_idCOMPRA = avaliacao2.compras.idCOMPRA
    GROUP BY avaliacao2.bandeiras.BANDEIRA ORDER BY avaliacao2.bandeiras.BANDEIRA;
    
/* G */
SELECT cartoes.idNUMERO, cartoes.TITULAR,  bandeiras.BANDEIRA,  AVG(PARCELAS.VALOR) AS MEDIA_COMPRAS  
	FROM avaliacao2.bandeiras, avaliacao2.CARTOES, avaliacao2.compras, avaliacao2.parcelas
	WHERE avaliacao2.cartoes.idBANDEIRA = avaliacao2.bandeiras.idBANDEIRA 
	AND avaliacao2.compras.idNUMERO = avaliacao2.cartoes.idNUMERO
    AND avaliacao2.parcelas.COMPRAS_idCOMPRA = avaliacao2.compras.idCOMPRA
    GROUP BY avaliacao2.cartoes.idNUMERO ORDER BY MEDIA_COMPRAS;
    
/* H */
SELECT cartoes.TITULAR,  bandeiras.BANDEIRA, COUNT(compras.idCOMPRA) AS QTD_COMPRA
	FROM avaliacao2.bandeiras, avaliacao2.CARTOES, avaliacao2.compras, avaliacao2.parcelas
	WHERE avaliacao2.cartoes.idBANDEIRA = avaliacao2.bandeiras.idBANDEIRA 
	AND avaliacao2.compras.idNUMERO = avaliacao2.cartoes.idNUMERO
    AND avaliacao2.parcelas.COMPRAS_idCOMPRA = avaliacao2.compras.idCOMPRA
    AND avaliacao2.cartoes.idNUMERO = "9530";    
    
/* I */
CREATE VIEW V1 AS
	SELECT avaliacao2.bandeiras.BANDEIRA, avaliacao2.cartoes.TITULAR, avaliacao2.cartoes.idNUMERO, SUM(avaliacao2.PARCELAS.VALOR) AS TOTAL_FATURA  
	FROM avaliacao2.bandeiras, avaliacao2.CARTOES, avaliacao2.compras, avaliacao2.parcelas
	WHERE avaliacao2.cartoes.idBANDEIRA = avaliacao2.bandeiras.idBANDEIRA 
	AND avaliacao2.compras.idNUMERO = avaliacao2.cartoes.idNUMERO
    AND avaliacao2.parcelas.COMPRAS_idCOMPRA = avaliacao2.compras.idCOMPRA
    GROUP BY avaliacao2.bandeiras.BANDEIRA ORDER BY avaliacao2.bandeiras.BANDEIRA;
    
SELECT * FROM V1 WHERE TOTAL_FATURA > 30000;

/* J */
CREATE view V2 AS
	SELECT cartoes.idNUMERO, cartoes.TITULAR,  bandeiras.BANDEIRA,  AVG(PARCELAS.VALOR) AS MEDIA_COMPRAS  
	FROM avaliacao2.bandeiras, avaliacao2.CARTOES, avaliacao2.compras, avaliacao2.parcelas
	WHERE avaliacao2.cartoes.idBANDEIRA = avaliacao2.bandeiras.idBANDEIRA 
	AND avaliacao2.compras.idNUMERO = avaliacao2.cartoes.idNUMERO
    AND avaliacao2.parcelas.COMPRAS_idCOMPRA = avaliacao2.compras.idCOMPRA
    AND avaliacao2.compras.DIA_VENCIMENTO < "2022-10-31"
    GROUP BY avaliacao2.cartoes.idNUMERO;
    
SELECT V2.BANDEIRA, MEDIA_COMPRAS 
	FROM V2 WHERE bandeira = "MASTERCARD";





    