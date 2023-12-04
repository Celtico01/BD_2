use SistemaAcademicoBCC

go 

create view vwSUM_CRED
as
select ALU_CODIGO, ODI_ANO, ODI_SEMESTRE, sum(DIS_CARGA_HORARIA / 20) QTDE_CRED
from tbDisciplina D join tbOfertaDisciplina OD
	on D.DIS_CODIGO = OD.DIS_CODIGO join tbAlunoMatricula AM
	on OD.ODI_CODIGO = AM.ODI_CODIGO
group by ALU_CODIGO, ODI_ANO, ODI_SEMESTRE

go

select ODI_ANO, ODI_SEMESTRE, avg(QTDE_CRED) MEDIA_CRED
from vwSUM_CRED
group by ODI_ANO, ODI_SEMESTRE

go


select CUR_NOME, QTDE_DIS
from vwQTDE
where QTDE_DIS = (select max(QTDE_DIS)
				  from vwQTDE)

go

create view vwQTDE
as
select C.CUR_CODIGO, C.CUR_NOME, count(DIS_CODIGO) QTDE_DIS
from tbCurso C join tbDisciplina D
	on C.CUR_CODIGO = D.CUR_CODIGO
group by C.CUR_CODIGO, C.CUR_NOME

go
