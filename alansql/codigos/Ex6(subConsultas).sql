use SistemaAcademicoBCC

/*a) Obter o nome das disciplinas do curso de Ci�ncia da Computa��o que possuem a maior
carga hor�ria.*/

select DIS_NOME
from tbDisciplina D join tbCurso C
	on D.CUR_CODIGO = C.CUR_CODIGO
where CUR_NOME like '% Ci�ncia da Computa��o' and DIS_CARGA_HORARIA = (select max(DIS_CARGA_HORARIA)
																	   from tbDisciplina
																	   )

/*b) Obter o nome dos cursos de menor carga hor�ria em cada n�vel. Exibir tamb�m a carga
hor�ria e ordenar o resultado pela carga hor�ria em ordem decrescente.*/

select CUR_S.CUR_NOME, CUR_S.CUR_CARGA_HORARIA, CUR_S.CUR_NIVEL
from tbCurso CUR_S
where CUR_S.CUR_CARGA_HORARIA = (select min(CUR_CARGA_HORARIA)
								 from tbCurso
								 where CUR_S.CUR_NIVEL = CUR_NIVEL
								 )
order by CUR_CARGA_HORARIA DESC

/*c) Obter o nome do professor com maior tempo de servi�o.*/

select PRO_NOME, PRO_DATA_ADMISSAO
from tbProfessor
where PRO_DATA_ADMISSAO = (select min(PRO_DATA_ADMISSAO)
						   from tbProfessor
						   )

/*d) Obter o nome dos cursos cuja carga hor�ria � superior a carga hor�ria de suas
disciplinas.*/

select DISTINCT CUR_S.CUR_NOME
from tbCurso CUR_S join tbDisciplina DIS_S
	on CUR_S.CUR_CODIGO = DIS_S.CUR_CODIGO
where CUR_CARGA_HORARIA > (select sum(DIS_CARGA_HORARIA)
						   from tbDisciplina
						   where DIS_CODIGO = DIS_S.DIS_CARGA_HORARIA
						   )

/*e) Obter o nome dos cursos de n�vel t�cnico que possuem carga hor�ria superior a carga
hor�ria de algum curso de n�vel de gradua��o.*/

select CUR_NOME
from tbCurso
where CUR_NIVEL = 'T�cnico' and CUR_CARGA_HORARIA > any(select CUR_CARGA_HORARIA
													    from tbCurso
													    where CUR_NIVEL = 'Gradua��o')

/*f) Obter o nome das disciplinas de menor carga hor�ria em cada curso.*/

select DIS_NOME, DIS_CARGA_HORARIA, CUR_NOME
from tbDisciplina DIS_S join tbCurso CUR_S
	on DIS_S.CUR_CODIGO = CUR_S.CUR_CODIGO
where DIS_CARGA_HORARIA = (select min(DIS_CARGA_HORARIA)
						   from tbDisciplina
						   where CUR_S.CUR_CODIGO = CUR_CODIGO)