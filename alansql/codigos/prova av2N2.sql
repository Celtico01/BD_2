CREATE DATABASE Locadora
GO
USE Locadora
GO
CREATE TABLE tbFuncionario
(
	FUN_CODIGO INT NOT NULL PRIMARY KEY IDENTITY,
	FUN_NOME VARCHAR(50) NOT NULL,
	FUN_CPF VARCHAR(14) NOT NULL UNIQUE
)
CREATE TABLE tbCategoria
(
	CAT_CODIGO INT NOT NULL PRIMARY KEY IDENTITY,
	CAT_NOME VARCHAR(50) NOT NULL,
	CAT_VALOR DECIMAL(10,2) NOT NULL
)
CREATE TABLE tbFilme
(
	FIL_CODIGO int not null primary key identity,
	FIL_NOME varchar(50) not null unique,
	CAT_CODIGO INT NOT NULL FOREIGN KEY REFERENCES tbCategoria (CAT_CODIGO)
)
GO
CREATE TABLE tbCliente
(
	CLI_CODIGO INT NOT NULL PRIMARY KEY IDENTITY,
	CLI_NOME VARCHAR(50) NOT NULL,
	CLI_TELEFONE VARCHAR(13) NOT NULL,
	CLI_ESTRELAS INT NOT NULL
)
GO
CREATE TABLE tbLocacao
(
	LOC_CODIGO int not null primary key identity,
	LOC_DATA datetime not null,
	FUN_CODIGO int not null foreign key references tbFuncionario (FUN_CODIGO),
	CLI_CODIGO INT NOT NULL FOREIGN KEY REFERENCES tbCliente (CLI_CODIGO),
)
GO
CREATE TABLE tbFilmeLocacao
(
	FLC_CODIGO INT NOT NULL PRIMARY KEY IDENTITY,
	FIL_CODIGO INT NOT NULL FOREIGN KEY REFERENCES tbFilme (FIL_CODIGO),
	LOC_CODIGO INT NOT NULL FOREIGN KEY REFERENCES tbLocacao (LOC_CODIGO) ON DELETE CASCADE,
	FLC_VALOR DECIMAL(10,2) NOT NULL
)
GO
CREATE TABLE tbDevolucao
(
	DEV_CODIGO INT NOT NULL PRIMARY KEY IDENTITY,
	CLI_CODIGO INT NOT NULL FOREIGN KEY REFERENCES tbCliente (CLI_CODIGO),
	FIL_CODIGO INT NOT NULL FOREIGN KEY REFERENCES tbFilme (FIL_CODIGO),
	FUN_CODIGO INT NULL FOREIGN KEY REFERENCES tbFuncionario (FUN_CODIGO),
	DEV_DATA_PREVISTA DATETIME NOT NULL,
	DEV_DATA_ENTREGA DATETIME NULL,
	DEV_MULTA DECIMAL(10,2)
)
GO
CREATE TABLE tbCaixa
(
	CAX_CODIGO INT NOT NULL PRIMARY KEY IDENTITY,
	CAX_DATA DATETIME NOT NULL,
	CAX_VALOR DECIMAL(10,2) NOT NULL
)
CREATE TABLE tbComissaoMes
(
	CMM_CODIGO INT NOT NULL PRIMARY KEY IDENTITY,
	FUN_CODIGO INT NOT NULL FOREIGN KEY REFERENCES tbFuncionario (FUN_CODIGO),
	FUN_MES DATETIME NOT NULL,
	FUN_VALOR DECIMAL(10,2)
)
GO
INSERT INTO tbCategoria VALUES ('Diamante', 6)

INSERT INTO tbCategoria VALUES ('Ouro', 5)

INSERT INTO tbCategoria VALUES ('Prata', 4)

INSERT INTO tbCategoria VALUES ('Bronze', 3)

INSERT INTO tbFilme SELECT 'A Lista de Schindler', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Ouro')

INSERT INTO tbFilme SELECT '12 Anos de Escravi‹o', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Ouro')

INSERT INTO tbFilme SELECT 'Coração Valente', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Ouro')

INSERT INTO tbFilme SELECT 'O Pianista', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Ouro')

INSERT INTO tbFilme SELECT 'Argo', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Ouro')

INSERT INTO tbFilme SELECT 'Cavalo de Guerra', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Diamante')

INSERT INTO tbFilme SELECT 'Duelo de Titãs', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Diamante')

INSERT INTO tbFilme SELECT 'O òltimo Samurai', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Diamante')

INSERT INTO tbFilme SELECT '300', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Diamante')

INSERT INTO tbFilme SELECT 'A Queda - As òltimas Horas de Hitler', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Diamante')

INSERT INTO tbFilme SELECT 'A Outra', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Diamante')

INSERT INTO tbFilme SELECT 'O Discurso do Rei', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Diamante')

INSERT INTO tbFilme SELECT 'Diários de Motocicleta', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Prata')

