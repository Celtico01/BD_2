use BD_Empresa

select FUN_NOME
from tbFuncionario FUN_S
where FUN_SALARIO > (select avg(FUN_SALARIO)
					 from tbFuncionario
					 where DEP_CODIGO = FUN_S.DEP_CODIGO)

select FUN_NOME, DEP_NOME
from tbFuncionario FUN_S join tbDepartamento DEP_S
	on FUN_S.DEP_CODIGO = DEP_S.DEP_CODIGO
where FUN_SALARIO = (select min(FUN_SALARIO)
					 from tbFuncionario
					 where DEP_CODIGO = FUN_S.DEP_CODIGO)


select FUN_NOME, FUN_SALARIO, FUN_CARGO
from tbFuncionario FUN_S
where FUN_SALARIO = (select max(FUN_SALARIO)
					 from tbFuncionario
					 where FUN_CARGO = FUN_S.FUN_CARGO)
order by FUN_CARGO