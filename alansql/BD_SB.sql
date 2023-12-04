CREATE DATABASE SistemaBancario
GO
USE SistemaBancario
GO
CREATE TABLE tbCliente
(
	CLI_CODIGO int not null primary key identity,
	CLI_NOME varchar(50) not null,
	CLI_CPF varchar(15) not null unique,
	CLI_RUA varchar(50) null,
	CLI_NUMERO int null,
	CLI_BAIRRO varchar(50) null,
	CLI_CIDADE varchar(50) null,
	CLI_UF varchar(2) null,
	CLI_TELEFONE varchar(20) null
)
GO
CREATE TABLE tbAgencia
(
	AGE_CODIGO int not null primary key identity,
	AGE_NUMERO varchar(6) not null unique,
	AGE_NOME varchar(50) not null,
	AGE_BAIRRO varchar(50) null,
	AGE_CIDADE varchar(50) not null
)
GO
CREATE TABLE tbConta
(
	CON_CODIGO int not null primary key identity,
	CON_NUMERO varchar(7) not null unique,
	AGE_CODIGO int not null foreign key references tbAgencia (AGE_CODIGO)
)
GO
CREATE TABLE tbContaCliente
(
	CCL_CODIGO int not null primary key identity,
	CON_CODIGO int not null foreign key references tbConta (CON_CODIGO),
	CLI_CODIGO int not null foreign key references tbCliente (CLI_CODIGO)
)
GO
CREATE TABLE tbContaPoupanca
(
	COP_CODIGO int not null primary key identity,
	CON_CODIGO int not null foreign key references tbConta (CON_CODIGO),
	COP_TAXA_RENDIMENTO decimal(10,2) not null,
	CON_OPERACAO int not null
)
GO
CREATE TABLE tbContaCorrente
(
	COC_CODIGO int not null primary key identity,
	CON_CODIGO int not null foreign key references tbConta (CON_CODIGO),
	COC_TAXA_MANUTENCAO decimal(10,2) not null
)
GO
ALTER TABLE tbCliente
DROP COLUMN CLI_BAIRRO
GO
ALTER TABLE tbAgencia
DROP COLUMN AGE_BAIRRO
GO
ALTER TABLE tbAgencia
ADD AGE_UF varchar(2) not null
GO
INSERT INTO tbCliente
VALUES
('Maria Alexandrina Sousa', '012.123.329-93', 'Av. Washington Soares', 1256, 'Fortaleza', 'CE', '(85)9832-2938')
GO
INSERT INTO tbCliente
VALUES
('Marcos Aurélio da Silva', '032.143.343-12', 'Av. Duque de Caxias', 34, 'Fortaleza', 'CE', '(85)3284-4398')
GO
INSERT INTO tbCliente
VALUES
('Antônio de Sousa', '123.324.875-98', 'Av. Bezerra de Menezes', 2375, 'Fortaleza', 'CE', '(85)8127-2387')
GO
INSERT INTO tbCliente
VALUES
('Paulo de Andrade', '874.123.756-23', 'Av. Duque de Caxias', 1003, 'Fortaleza', 'CE', '(85)9923-4837')
GO
INSERT INTO tbCliente
VALUES
('Carlos Eduardo Menezes', '293.765.234-34', 'Av. Rogaciano Leite', 548, 'Fortaleza', 'CE', '(85)3241-2358')
GO
INSERT INTO tbCliente
VALUES
('Estela de Albuquerque', '674.987.534-32', 'Rua Teófilo Pinto', 234, 'Aracati', 'CE', '(88)3421-3459')
GO
INSERT INTO tbCliente
VALUES
('Antônio Soares', '234.423.434-32', 'Rua Cel. Alexandrino', 341, 'Aracati', 'CE', '(88)8934-4398')
GO
INSERT INTO tbCliente
VALUES
('Carla Maria Pereira', '587.434.654-32', 'Rua Joaquim Crisostomo', 123, 'Fortim', 'CE', '(88)8834-2234')
GO
INSERT INTO tbCliente
VALUES
('Manoel Sales', '644.434.435-65', 'Rua Teófilo Pinto', 205, 'Aracati', 'CE', '(88)3421-5986')
GO
INSERT INTO tbCliente
VALUES
('Joaquim Pereira de Albuquerque', '346.546.653-54', 'Av. Duque de Caxias', 343, 'Fortaleza', 'CE', '(85)9834-3455')
GO
INSERT INTO tbCliente
VALUES
('Ana Amélia', '234.234.234-54', 'Av. Duque de Caxias', 343, 'Fortaleza', 'CE', '(85)9834-3455')
GO
INSERT INTO tbCliente
VALUES
('Marcos Paulo', '436.234.234-23', 'Rua Teófilo Pinto', 233, 'Fortaleza', 'CE', '(88)3489-3343')
GO
INSERT INTO tbAgencia
VALUES
('3655', 'Barão de Aracati', 'Fortaleza', 'CE')
GO
INSERT INTO tbAgencia
VALUES
('0121', 'Aracati', 'Aracati', 'CE')
GO
INSERT INTO tbAgencia
VALUES
('4379', 'Fortim', 'Fortim', 'CE')
GO
INSERT INTO tbConta
SELECT '10324-2', (SELECT AGE_CODIGO FROM tbAgencia WHERE AGE_CIDADE = 'Fortaleza')
GO
INSERT INTO tbConta
SELECT '43234-2', (SELECT AGE_CODIGO FROM tbAgencia WHERE AGE_CIDADE = 'Fortaleza')
GO
INSERT INTO tbConta
SELECT '67345-2', (SELECT AGE_CODIGO FROM tbAgencia WHERE AGE_CIDADE = 'Fortaleza')
GO
INSERT INTO tbConta
SELECT '37456-2', (SELECT AGE_CODIGO FROM tbAgencia WHERE AGE_CIDADE = 'Fortaleza')
GO
INSERT INTO tbConta
SELECT '54674-2', (SELECT AGE_CODIGO FROM tbAgencia WHERE AGE_CIDADE = 'Fortaleza')
GO
INSERT INTO tbConta
SELECT '35784-2', (SELECT AGE_CODIGO FROM tbAgencia WHERE AGE_CIDADE = 'Fortaleza')
GO
INSERT INTO tbConta
SELECT '83757-2', (SELECT AGE_CODIGO FROM tbAgencia WHERE AGE_CIDADE = 'Fortaleza')
GO
INSERT INTO tbConta
SELECT '00385-2', (SELECT AGE_CODIGO FROM tbAgencia WHERE AGE_CIDADE = 'Aracati')
GO
INSERT INTO tbConta
SELECT '23475-2', (SELECT AGE_CODIGO FROM tbAgencia WHERE AGE_CIDADE = 'Aracati')
GO
INSERT INTO tbConta
SELECT '43245-2', (SELECT AGE_CODIGO FROM tbAgencia WHERE AGE_CIDADE = 'Fortim')
GO
INSERT INTO tbConta
SELECT '39857-2', (SELECT AGE_CODIGO FROM tbAgencia WHERE AGE_CIDADE = 'Fortim')
GO
INSERT INTO tbConta
SELECT '83755-2', (SELECT AGE_CODIGO FROM tbAgencia WHERE AGE_CIDADE = 'Fortim')
GO
INSERT INTO tbConta
SELECT '23423-2', (SELECT AGE_CODIGO FROM tbAgencia WHERE AGE_CIDADE = 'Aracati')
GO
INSERT INTO tbContaCliente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '10324-2'),
	   (SELECT CLI_CODIGO FROM tbCliente WHERE CLI_CPF = '012.123.329-93')
