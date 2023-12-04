use SistemaAcademicoBCC

/*a) Para cada n�vel, obter o curso de menor carga hor�ria. Exibir o nome, a carga hor�ria e o
n�vel do curso. Ordenar o resultado pelo n�vel.
*/

select CUR_NOME, CUR_CARGA_HORARIA, CUR_NIVEL
from tbCurso CUR_S
where CUR_CARGA_HORARIA = (select min(CUR_CARGA_HORARIA)
						   from tbCurso
						   where CUR_NIVEL = CUR_S.CUR_NIVEL)
order by CUR_NIVEL

/*b) Obter o nome das disciplinas de maior carga hor�ria em cada curso.*/
select DIS_NOME, DIS_CARGA_HORARIA, CUR_NOME
from tbDisciplina DIS_S join tbCurso CUR_S
	on DIS_S.CUR_CODIGO = CUR_S.CUR_CODIGO
where DIS_CARGA_HORARIA = (select max(DIS_CARGA_HORARIA)
						   from tbDisciplina DIS_D
						   where DIS_S.CUR_CODIGO = DIS_D.CUR_CODIGO)
/*c) O nome dos cursos que possuem carga hor�ria acima da m�dia de carga hor�ria do seu
n�vel.*/

select CUR_NOME, CUR_NIVEL
from tbCurso CUR_S
where CUR_CARGA_HORARIA > (select avg(CUR_CARGA_HORARIA)
						   from tbCurso
						   where CUR_S.CUR_NIVEL = CUR_NIVEL)

/*d) O nome e a carga hor�ria das disciplinas dos cursos de gradua��o, cuja carga hor�ria da
disciplina � inferior � m�dia da carga hor�ria das disciplinas do seu curso. Ordene o
resultado pelo nome da disciplina.*/

select DIS_NOME, DIS_CARGA_HORARIA
from tbDisciplina DIS_S
where DIS_CARGA_HORARIA < (select avg(DIS_D.DIS_CARGA_HORARIA)
						   from tbCurso CUR_D join tbDisciplina DIS_D
							   on CUR_D.CUR_CODIGO = DIS_D.CUR_CODIGO
						   where CUR_NIVEL like 'Gradua��o' and
								 DIS_S.CUR_CODIGO = DIS_D.CUR_CODIGO)
