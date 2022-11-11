/* A */
SELECT * FROM biblioteca_2ETAP.livros WHERE AUTOR = "MACHADO DE ASSIS";

/* B */
SELECT * from biblioteca_2ETAP.livros WHERE TITULO = "BANCO DE DADOS";

/* C */ 
select NOME_ALUNO, DATA_EMPRESTIMO, NOME_FUNCIONARIO 
	FROM biblioteca_2ETAP.emprestimos, biblioteca_2ETAP.ALUNOS, biblioteca_2ETAP.FUNCIONARIOS 
	WHERE biblioteca_2ETAP.emprestimos.idALUNOS = biblioteca_2ETAP.alunos.idALUNOS
	AND biblioteca_2ETAP.emprestimos.idFUNCIONARIOS = biblioteca_2ETAP.funcionarios.idFUNCIONARIOS 
	ORDER BY biblioteca_2ETAP.emprestimos.DATA_EMPRESTIMO;
    
/* D */
select TITULO, DATA_EMPRESTIMO, DATA_DEVOLUCAO 
	FROM biblioteca_2ETAP.livros, biblioteca_2ETAP.emprestimos, 
		biblioteca_2ETAP.exemplares, biblioteca_2ETAP.itens_emprestimos
	where biblioteca_2ETAP.emprestimos.idEMPRESTIMO = biblioteca_2ETAP.itens_emprestimos.idEMPRESTIMO
    AND biblioteca_2ETAP.itens_emprestimos.idEXEMPLARES = biblioteca_2ETAP.exemplares.idEXEMPLARES
    AND biblioteca_2ETAP.exemplares.idLIVROS = biblioteca_2ETAP.livros.idLIVROS
    AND DATEDIFF(DATA_DEVOLUCAO, DATA_PREVISTA ) > 0
    ORDER BY TITULO;
    
/* E */
select NOME_ALUNO, DATA_EMPRESTIMO, DATA_DEVOLUCAO, DATA_PREVISTA, 
		DATEDIFF(DATA_DEVOLUCAO, DATA_PREVISTA ) AS DIAS_ATRASO
	FROM biblioteca_2ETAP.livros, biblioteca_2ETAP.emprestimos, 
		biblioteca_2ETAP.exemplares, biblioteca_2ETAP.itens_emprestimos,
        biblioteca_2etap.ALUNOS
	where biblioteca_2ETAP.emprestimos.idEMPRESTIMO = biblioteca_2ETAP.itens_emprestimos.idEMPRESTIMO
    AND biblioteca_2ETAP.itens_emprestimos.idEXEMPLARES = biblioteca_2ETAP.exemplares.idEXEMPLARES
    AND biblioteca_2ETAP.exemplares.idLIVROS = biblioteca_2ETAP.livros.idLIVROS
    AND DATA_EMPRESTIMO < CURDATE()
    ORDER BY DIAS_ATRASO;
    
/* F */
SELECT distinct NOME_ALUNO, TITULO
	FROM biblioteca_2ETAP.livros, biblioteca_2ETAP.alunos, biblioteca_2ETAP.emprestimos, 
		biblioteca_2ETAP.itens_emprestimos, biblioteca_2ETAP.EXEMPLARES
    where biblioteca_2ETAP.alunos.idALUNOS = biblioteca_2ETAP.emprestimos.idALUNOS
    AND biblioteca_2ETAP.emprestimos.idEMPRESTIMO = biblioteca_2ETAP.itens_emprestimos.idEMPRESTIMO
    AND biblioteca_2ETAP.itens_emprestimos.idEXEMPLARES = biblioteca_2ETAP.exemplares.idEXEMPLARES
    AND biblioteca_2ETAP.exemplares.idLIVROS = biblioteca_2ETAP.livros.idLIVROS
    ORDER BY NOME_ALUNO, TITULO;

/* G */
SELECT distinct NOME_ALUNO, TITULO
	FROM biblioteca_2ETAP.livros, biblioteca_2ETAP.alunos, biblioteca_2ETAP.emprestimos, 
		biblioteca_2ETAP.itens_emprestimos, biblioteca_2ETAP.EXEMPLARES
    where biblioteca_2ETAP.alunos.idALUNOS = biblioteca_2ETAP.emprestimos.idALUNOS
    AND biblioteca_2ETAP.emprestimos.idEMPRESTIMO = biblioteca_2ETAP.itens_emprestimos.idEMPRESTIMO
    AND biblioteca_2ETAP.itens_emprestimos.idEXEMPLARES = biblioteca_2ETAP.exemplares.idEXEMPLARES
    AND biblioteca_2ETAP.exemplares.idLIVROS = biblioteca_2ETAP.livros.idLIVROS
    AND TITULO = "POO"
    ORDER BY NOME_ALUNO;
    
/* H */
SELECT NOME_ALUNO, COUNT(idEMPRESTIMO) AS QTDEMP 
	FROM biblioteca_2ETAP.emprestimos, biblioteca_2ETAP.alunos
	WHERE biblioteca_2ETAP.emprestimos.idALUNOS = biblioteca_2ETAP.alunos.idALUNOS
    GROUP BY NOME_ALUNO;
    
/* I */
 SELECT NOME_ALUNO, COUNT(idEXEMPLARES) AS QTDEX
	FROM biblioteca_2ETAP.emprestimos, biblioteca_2ETAP.ALUNOS, biblioteca_2ETAP.itens_emprestimos
    WHERE biblioteca_2ETAP.emprestimos.idALUNOS = biblioteca_2ETAP.alunos.idALUNOS
    AND biblioteca_2ETAP.emprestimos.idEMPRESTIMO = biblioteca_2ETAP.itens_emprestimos.idEMPRESTIMO
    GROUP BY NOME_ALUNO;   
    
/* J */
 SELECT TITULO, COUNT(idEXEMPLARES) AS QTDEX
	FROM biblioteca_2ETAP.livros, biblioteca_2etap.exemplares
    WHERE biblioteca_2ETAP.LIVROS.idLIVROS = biblioteca_2ETAP.exemplares.idLIVROS
    GROUP BY TITULO;   
    
/* K */
SELECT NOME_ALUNO, SUM(MULTA) AS TOTAL_MULTAS
	FROM biblioteca_2etap.ALUNOS, biblioteca_2etap.emprestimos, biblioteca_2etap.itens_emprestimos,
		biblioteca_2etap.exemplares
	WHERE biblioteca_2etap.ALUNOS.IDALUNOS = biblioteca_2etap.emprestimos.idALUNOS
    AND biblioteca_2etap.emprestimos.idEMPRESTIMO = biblioteca_2etap.itens_emprestimos.idEMPRESTIMO
    AND biblioteca_2etap.itens_emprestimos.idEXEMPLARES = biblioteca_2etap.exemplares.idEXEMPLARES
    AND MULTA IS NOT null
    GROUP BY NOME_ALUNO;


