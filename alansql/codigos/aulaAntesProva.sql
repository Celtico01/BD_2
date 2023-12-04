use SistemaAcademicoBCC

/*#1*/
select DIS_NOME 'Disciplina', CUR_NOME 'Curso'
from tbDisciplina D join tbCurso C
on  D.CUR_CODIGO = C.CUR_CODIGO
order by DIS_NOME

/*#2*/
select A.*, CUR_NOME Cursos
from tbAluno A join tbCurso C
	on A.CUR_CODIGO = C.CUR_CODIGO
where CUR_NIVEL = 'Técnico'

/*#3*/
select ALU_NOME, ALU_MATRICULA
from tbAluno A join tbCurso C
	on A.CUR_CODIGO = C.CUR_CODIGO
where CUR_NOME like '%Ciência da Computação'

/*#4*/
select DIS_NOME, DIS_CARGA_HORARIA
from tbDisciplina D join tbOfertaDisciplina OD
	on D.DIS_CODIGO = OD.DIS_CODIGO
where ODI_ANO = 2014 and ODI_SEMESTRE = 2
order by DIS_CARGA_HORARIA

select DIS_NOME, DIS_CARGA_HORARIA
from tbDisciplina D , tbOfertaDisciplina OD
where ODI_ANO = 2014 and 
	ODI_SEMESTRE = 2 and
	D.DIS_CODIGO = OD.DIS_CODIGO
order by DIS_CARGA_HORARIA

/*#7*/
select DIS_NOME, PRO_NOME
from tbDisciplina D join tbOfertaDisciplina OD
	on D.DIS_CODIGO = OD.DIS_CODIGO
join tbProfessor P
	on OD.PRO_CODIGO = P.PRO_CODIGO
where ODI_TURNO = 'Noite' and
	  ODI_ANO = 2014 and
	  ODI_SEMESTRE = 2

/*#5*/
select distinct PRO_NOME
from tbProfessor P join tbOfertaDisciplina OD
	on P.PRO_CODIGO = OD.PRO_CODIGO 
	join tbDisciplina D
	on D.DIS_CODIGO = OD.DIS_CODIGO
where ODI_SEMESTRE = 2 and
	  ODI_ANO = 2014

/*#6*/
select count(*) 'qtde de disciplinas'
from tbDisciplina D join tbCurso C
	on D.CUR_CODIGO = C.CUR_CODIGO
where CUR_NOME like '%Ciência da Computação'

/*#8*/
select ALU_NOME
from tbAluno A join tbAlunoMatricula AM
	on A.ALU_CODIGO = AM.ALU_CODIGO
join tbOfertaDisciplina OD
	on AM.ODI_CODIGO = OD.ODI_CODIGO
join tbDisciplina D
	on D.DIS_CODIGO = OD.DIS_CODIGO
join tbCurso C
	on D.CUR_CODIGO = C.CUR_CODIGO
where ODI_SEMESTRE = 2 and
	ODI_ANO = 2014 and
	DIS_NOME = 'Banco de Dados I'

