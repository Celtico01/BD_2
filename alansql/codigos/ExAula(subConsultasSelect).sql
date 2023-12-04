use Empresa

/*1. Obter o nome do cliente, a quantidade de pedidos realizada
pelo cliente e a quantidade de produtos que o cliente comprou.*/


select C.Nome,
(select count(*) from Pedidos PED where PED.CodCli = C.CodCli) QTDE_PEDIDOS,
(select count(*) from DetalhesPed DP join Pedidos PED_2
    on DP.NumPed = PED_2.NumPed
where C.CodCli = PED_2.CodCli) QTDE_PRODUTOS
from Clientes C

go

/*2. Obter cada fornecer, a quantidade de produtos descontinuados
e a quantidade de produtos “não” descontinuados de cada
fornecedor.*/

select Empresa,
(select count(*) 
from Produtos P
where P.Descontinuado = 1 and
	  P.CodFor = F.CodFor) PRODUTOS_DESCONTINUADOS,
(select count(*)
from Produtos P
where P.Descontinuado = 0 and
	  P.CodFor = F.CodFor) PRODUTOS_NÃO_DESCONTINUADOS
from Fornecedores F
group by Empresa, CodFor


/*3. Obter o número de cada pedido, a quantidade de produtos do
pedido e qual a categoria que teve mais produtos em cada pedido.*/

go

create view vwQTDE_PRO_CAT
as
select count(*) QTDE, C.Descr DESCR_CAT, PED.NumPed NUMPED, C.CodCategoria COD
from Categorias C join Produtos P
	on C.CodCategoria = P.CodCategoria join DetalhesPed DP
	on DP.CodProd = P.CodProd join Pedidos PED
	on PED.NumPed = DP.NumPed
group by C.CodCategoria, C.Descr, PED.NumPed

go

select NumPed, 
(select count(*) 
from DetalhesPed DP
where DP.NumPed = PED.NumPed) QTDE_PRODUTOS,

-- todo!
(select STRING_AGG(VW.DESCR_CAT, ', ')
from vwQTDE_PRO_CAT VW
where PED.NumPed = VW.NUMPED and VW.QTDE = (select max(QTDE)
											from vwQTDE_PRO_CAT VW_D
											where VW.NumPed = VW_D.NUMPED)) CAT
from Pedidos PED
group by PED.NumPed


/*4. Obter o nome do funcionário, e os seguintes dados relacionados a atendimento do funcionario: 
a quantidade de pedidos, o valor total dos pedidos, a comissão (10% do valor total dos pedidos), 
o valor total do frete dos pedido e a quantidade de clientes.*/

alter view vwPEDIDOS
as
select count(*) QTDE_PED, sum(DP.Preco * DP.Qtde - DP.Desconto) PRECO_PED, sum(PED.Frete) VALOR_FRETE, F.CodFor CODFOR, PED.CodCli CODCLI
from Pedidos PED join DetalhesPed DP
	on PED.NumPed = DP.NumPed join Produtos PRO
	on PRO.CodProd = DP.CodProd join Fornecedores F
	on F.CodFor = PRO.CodFor
group by F.CodFor, PED.NumPed, PED.CodCli

select Empresa,

(select VW.QTDE_PED
from vwPEDIDOS VW
where VW.CODFOR = F.CodFor) QTDE_PEDIDOS,

(select VW.PRECO_PED
from vwPEDIDOS VW
where VW.CODFOR = F.CodFor) PRECO_TOTAL,

(select VW.PRECO_PED * 0.1
from vwPEDIDOS VW
where VW.CODFOR = F.CodFor) COMISSAO,

(select VW.VALOR_FRETE
from vwPEDIDOS VW
where VW.CODFOR = F.CodFor) PRECO_TOTAL_FRETE,

--todo

(select count(C.CodCli)
 from Clientes C join vwPEDIDOS VW
	on C.CodCli = VW.CODCLI
where VW.CODFOR = F.CodFor
group by VW.CODCLI) CLI

--
from Fornecedores F