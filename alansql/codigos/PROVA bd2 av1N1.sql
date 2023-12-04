use SistemaAcademicoBCC


/*Exibir o nome do curso e o nome dos alunos dos cursos de nível Técnico. Ordene o resultado pelo nome do aluno.*/
select CUR_NOME, ALU_NOME
from tbCurso C join tbAluno A
	on C.CUR_CODIGO = A.CUR_CODIGO
where CUR_NIVEL = 'Técnico'
order by ALU_NOME

/*Exibir a quantidade de disciplinas por curso. Ordene o resultado pelo nome do curso.*/

select CUR_NOME, count(DIS_NOME) QTDE
from tbDisciplina D join tbCurso C
	on D.CUR_CODIGO = C.CUR_CODIGO
group by CUR_NOME
order by CUR_NOME

/*Exibir o nome dos alunos do professor Raimundo Maciel. Ordene o resultado pelo nome dos alunos.*/

select ALU_NOME
from tbAluno A join tbCurso C
	on A.CUR_CODIGO = C.CUR_CODIGO join tbDisciplina D
	on C.CUR_CODIGO = D.CUR_CODIGO join tbOfertaDisciplina OD
	on D.DIS_CODIGO = OD.DIS_CODIGO join tbProfessor P
	on OD.PRO_CODIGO = P.PRO_CODIGO
where PRO_NOME = 'Raimundo Maciel'
order by ALU_NOME

/*Exibir o nome dos professores que ensinam alguma disciplina do Curso Bacharelado em Ciência da Computação no semestre 2 do ano 2014. 
Ordene o resultado pelo nome do professor.*/

select DISTINCT PRO_NOME
from tbProfessor P join tbOfertaDisciplina OD
	on P.PRO_CODIGO = OD.ODI_CODIGO join tbDisciplina D
	on OD.DIS_CODIGO = D.DIS_CODIGO join tbCurso C
	on D.CUR_CODIGO = C.CUR_CODIGO
where CUR_NOME like '%Ciência da Computação' and ODI_SEMESTRE = 2 and ODI_ANO = 2014
order by PRO_NOME

