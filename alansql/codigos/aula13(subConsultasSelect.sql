use SistemaAcademicoBCC

go 

select *,
(select count(*) from tbAluno where CUR_CODIGO = C.CUR_CODIGO) QTDE_ALUNO,
(select count(*) from tbDisciplina where CUR_CODIGO = C.CUR_CODIGO)  QTDE_DIS
from tbCurso C

go

/*Obter o nome do curso, a carga horária e a maior carga horária
do nível do curso.*/

select CUR_NOME, CUR_CARGA_HORARIA, 
(select max(CUR_CARGA_HORARIA) 
 from tbCurso 
 where CUR_NIVEL = C.CUR_NIVEL) MAIOR_CH
from tbCurso C
order by CUR_NIVEL


/*→ Obter o nome do professor, a lotação no semestre 2 do ano
2014 e o percentual da lotação do professor em relação a lotação
total no referido semestre.*/

alter view vwLot 
as 
select sum(D.DIS_CARGA_HORARIA) lot, P.PRO_NOME
	from tbProfessor P join tbOfertaDisciplina OD
		on P.PRO_CODIGO = OD.ODI_CODIGO join tbDisciplina D
		on D.DIS_CODIGO = OD.DIS_CODIGO
	where ODI_ANO = 2014 and
		  ODI_SEMESTRE = 2
	group by P.PRO_CODIGO, P.PRO_NOME

go

select *, 
(select cast(lot as decimal(10,2)) / sum(DIS_CARGA_HORARIA) * 1000 from tbDisciplina) Porcentagem_CH
from vwLot
