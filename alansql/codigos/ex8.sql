use Empresa

go

/*a) Crie uma view para obter o nome da categoria e a quantidade de produtos de cada
categoria. Após a criação da view, elabore um script que exiba o resultado da visão,
ordenando o resultado pela quantidade de produtos (em ordem crescente).*/

create view vwCategoria
as
select C.Descr NOME, count(CodProd) QTDE_PRODUTO
from Categorias C join Produtos P
	on C.CodCategoria = P.CodCategoria
group by C.Descr

go

select NOME, QTDE_PRODUTO
from vwCategoria
order by QTDE_PRODUTO 


go

/*b) Obter a média da quantidade de produtos das categorias.*/

select avg(QTDE_PRODUTO) MEDIA
from vwCategoria

/*c) Obter a média do valor total dos pedidos realizados em 1997.*/

select avg(PRECO) MEDIA
from (select sum(Preco * Qtde - Desconto) PRECO, P.NumPed
	  from Pedidos P join DetalhesPed DP
		on P.NumPed = DP.NumPed
	  where year(P.DataPed) = 1997
	  group by P.NumPed) T

go

/*d) Obter o nome do fornecedor que possui a maior quantidade de produtos.*/

select Empresa
from (select Empresa, count(CodProd) QTDE_PROD
	  from Fornecedores F join Produtos P
		 on F.CodFor = P.CodFor
	  group by Empresa)T
where QTDE_PROD = (select max(QTDE_PROD)
				   from (select Empresa, count(CodProd) QTDE_PROD
					     from Fornecedores F join Produtos P
							 on F.CodFor = P.CodFor
					     group by Empresa) T)

go


/*e) Obter o número do pedido de maior valor.*/

select nPed
from (select PED.NumPed nPed, sum(Preco * Qtde - Desconto) Valor
	  from Pedidos PED join DetalhesPed DP
		 on PED.NumPed = DP.NumPed
	  group by PED.NumPed) T
where Valor = (select max(Valor)
			   from (select PED.NumPed nPed, sum(Preco * Qtde - Desconto) Valor
					 from Pedidos PED join DetalhesPed DP
						on PED.NumPed = DP.NumPed
					 group by PED.NumPed) T)


go
/*f) Obter o nome dos fornecedores cuja quantidade de produtos está acima da média da
quantidade de produtos dos fornecedores.*/

create view vwQTDEPROD
as
select Empresa, count(CodProd) QTDE_PROD, F.CodFor
	  from Fornecedores F join Produtos P
		 on F.CodFor = P.CodFor
	  group by Empresa, F.CodFor
go

select Empresa
from vwQTDEPROD
where QTDE_PROD > (select avg(QTDE_PROD)
				   from vwQTDEPROD)
go
/*g) Obter o nome do cliente que comprou a maior quantidade do produto “Tofu”.*/

select Nome
from (select Nome, count(*) QTDE
	  from Clientes C join Pedidos PED
		 on C.CodCli = PED.CodCli join DetalhesPed DP
		 on DP.NumPed = PED.NumPed join Produtos P
		 on P.CodProd = DP.CodProd
	  where Descr like 'Tofu'
	  group by Nome) T
where QTDE = (select max(QTDE)
			  from (select Nome, count(*) QTDE
					from Clientes C join Pedidos PED
						on C.CodCli = PED.CodCli join DetalhesPed DP
						on DP.NumPed = PED.NumPed join Produtos P
						on P.CodProd = DP.CodProd
					where Descr like 'Tofu'
					group by Nome) T)
go
/*h) Obter o nome dos fornecedores que possui a maior quantidade de produtos da
categoria “Bebidas”.*/






/*2. Analise a seguinte consulta e descreva qual o objetivo dessa consulta.
CREATE VIEW vwCliente
AS
SELECT Nome, COUNT(*) AS QTDE
FROM Clientes c
JOIN Pedidos P on C.CodCli = P.CodCli
JOIN DetalhesPed DP on DP.NumPed = P.NumPed
JOIN Produtos PR on PR.CodProd = DP.CodProd
JOIN Categorias C on C.CodCategoria = P.CodCategoria
WHERE C.Descr = 'Bebidas'
GROUP BY Nome
SELECT *
FROM vwCliente
WHERE QTDE = (SELECT MIN(QTDE) FROM vwCliente)
ORDER BY Nome
*/

/*Quem comprou menos bebidas!*/
