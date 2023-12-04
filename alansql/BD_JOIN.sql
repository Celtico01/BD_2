CREATE DATABASE BD_JOIN
GO
USE BD_JOIN
GO
CREATE TABLE tbCurso
(
      CUR_CODIGO INT NOT NULL PRIMARY KEY,
      CUR_NOME VARCHAR(50) NOT NULL
)
GO
CREATE TABLE tbProfessor
(
      PRO_CODIGO INT NOT NULL PRIMARY KEY,
      PRO_NOME VARCHAR(50) NOT NULL
)
GO
CREATE TABLE tbDisciplina
(
    DIS_CODIGO INT NOT NULL PRIMARY KEY,
    DIS_NOME VARCHAR(50) NOT NULL,
      PRO_CODIGO INT NULL FOREIGN KEY REFERENCES tbProfessor,
      CUR_CODIGO INT NOT NULL FOREIGN KEY REFERENCES tbCurso
)
GO
insert into tbCurso
VALUES
(1, 'BCC'),
(2, 'Licenciatura em Física')
GO
INSERT INTO tbProfessor VALUES
(1, 'João da Silva'),
(2, 'Maria de Fátima'),
(3, 'Joaquim Alencar'),
(4, 'Maria Aparecida')
GO
INSERT INTO tbDisciplina VALUES
(1, 'Banco de Dados 1', 1, 1),
(2, 'Física Geral', NULL, 2),
(3, 'Programação Orientada a Objetos', 2, 1),
(4, 'Banco de Dados 2', 3, 1)