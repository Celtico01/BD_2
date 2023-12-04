use  SistemaAcademicoBCC

select * from tbAluno

select DIS_NOME 'Nome da Disciplina', DIS_CARGA_HORARIA 'Carga Horária'from tbDisciplina
order by DIS_NOME

select ALU_NOME 'Nome do Aluno' from tbAluno
where ALU_SEXO = 'M' and ALU_CIDADE like 'Tiangu[aá]'

select count(*) 'QTDE de Cursos' from tbCurso

select count(*) 'QTDE de Disciplinas' from tbDisciplina

select avg(CUR_CARGA_HORARIA) 'Média da Carga Horária' from tbCurso
where CUR_NIVEL like 't[eé]cnico'

select ALU_CIDADE CIDADE, count(*) 'QTDE' from tbAluno
group by ALU_CIDADE

select count(*) 'QTDE de Disciplinas', sum(DIS_CARGA_HORARIA) 'SUM Carga Horária'from tbDisciplina
group by CUR_CODIGO

select CUR_CODIGO 'Código do Curso', count(*) QTDE from tbDisciplina
where DIS_NOME like 'Banco de Dados%'
group by CUR_CODIGO

select CUR_CODIGO 'Código do Curso', count(*) QTDE from tbAluno
where ALU_SEXO = 'F'
group by CUR_CODIGO