GO
INSERT INTO tbContaCliente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '10324-2'),
	   (SELECT CLI_CODIGO FROM tbCliente WHERE CLI_CPF = '123.324.875-98')
GO
INSERT INTO tbContaCliente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '10324-2'),
	   (SELECT CLI_CODIGO FROM tbCliente WHERE CLI_CPF = '293.765.234-34')
GO
INSERT INTO tbContaCliente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '43234-2'),
	   (SELECT CLI_CODIGO FROM tbCliente WHERE CLI_CPF = '032.143.343-12')
GO
INSERT INTO tbContaCliente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '67345-2'),
	   (SELECT CLI_CODIGO FROM tbCliente WHERE CLI_CPF = '123.324.875-98')
GO
INSERT INTO tbContaCliente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '37456-2'),
	   (SELECT CLI_CODIGO FROM tbCliente WHERE CLI_CPF = '874.123.756-23')
GO
INSERT INTO tbContaCliente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '54674-2'),
	   (SELECT CLI_CODIGO FROM tbCliente WHERE CLI_CPF = '293.765.234-34')
GO
INSERT INTO tbContaCliente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '54674-2'),
	   (SELECT CLI_CODIGO FROM tbCliente WHERE CLI_CPF = '587.434.654-32')
GO
INSERT INTO tbContaCliente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '35784-2'),
	   (SELECT CLI_CODIGO FROM tbCliente WHERE CLI_CPF = '674.987.534-32')
