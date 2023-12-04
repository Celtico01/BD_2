use BD_Empresa

select FUN_NOME, FUN_SALARIO, DEP_NOME
from tbFuncionario F join tbDepartamento D
	on F.DEP_CODIGO = D.DEP_CODIGO
where FUN_SALARIO > (select avg(FUN_SALARIO) from tbFuncionario)

select FUN_NOME, FUN_SALARIO
from tbFuncionario 
where FUN_SALARIO > (select FUN_SALARIO 
					 from tbFuncionario
					 where FUN_NOME like 'José Antônio')

select FUN_NOME
from tbFuncionario
where FUN_SALARIO > (select min(FUN_SALARIO)
					 from tbFuncionario
					 where FUN_CARGO = 'Coordenador')

select FUN_NOME
from tbFuncionario
where FUN_CARGO = (select FUN_CARGO
				   from tbFuncionario
				   where FUN_NOME = 'Paulo Viegas') and FUN_SALARIO > (select FUN_SALARIO
																	   from tbFuncionario
																	   where FUN_NOME = 'Antônio Dias')

select FUN_NOME, FUN_SALARIO
from tbFuncionario F join tbDepartamento D
	on F.DEP_CODIGO = D.DEP_CODIGO
where DEP_NOME = 'Administração' and FUN_SALARIO = (select max(FUN_SALARIO) 
												       from tbFuncionario F join tbDepartamento D
														   on F.DEP_CODIGO = D.DEP_CODIGO
													   where DEP_NOME = 'Administração')
