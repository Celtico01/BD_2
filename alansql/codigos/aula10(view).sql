/* 
create view <nome_view> [(nome_colunas)]
as <select>
*/

use SistemaAcademicoBCC
go

create view vwCurso
as 
select C.CUR_CODIGO CODIGO, CUR_NOME NOME, CUR_NIVEL NIVEL, count(*) 'QTDE DE DISCIPLINAS' , sum(DIS_CARGA_HORARIA) 'SOMA CARGA HORARIA'
from tbCurso C join tbDisciplina D
	on C.CUR_CODIGO = D.CUR_CODIGO
group by C.CUR_CODIGO, CUR_NOME, CUR_NIVEL

go

select NOME
from vwCurso
where NIVEL = 'Graduação' and [QTDE DE DISCIPLINAS] > 5
order by [QTDE DE DISCIPLINAS]

go

create view vwAluno
as
select A.ALU_CODIGO CODIGO_ALU, ALU_NOME NOME_ALU, DIS_NOME NOME_DIS
from tbAluno A join tbAlunoMatricula AM
	on A.ALU_CODIGO = AM.ALU_CODIGO join tbOfertaDisciplina OD
	on AM.ODI_CODIGO = OD.ODI_CODIGO join tbDisciplina D
	on OD.DIS_CODIGO = D.DIS_CODIGO

go

select NOME_DIS, count(CODIGO_ALU) QTDE_ALUNOS
from vwAluno
group by NOME_DIS

go

create view vwCursoDisciplina
as 
select C.CUR_CODIGO, CUR_NOME, CUR_NIVEL
from tbCurso C
where CUR_CARGA_HORARIA > (select sum(D_DOWN.DIS_CARGA_HORARIA)
						   from tbDisciplina D_DOWN
						   where D_DOWN.CUR_CODIGO = C.CUR_CODIGO
						   )

go

select vw_CD.CUR_NIVEL, count(*) QTDE, sum(C.CUR_CARGA_HORARIA) CUR_CH
from vwCursoDisciplina vw_CD join tbCurso C
	on vw_CD.CUR_CODIGO = C.CUR_CODIGO
group by vw_CD.CUR_NIVEL

go

create view vwQTDEDIS
as 
select D.CUR_CODIGO CODIGO_CURSO, count(DIS_CODIGO) QTDE_DIS 
from tbDisciplina D join tbCurso C
	on D.CUR_CODIGO = C.CUR_CODIGO
group by D.CUR_CODIGO

go

select avg(QTDE_DIS) MEDIA from vwQTDEDIS

go

create view vwPRO_LOTACAO
as
select sum(D.DIS_CARGA_HORARIA) lotacao, P.PRO_CODIGO CODIGO_PRO
from tbProfessor P join tbOfertaDisciplina OD
	on P.PRO_CODIGO = OD.PRO_CODIGO join tbDisciplina D
	on OD.DIS_CODIGO = D.DIS_CODIGO
where OD.ODI_SEMESTRE = 2 and OD.ODI_ANO = 2014
group by P.PRO_CODIGO

go

select max(lotacao) MAIOR from vwPRO_LOTACAO

go