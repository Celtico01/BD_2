use  SistemaAcademicoBCC

select * from tbAluno

select DIS_NOME 'Nome da Disciplina', DIS_CARGA_HORARIA 'Carga Hor�ria'from tbDisciplina
order by DIS_NOME

select ALU_NOME 'Nome do Aluno' from tbAluno
where ALU_SEXO = 'M' and ALU_CIDADE like 'Tiangu[a�]'

select count(*) 'QTDE de Cursos' from tbCurso

select count(*) 'QTDE de Disciplinas' from tbDisciplina

select avg(CUR_CARGA_HORARIA) 'M�dia da Carga Hor�ria' from tbCurso
where CUR_NIVEL like 't[e�]cnico'

select ALU_CIDADE CIDADE, count(*) 'QTDE' from tbAluno
group by ALU_CIDADE

select count(*) 'QTDE de Disciplinas', sum(DIS_CARGA_HORARIA) 'SUM Carga Hor�ria'from tbDisciplina
group by CUR_CODIGO

select CUR_CODIGO 'C�digo do Curso', count(*) QTDE from tbDisciplina
where DIS_NOME like 'Banco de Dados%'
group by CUR_CODIGO

select CUR_CODIGO 'C�digo do Curso', count(*) QTDE from tbAluno
where ALU_SEXO = 'F'
group by CUR_CODIGO








