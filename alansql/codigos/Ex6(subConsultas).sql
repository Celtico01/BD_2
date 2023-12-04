use SistemaAcademicoBCC

/*a) Obter o nome das disciplinas do curso de Ciência da Computação que possuem a maior
carga horária.*/

select DIS_NOME
from tbDisciplina D join tbCurso C
	on D.CUR_CODIGO = C.CUR_CODIGO
where CUR_NOME like '% Ciência da Computação' and DIS_CARGA_HORARIA = (select max(DIS_CARGA_HORARIA)
																	   from tbDisciplina
																	   )

/*b) Obter o nome dos cursos de menor carga horária em cada nível. Exibir também a carga
horária e ordenar o resultado pela carga horária em ordem decrescente.*/

select CUR_S.CUR_NOME, CUR_S.CUR_CARGA_HORARIA, CUR_S.CUR_NIVEL
from tbCurso CUR_S
where CUR_S.CUR_CARGA_HORARIA = (select min(CUR_CARGA_HORARIA)
								 from tbCurso
								 where CUR_S.CUR_NIVEL = CUR_NIVEL
								 )
order by CUR_CARGA_HORARIA DESC

/*c) Obter o nome do professor com maior tempo de serviço.*/

select PRO_NOME, PRO_DATA_ADMISSAO
from tbProfessor
where PRO_DATA_ADMISSAO = (select min(PRO_DATA_ADMISSAO)
						   from tbProfessor
						   )

/*d) Obter o nome dos cursos cuja carga horária é superior a carga horária de suas
disciplinas.*/

select DISTINCT CUR_S.CUR_NOME
from tbCurso CUR_S join tbDisciplina DIS_S
	on CUR_S.CUR_CODIGO = DIS_S.CUR_CODIGO
where CUR_CARGA_HORARIA > (select sum(DIS_CARGA_HORARIA)
						   from tbDisciplina
						   where DIS_CODIGO = DIS_S.DIS_CARGA_HORARIA
						   )

/*e) Obter o nome dos cursos de nível técnico que possuem carga horária superior a carga
horária de algum curso de nível de graduação.*/

select CUR_NOME
from tbCurso
where CUR_NIVEL = 'Técnico' and CUR_CARGA_HORARIA > any(select CUR_CARGA_HORARIA
													    from tbCurso
													    where CUR_NIVEL = 'Graduação')

/*f) Obter o nome das disciplinas de menor carga horária em cada curso.*/

select DIS_NOME, DIS_CARGA_HORARIA, CUR_NOME
from tbDisciplina DIS_S join tbCurso CUR_S
	on DIS_S.CUR_CODIGO = CUR_S.CUR_CODIGO
where DIS_CARGA_HORARIA = (select min(DIS_CARGA_HORARIA)
						   from tbDisciplina
						   where CUR_S.CUR_CODIGO = CUR_CODIGO)