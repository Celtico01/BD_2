use SistemaBancario

go

/*Crie uma view para obter o n�mero da conta e a quantidade de contas poupan�as de cada conta.*/

create view vwContaPoupanca
as
select CON_NUMERO, count(CP.CON_CODIGO) QTDE
from tbConta C join tbContaPoupanca CP
	on C.CON_CODIGO = CP.CON_CODIGO
group by CON_NUMERO

/*Obter a m�dia da quantidade de contas poupan�as por conta.*/

select avg(QTDE) MEDIA
from vwContaPoupanca

/*Obter o n�mero da conta que possui a maior quantidade de contas poupan�a.*/

select CON_NUMERO
from vwContaPoupanca
where QTDE = (select max(QTDE) 
		      from vwContaPoupanca)