INSERT INTO tbFilme SELECT 'Hotel Ruanda', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Prata')

INSERT INTO tbFilme SELECT 'Água para Elefantes', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Prata')

INSERT INTO tbFilme SELECT 'O Amante da Rainha', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Prata')

INSERT INTO tbFilme SELECT 'A Paix‹o de Cristo', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Prata')

INSERT INTO tbFilme SELECT 'No', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Bronze')

INSERT INTO tbFilme SELECT 'Invictus', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Bronze')

INSERT INTO tbFilme SELECT 'O Filho de Deus', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Bronze')

INSERT INTO tbFilme SELECT 'O Patriota', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Bronze')

INSERT INTO tbFilme SELECT 'Gandhi', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Bronze')

INSERT INTO tbFilme SELECT 'Amistad', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Bronze')

INSERT INTO tbFilme SELECT 'Cruzada', 
(SELECT CAT_CODIGO FROM tbCategoria WHERE CAT_NOME = 'Bronze')

INSERT INTO tbFuncionario VALUES ('Marcos AurŽlio', '001.001.001-01')

INSERT INTO tbFuncionario VALUES ('Jana’na Andrade', '002.002.002-02')

INSERT INTO tbFuncionario VALUES ('Augusto CŽsar', '003.003.003-03')

INSERT INTO tbCliente VALUES ('Carolina Andrade', '(88)9999-9999', 0)

INSERT INTO tbCliente VALUES ('Maria Julieta', '(88)8888-8888', 0)

INSERT INTO tbCliente VALUES ('JosŽ Carlos', '(88)8822-2211', 0)

INSERT INTO tbCliente VALUES ('Jo‹o Ananias', '(88)9932-2332', 0)

INSERT INTO tbCliente VALUES ('Pedro Silva', '(88)8374-3255', 0)


go

use Locadora

/*Obtenha o nome do funcionário, o somatório de comissão do funcionário e a quantidade de locações realizadas pelo funcionário.*/

select FUN.FUN_NOME NOME_DO_FUNCIONARIO,

(select sum(CMS.FUN_VALOR)
from tbComissaoMes CMS
where CMS.FUN_CODIGO = FUN.FUN_CODIGO) SOMATORIO_DA_COMISSAO,

(select count(*)
from tbLocacao LOC
where LOC.FUN_CODIGO = FUN.FUN_CODIGO) QUANTIDADE_DE_LOCAÇÕES

from tbFuncionario FUN

go

/*Obtenha o nome do cliente, 
o status representado pelas estrelas, 
a quantidade de locações realizadas, 
a quantidade de filmes locados e 
o somatório do valor dos filmes locados. 
Ordene o resultado pelo nome do cliente.*/

select CLI.CLI_NOME NOME_DO_CLIENTE,
CLI.CLI_ESTRELAS STATUS_DO_CLIENTE,

(select count(*)
from tbLocacao LOC
where LOC.CLI_CODIGO = CLI.CLI_CODIGO) QUANTIDADE_DE_LOCAÇÕES,

(select count(*)
from tbFilmeLocacao FIL join tbLocacao LOC_2
	on FIL.LOC_CODIGO = LOC_2.LOC_CODIGO
where LOC_2.CLI_CODIGO = CLI.CLI_CODIGO) QUANTIDADE_DE_FILMES_LOCADOS,

(select sum(FIL_2.FLC_VALOR)
from tbFilmeLocacao FIL_2 join tbLocacao LOC_3
	on FIL_2.LOC_CODIGO = LOC_3.LOC_CODIGO
where LOC_3.CLI_CODIGO = CLI.CLI_CODIGO) SOMATORIO_DO_VALOR_DOS_FILMES

from tbCliente CLI
order by CLI.CLI_NOME


/*Obtenha o nome de cada filme da categoria Ouro,  
assim como os seguintes dados para cada filme: 
a quantidade de locações, 
a quantidade de devoluções, 
assim como o valor total pago nas locações do filme. 
Ordene o resultado pelo nome do filme.*/

select FIL_S.FIL_NOME NOME_DO_FILME,

(select count(*) 
from tbFilmeLocacao FLC
where FLC.FIL_CODIGO = FIL_S.FIL_CODIGO) QUANTIDADE_DE_LOCAÇÕES,

(select count(*)
from tbDevolucao DEV
where DEV.FIL_CODIGO = FIL_S.FIL_CODIGO) QUANTIDADE_DE_DEVOLUÇÕES,

(select sum(FLC.FLC_VALOR)
from tbFilmeLocacao FLC
where FLC.FIL_CODIGO = FIL_S.FIL_CODIGO) VALOR_TOTAL_DAS_LOCAÇÕES

from tbFilme FIL_S join tbCategoria CAT_S
	on FIL_S.CAT_CODIGO = CAT_S.CAT_CODIGO
where CAT_S.CAT_NOME = 'Ouro'
order by FIL_S.FIL_NOME
