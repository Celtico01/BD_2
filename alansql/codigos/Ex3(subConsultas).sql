use Empresa

/*1) Obter o nome dos produtos que possuem o maior preço. Ordene o resultado pelo nome do
produto.*/

select Descr
from Produtos
where preco = all(select max(preco)
			   from Produtos)
order by Descr

/*2) O número do pedido realizado no ano de 1996 que possui o maior valor de frete.*/

select NumPed
from Pedidos
where year(DataPed) = 1996 and Frete = (select max(Frete)
										from Pedidos 
										where year(DataPed) = 1996)

/*3) Obter o nome dos funcionários do Brasil que possuem o salário superior à média de salário da
empresa.*/

select Nome
from Funcionarios
where Pais = 'Brasil' and Salario > (select avg(Salario) 
									 from Funcionarios)


/*4) O nome dos produtos da categoria Bebidas que possuem o menor preço.*/

select Descr
from Produtos
where Preco = (select min(Preco)
			   from Produtos P join Categorias C
				   on P.CodCategoria = C.CodCategoria
			   where C.Descr = 'Bebidas'
			   )

/*5) O nome dos produtos da categoria Bebidas que também estão em outra categoria.*/

select P.Descr
from Produtos P join Categorias C
	on P.CodCategoria = C.CodCategoria
where C.Descr = 'Bebidas' and C.Descr = any(select C.Descr
											from Categorias C join Produtos P
												on C.CodCategoria = P.CodCategoria
											where C.Descr != 'Bebidas')


/*6) O nome dos produtos fornecidos pela Empresa Refrescos Americanas LTDA que possuem
preço superior a algum produto fornecido pela Empresa Ma Maison.*/

select Descr
from Produtos P join Fornecedores F
	on P.CodFor = F.CodFor
where Empresa = 'Americanas LTDA' and Preco > any(select Preco
												  from Produtos P join Fornecedores F
												      on P.CodFor = F.CodFor
												  where Empresa = 'Ma Maison')

/*7) O nome dos funcionários que não realizaram nenhum pedido no ano de 1999.*/

select Nome 
from Funcionarios F join Pedidos P
	on F.CodFun = P.CodFun
where F.CodFun != all(select F.CodFun
					  from Pedidos P join Funcionarios F
						on P.CodFun = F.CodFun
					  where YEAR(DataPed) = 1999)

/*8) O nome dos produtos da categoria Confeitos que possuem preço superior que todos os preços
dos produtos da categoria Condimentos.*/

select P.Descr
from Produtos P join Categorias C
	on P.CodCategoria = P.CodCategoria
where C.Descr = 'Confeitos'and Preco > all(select Preco 
										   from Produtos P join Categorias C
										      on P.CodCategoria = C.CodCategoria
										   where C.Descr = 'Condimentos')