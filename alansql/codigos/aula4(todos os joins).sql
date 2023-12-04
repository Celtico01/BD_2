use BD_JOIN

/* Exemplo join*/
select DIS_NOME, PRO_NOME 
from tbDisciplina D join tbProfessor P
on D.PRO_CODIGO = P.PRO_CODIGO

/* Exemplo left join*/
select DIS_NOME, PRO_NOME 
from tbDisciplina D left join tbProfessor P
on D.PRO_CODIGO = P.PRO_CODIGO

/* Exemplo right join*/
select DIS_NOME, PRO_NOME
from tbDisciplina D right join tbProfessor P
on D.PRO_CODIGO = P.PRO_CODIGO


/* Exemplo full join*/
select DIS_NOME, PRO_NOME
from tbDisciplina D full join tbProfessor P
on D.PRO_CODIGO = P.PRO_CODIGO


/* Exemplo cross join*/
select DIS_NOME, PRO_NOME
from tbDisciplina D cross join tbProfessor P
where D.PRO_CODIGO = P.PRO_CODIGO


/* Exemplo abrev cross join " , " */
select DIS_NOME, PRO_NOME
from tbDisciplina D , tbProfessor P
where D.PRO_CODIGO = P.PRO_CODIGO