GO
INSERT INTO tbContaCliente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '83757-2'),
	   (SELECT CLI_CODIGO FROM tbCliente WHERE CLI_CPF = '234.423.434-32')
GO
INSERT INTO tbContaCliente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '00385-2'),
	   (SELECT CLI_CODIGO FROM tbCliente WHERE CLI_CPF = '587.434.654-32')
GO
INSERT INTO tbContaCliente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '00385-2'),
	   (SELECT CLI_CODIGO FROM tbCliente WHERE CLI_CPF = '234.423.434-32')
GO
INSERT INTO tbContaCliente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '00385-2'),
	   (SELECT CLI_CODIGO FROM tbCliente WHERE CLI_CPF = '644.434.435-65')
GO
INSERT INTO tbContaCliente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '00385-2'),
	   (SELECT CLI_CODIGO FROM tbCliente WHERE CLI_CPF = '674.987.534-32')
GO
INSERT INTO tbContaCliente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '23475-2'),
	   (SELECT CLI_CODIGO FROM tbCliente WHERE CLI_CPF = '644.434.435-65')
GO
INSERT INTO tbContaCliente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '43245-2'),
	   (SELECT CLI_CODIGO FROM tbCliente WHERE CLI_CPF = '346.546.653-54')
GO
INSERT INTO tbContaCliente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '39857-2'),
	   (SELECT CLI_CODIGO FROM tbCliente WHERE CLI_CPF = '644.434.435-65')
GO
INSERT INTO tbContaCliente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '83755-2'),
	   (SELECT CLI_CODIGO FROM tbCliente WHERE CLI_CPF = '293.765.234-34')
GO
INSERT INTO tbContaCliente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '23423-2'),
	   (SELECT CLI_CODIGO FROM tbCliente WHERE CLI_CPF = '032.143.343-12')
GO
INSERT INTO tbContaPoupanca
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '10324-2'),
	   0.48, 51
GO
INSERT INTO tbContaPoupanca
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '10324-2'),
	   0.45, 96
GO
INSERT INTO tbContaPoupanca
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '43234-2'),
	   0.43, 96
GO
INSERT INTO tbContaPoupanca
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '67345-2'),
	   0.49, 51
GO
INSERT INTO tbContaPoupanca
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '35784-2'),
	   0.425, 96
GO
INSERT INTO tbContaPoupanca
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '83757-2'),
	   0.49, 51
GO
INSERT INTO tbContaPoupanca
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '00385-2'),
	   0.43, 96
GO
INSERT INTO tbContaPoupanca
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '00385-2'),
	   0.43, 96
GO
INSERT INTO tbContaPoupanca
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '37456-2'),
	   0.41, 96
GO
INSERT INTO tbContaPoupanca
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '54674-2'),
	   0.45, 51
GO
INSERT INTO tbContaPoupanca
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '23475-2'),
	   0.43, 96
GO
INSERT INTO tbContaCorrente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '23475-2'), 11
GO
INSERT INTO tbContaCorrente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '43245-2'), 15
GO
INSERT INTO tbContaCorrente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '39857-2'), 30
GO
INSERT INTO tbContaCorrente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '83755-2'), 23
GO
INSERT INTO tbContaCorrente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '23423-2'), 14
GO
INSERT INTO tbContaCorrente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '10324-2'), 25
GO
INSERT INTO tbContaCorrente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '43234-2'), 13
GO
INSERT INTO tbContaCorrente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '67345-2'), 7
GO
INSERT INTO tbContaCorrente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '37456-2'), 15
GO
INSERT INTO tbContaCorrente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '54674-2'), 23
GO
INSERT INTO tbContaCorrente
SELECT (SELECT CON_CODIGO FROM tbConta WHERE CON_NUMERO = '35784-2'), 11
GO