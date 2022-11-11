SELECT * FROM biblioteca.livros WHERE AUTOR = "GLAUBER";
SELECT * from biblioteca.livros WHERE TITULO = "BANCO DE DADOS";
select NOME_ALUNO, DATA_EMPRESTIMO, NOME_FUNCIONARIO 
	FROM biblioteca.emprestimos, biblioteca.ALUNOS, biblioteca.FUNCIONARIOS 
	WHERE biblioteca.emprestimos.idALUNOS = biblioteca.alunos.idALUNOS
	AND biblioteca.emprestimos.idFUNCIONARIOS = biblioteca.funcionarios.idFUNCIONARIOS 
	ORDER BY biblioteca.emprestimos.DATA_EMPRESTIMO;
select TITULO, DATA_EMPRESTIMO, DATA_DEVOLUCAO 
	FROM biblioteca.livros, biblioteca.emprestimos, biblioteca.exemplares, biblioteca.itens_emprestimos
	where biblioteca.emprestimos.idEMPRESTIMO = biblioteca.itens_emprestimos.idEMPRESTIMO
    AND biblioteca.itens_emprestimos.idEXEMPLARES = biblioteca.exemplares.idEXEMPLARES
    AND biblioteca.exemplares.idLIVROS = biblioteca.livros.idLIVROS
    AND DATA_EMPRESTIMO < "2022-10-05" AND DATA_DEVOLUCAO IS NULL
    ORDER BY TITULO;
select NOME_ALUNO, TITULO  
	FROM biblioteca.livros, biblioteca.emprestimos, biblioteca.exemplares, 
    biblioteca.itens_emprestimos, biblioteca.alunos
	where biblioteca.emprestimos.idEMPRESTIMO = biblioteca.itens_emprestimos.idEMPRESTIMO
    AND biblioteca.itens_emprestimos.idEXEMPLARES = biblioteca.exemplares.idEXEMPLARES
    AND biblioteca.exemplares.idLIVROS = biblioteca.livros.idLIVROS
    AND biblioteca.alunos.idALUNOS = biblioteca.emprestimos.idALUNOS
    AND DATA_DEVOLUCAO > DATA_PREVISTA
    ORDER BY TITULO;
SELECT distinct NOME_ALUNO, TITULO
	FROM biblioteca.livros, biblioteca.alunos, biblioteca.emprestimos, 
    biblioteca.itens_emprestimos, biblioteca.EXEMPLARES
    where biblioteca.alunos.idALUNOS = biblioteca.emprestimos.idALUNOS
    AND biblioteca.emprestimos.idEMPRESTIMO = biblioteca.itens_emprestimos.idEMPRESTIMO
    AND biblioteca.itens_emprestimos.idEXEMPLARES = biblioteca.exemplares.idEXEMPLARES
    AND biblioteca.exemplares.idLIVROS = biblioteca.livros.idLIVROS
    ORDER BY NOME_ALUNO;
SELECT distinct NOME_ALUNO, TITULO
	FROM biblioteca.livros, biblioteca.alunos, biblioteca.emprestimos, 
    biblioteca.itens_emprestimos, biblioteca.EXEMPLARES
    where biblioteca.alunos.idALUNOS = biblioteca.emprestimos.idALUNOS
    AND biblioteca.emprestimos.idEMPRESTIMO = biblioteca.itens_emprestimos.idEMPRESTIMO
    AND biblioteca.itens_emprestimos.idEXEMPLARES = biblioteca.exemplares.idEXEMPLARES
    AND biblioteca.exemplares.idLIVROS = biblioteca.livros.idLIVROS
    AND TITULO = "POO"
    ORDER BY NOME_ALUNO;
SELECT NOME_ALUNO, COUNT(idEMPRESTIMO) AS QTDEMP 
	FROM biblioteca.emprestimos, biblioteca.alunos
	WHERE emprestimos.idALUNOS = alunos.idALUNOS
    GROUP BY NOME_ALUNO;
SELECT NOME_ALUNO, COUNT(idEXEMPLARES) AS QTDEX
	FROM biblioteca.emprestimos, biblioteca.ALUNOS, biblioteca.itens_emprestimos
    WHERE emprestimos.idALUNOS = alunos.idALUNOS
    AND emprestimos.idEMPRESTIMO = itens_emprestimos.idEMPRESTIMO
    GROUP BY NOME_ALUNO;