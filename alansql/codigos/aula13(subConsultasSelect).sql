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