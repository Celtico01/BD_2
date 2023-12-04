 use SistemaAcademicoBCC

select DIS_NOME 'Nome da Disciplina', PRO_NOME 'Nome do Professor' from tbDisciplina D join tbProfessor P on D.PRO_CODIGO = P.PRO_CODIGO

select DIS_NOME 'Nome da DIsciplina', CUR_NOME 'Nome do Curso' from tbDisciplina D join tbCurso C on D.CUR_CODIGO = C.CUR_CODIGO

select ALU_NOME 'Nome do Aluno' from tbAluno A join tbCurso C on A.CUR_CODIGO = C.CUR_CODIGO
where CUR_NOME like '% Computação'

/*consulta errada */

select ALU_NOME 'Nome do Aluno' from tbAluno A join tbDisciplina D on A.CUR_CODIGO = D.CUR_CODIGO
where DIS_NOME = 'Banco de Dados II'

/*Aula 3*/

use SistemaAcademicoBCC

select ALU_NOME 'Nome do Aluno' , CUR_NOME 'Nome do Curso', DIS_NOME 'Nome da Disciplina'
from tbAluno A join tbCurso C on A.CUR_CODIGO = C.CUR_CODIGO join tbDisciplina D on C.CUR_CODIGO = D.CUR_CODIGO

select DISTINCT ALU_NOME 'Nome do Aluno' 
from tbAluno A join tbAlunoMatricula AM on A.ALU_CODIGO = AM.ALU_CODIGO 
join tbOfertaDisciplina OD on AM.ODI_CODIGO = OD.ODI_CODIGO 
join tbDisciplina D on OD.DIS_CODIGO = D.DIS_CODIGO 
where DIS_NOME = 'Banco de Dados II'


select count(*) 'Quantidade de Professores'
from tbProfessor P join tbOfertaDisciplina OD on P.PRO_CODIGO = OD.PRO_CODIGO
join tbDisciplina D on OD.DIS_CODIGO = D.DIS_CODIGO
join tbCurso C on D.CUR_CODIGO = C.CUR_CODIGO
where CUR_NOME = 'Bacharelado em Ciência da Computação'

