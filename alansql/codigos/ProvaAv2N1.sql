use Empresa

/*Exibir o nome e o cargo do(s) funcionário(s) de cargo coordenador que possuem o menor salário. 
Considere que podem haver diferentes coordenadores, por exemplo, Coordenador de Vendas, Coordenador de RH. 
Ordene o resultado pelo nome do funcionário.*/

select Nome, Cargo
from Funcionarios
where Salario = (select min(Salario)
				 from Funcionarios
				 where Cargo like 'Coordenador %'
				)

/*Exibir a descrição do(s) produto(s) da categoria Bebidas que não foram vendido no ano de 2017.*/

select * from Categorias
select * from Produtos order by CodCategoria


select P.Descr
from Produtos P join Categorias C
	on P.CodCategoria = C.CodCategoria
where C.Descr = 'Bebidas' and 2017 <> all(select year(DataPed)
									      from Pedidos PED join DetalhesPed DP
											 on PED.NumPed = DP.NumPed join Produtos PRO
											 on PRO.CodProd = DP.CodProd
										)
order by Descr


/*Exibir a descrição e o preço do produto mais barato de cada fornecedor. Ordene o resultado pelo preço do produto.*/

select PRO.Descr, F.Empresa
from Produtos PRO join Fornecedores F
	on PRO.CodFor = F.CodFor
where PRO.Preco = (select min(PRO_D.Preco)
				   from Produtos PRO_D join Fornecedores F_D
					  on PRO_D.CodFor = F_D.CodFor
				   where F.CodFor = F_D.CodFor
				  )
order by PRO.Preco

select * from Fornecedores