use Empresa

/*a) Obter o nome dos funcionários que atenderam pedidos com valor de frete acima da
média de valor de frete de todos os pedidos.*/

select FUN_S.Nome, PED_S.Frete
from Funcionarios FUN_S join Pedidos PED_S
	on FUN_S.CodFun = PED_S.CodFun
where PED_S.Frete > (select avg(PED_D.Frete)
					 from Pedidos PED_D)

/*b) Obter a descrição das categorias que possuem produtos com preço abaixo da média de
preço dos produtos.*/
select CAT_S.Descr, PRO_S.Preco
from Categorias CAT_S join Produtos PRO_S
	on CAT_S.CodCategoria = PRO_S.CodCategoria
where PRO_S.Preco < (select avg(PRO_D.Preco)
					 from Produtos PRO_D
					 )

/*c) Obter a descrição dos produtos que possuem preço superior a qualquer produto da
categoria Bebidas. Obs.: Não exibir os produtos da categoria Bebidas.*/
