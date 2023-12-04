use BD_Empresa 

select FUN_NOME 
from tbFuncionario
where FUN_SALARIO in (select min(FUN_SALARIO)
					  from tbFuncionario
					  group by DEP_CODIGO)

select FUN_NOME
from tbFuncionario
where FUN_SALARIO > all(select min(FUN_SALARIO)
						from tbFuncionario
						group by DEP_CODIGO)

select FUN_NOME
from tbFuncionario
where FUN_SALARIO > any (select min(FUN_SALARIO)
						from tbFuncionario
						group by DEP_CODIGO)


/*second part*/

select FUN_NOME, FUN_SALARIO
from tbFuncionario
where FUN_SALARIO > all(select FUN_SALARIO 
						from tbFuncionario
						where FUN_CARGO in('Coordenador', 'Gerente'))

select FUN_NOME, FUN_SALARIO, DEP_NOME
from tbFuncionario F join tbDepartamento D
	on F.DEP_CODIGO = D.DEP_CODIGO
where FUN_SALARIO > any(select FUN_SALARIO
						from tbFuncionario F join tbDepartamento D
							on F.DEP_CODIGO = D.DEP_CODIGO
						where DEP_NOME = 'Administração') and
	  DEP_NOME != 'Administração'


