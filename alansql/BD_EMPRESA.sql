CREATE DATABASE BD_Empresa;

USE BD_Empresa;

CREATE TABLE tbDepartamento
(
    DEP_CODIGO INT NOT NULL PRIMARY KEY,
    DEP_NOME VARCHAR(50) NOT NULL
);

CREATE TABLE tbFuncionario
(
    FUN_CODIGO INT NOT NULL PRIMARY KEY,
    FUN_NOME VARCHAR(50) NOT NULL,
    FUN_SALARIO DECIMAL(10,2) NOT NULL,
    FUN_CARGO VARCHAR(50) NOT NULL,
    DEP_CODIGO INT NOT NULL,
    FOREIGN KEY (DEP_CODIGO) REFERENCES tbDepartamento (DEP_CODIGO)
);

INSERT INTO tbDepartamento
VALUES 
(1, 'Almoxarifado'),
(2, 'Administração');

INSERT INTO tbFuncionario
VALUES
(1, 'Antônio Dias', 1250, 'Limpeza', 1),
(2, 'Augusto Nascimento', 3500, 'Gerente', 1),
(3, 'Paulo Viegas', 2450, 'Coordenador', 2),
(4, 'José Antônio', 2350, 'Auxiliar', 2),
(5, 'Maria Esmeralda', 2350, 'Coordenador', 1);

SELECT * FROM tbDepartamento;
SELECT * FROM tbFuncionario;