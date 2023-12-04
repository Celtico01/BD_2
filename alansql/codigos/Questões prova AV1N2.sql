use SistemaBancario

go

/*Crie uma view para obter o número da conta e a quantidade de contas poupanças de cada conta.*/

create view vwContaPoupanca
as
select CON_NUMERO, count(CP.CON_CODIGO) QTDE
from tbConta C join tbContaPoupanca CP
	on C.CON_CODIGO = CP.CON_CODIGO
group by CON_NUMERO

/*Obter a média da quantidade de contas poupanças por conta.*/

select avg(QTDE) MEDIA
from vwContaPoupanca

/*Obter o número da conta que possui a maior quantidade de contas poupança.*/

select CON_NUMERO
from vwContaPoupanca
where QTDE = (select max(QTDE) 
		      from vwContaPoupanca)