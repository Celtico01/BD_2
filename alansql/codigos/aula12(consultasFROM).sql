use SistemaAcademicoBCC

go

create view vw_qtdeAlunos
as
select count(*) QTDE_ALUNOS, CUR_NOME NOME_CURSO
from tbAluno A join tbCurso C 
	on A.CUR_CODIGO = C.CUR_CODIGO
where CUR_NIVEL like 'Gradua[çc][aã]o'
group by C.CUR_CODIGO, CUR_NOME

go

select *
from vw_qtdeAlunos
group by NOME_CURSO, QTDE_ALUNOS
having QTDE_ALUNOS = 13

go

select count(*) QTDE_ALUNOS, CUR_NOME NOME_CURSO
from tbAluno A join tbCurso C 
	on A.CUR_CODIGO = C.CUR_CODIGO
where CUR_NIVEL like 'Gradua[çc][aã]o'
group by C.CUR_CODIGO, CUR_NOME
having count(*) = (select max(QTDE_ALUNOS)
				   from vw_qtdeAlunos)

go

create view vwPRO_LOTACAO
as
select sum(D.DIS_CARGA_HORARIA) lotacao, P.PRO_NOME
from tbProfessor P join tbOfertaDisciplina OD
	on P.PRO_CODIGO = OD.PRO_CODIGO join tbDisciplina D
	on OD.DIS_CODIGO = D.DIS_CODIGO
where OD.ODI_SEMESTRE = 2 and OD.ODI_ANO = 2014
group by P.PRO_NOME, P.PRO_CODIGO

go

select max(lotacao) MAIOR, PRO_NOME
from vwPRO_LOTACAO
where lotacao = (select max(lotacao)
				 from vwPRO_LOTACAO)
group by PRO_NOME

go