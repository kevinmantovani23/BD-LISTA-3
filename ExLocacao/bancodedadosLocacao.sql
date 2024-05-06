CREATE DATABASE locadora

USE locadora

CREATE TABLE filme(
id			INT				NOT NULL	IDENTITY(1001,1),
titulo		VARCHAR(40)		NOT NULL,
ano			INT				NOT NULL	CHECK(ano <= 2021),
PRIMARY KEY(id)
)
EXEC sp_help filme

CREATE TABLE dvd(
num					INT		NOT NULL	IDENTITY(10001,1),
data_fabricacao		DATE	NOT NULL	CHECK(data_fabricacao < GETDATE()),
filmeID				INT		NOT NULL,
FOREIGN KEY (filmeID) REFERENCES filme(id),
PRIMARY KEY (num)
)
EXEC sp_help dvd

CREATE TABLE estrela(
id		INT				NOT NULL	IDENTITY(9901,1),
nome	VARCHAR(50)		NOT NULL,
PRIMARY KEY (id)
)
EXEC sp_help estrela

CREATE TABLE filme_estrela(
filmeID		INT		NOT NULL,
estrelaID	INT		NOT NULL,
FOREIGN KEY (filmeID) REFERENCES filme(id),
FOREIGN KEY (estrelaID) REFERENCES estrela(id),
PRIMARY KEY (filmeID, estrelaID)
)
EXEC sp_help filme_estrela

CREATE TABLE cliente(
num_cadastro	INT		NOT NULL	IDENTITY(5501,1),
nome			VARCHAR(70),
logradouro		VARCHAR(150),
num				INT				CHECK(num >= 0),
cep				CHAR(8)			CHECK(LEN(cep) = 8),
PRIMARY KEY(num_cadastro)
)
EXEC sp_help cliente

CREATE TABLE locacao(
dvdNum					INT				NOT NULL,
clienteNum_cadastro		INT				NOT NULL,
data_locacao			DATE			DEFAULT(GETDATE()),
data_devolucao			DATE			NOT NULL,
valor					DECIMAL(7,2)	NOT NULL	CHECK(valor >= 0),
CONSTRAINT CHK_locacao_datadevolucao CHECK(
	(data_devolucao > data_locacao)
),
FOREIGN KEY (dvdNum) REFERENCES dvd(num),
FOREIGN KEY (clienteNum_cadastro) REFERENCES cliente(num_cadastro),
PRIMARY KEY (data_locacao, dvdNum, clienteNum_cadastro)
)
EXEC sp_help locacao

ALTER TABLE estrela
ADD nomereal VARCHAR(50)

EXEC sp_help estrela

ALTER TABLE filme
ALTER COLUMN titulo VARCHAR(80)

EXEC sp_help filme

INSERT INTO filme(titulo, ano)
VALUES('Whiplash', 2015)

INSERT INTO filme(titulo, ano)
VALUES('Birdman', 2015)

INSERT INTO filme(titulo, ano)
VALUES('Interestelar', 2014)

INSERT INTO filme(titulo, ano)
VALUES('A Culpa é das estrelas', 2014)

INSERT INTO filme(titulo, ano)
VALUES('Alexandre e o Dia Terrível, Horrível, Espantoso e Horroroso', 2014)

INSERT INTO filme(titulo, ano)
VALUES('Sing', 2016)


INSERT INTO estrela(nome, nomereal)
VALUES('Michael Keaton', 'Michael John Douglas')

INSERT INTO estrela(nome, nomereal)
VALUES('Emma Stone', 'Emily Jean Stone')

INSERT INTO estrela(nome)
VALUES('Miles Teller')

INSERT INTO estrela(nome, nomereal)
VALUES('Steve Carell', 'Steven John Carell')

INSERT INTO estrela(nome, nomereal)
VALUES('Jennifer Garner', 'Jennifer Anne Garner')



INSERT INTO filme_estrela(filmeID, estrelaID)
VALUES(1002, 9901)

INSERT INTO filme_estrela(filmeID, estrelaID)
VALUES(1002, 9902)

INSERT INTO filme_estrela(filmeID, estrelaID)
VALUES(1001, 9903)

INSERT INTO filme_estrela(filmeID, estrelaID)
VALUES(1005, 9904)

INSERT INTO filme_estrela(filmeID, estrelaID)
VALUES(1005, 9905)



INSERT INTO dvd(data_fabricacao, filmeID)
VALUES('2020-12-02', 1001)

INSERT INTO dvd(data_fabricacao, filmeID)
VALUES('2019-10-18', 1002)

INSERT INTO dvd(data_fabricacao, filmeID)
VALUES('2020-04-03', 1003)

INSERT INTO dvd(data_fabricacao, filmeID)
VALUES('2020-12-02', 1001)

INSERT INTO dvd(data_fabricacao, filmeID)
VALUES('2019-10-18', 1004)

INSERT INTO dvd(data_fabricacao, filmeID)
VALUES('2020-04-03', 1002)

INSERT INTO dvd(data_fabricacao, filmeID)
VALUES('2020-12-02', 1005)

INSERT INTO dvd(data_fabricacao, filmeID)
VALUES('2019-10-18', 1002)

INSERT INTO dvd(data_fabricacao, filmeID)
VALUES('2020-04-03', 1003)


INSERT INTO cliente(nome, logradouro, num, cep)
VALUES('Matilde Luz', 'Rua Síria', 150, '03086040')

INSERT INTO cliente(nome, logradouro, num, cep)
VALUES('Carlos Carreiro', 'Rua Bartolomeu Aires', 1250, '04419110')

INSERT INTO cliente(nome, logradouro, num)
VALUES('Daniel Ramalho', 'Rua Itajutiba', 169)

INSERT INTO cliente(nome, logradouro, num)
VALUES('Roberta Bento', 'Rua Jayme Von Rosenburg', 36)

INSERT INTO cliente(nome, logradouro, num, cep)
VALUES('Rosa Cerqueira', 'Rua Arnaldo Simões Pinto', 235, '02917110')



INSERT INTO locacao(dvdNum, clienteNum_cadastro, data_locacao, data_devolucao, valor)
VALUES(10001, 5502, '2021-02-18', '2021-02-21', 3.50)

INSERT INTO locacao(dvdNum, clienteNum_cadastro, data_locacao, data_devolucao, valor)
VALUES(10009, 5502, '2021-02-18', '2021-02-21', 3.50)

INSERT INTO locacao(dvdNum, clienteNum_cadastro, data_locacao, data_devolucao, valor)
VALUES(10002, 5503, '2021-02-18', '2021-02-19', 3.50)

INSERT INTO locacao(dvdNum, clienteNum_cadastro, data_locacao, data_devolucao, valor)
VALUES(10002, 5505, '2021-02-20', '2021-02-23', 3.00)

INSERT INTO locacao(dvdNum, clienteNum_cadastro, data_locacao, data_devolucao, valor)
VALUES(10004, 5505, '2021-02-20', '2021-02-23', 3.00)

INSERT INTO locacao(dvdNum, clienteNum_cadastro, data_locacao, data_devolucao, valor)
VALUES(10005, 5505, '2021-02-20', '2021-02-23', 3.00)

INSERT INTO locacao(dvdNum, clienteNum_cadastro, data_locacao, data_devolucao, valor)
VALUES(10001, 5501, '2021-02-24', '2021-02-26', 3.50)

INSERT INTO locacao(dvdNum, clienteNum_cadastro, data_locacao, data_devolucao, valor)
VALUES(10008, 5501, '2021-02-24', '2021-02-26', 3.50)


UPDATE cliente
SET cep = '08411150'
WHERE num_cadastro = 5503

UPDATE cliente
SET cep = '02918190'
WHERE num_cadastro = 5504

UPDATE locacao
SET valor = 3.25
WHERE (clienteNum_cadastro = 5502 AND data_locacao = '2021-02-18')

UPDATE locacao
SET valor = 3.10
WHERE (clienteNum_cadastro = 5501 AND data_locacao = '2021-02-24')

UPDATE dvd
SET data_fabricacao = '2019-07-14'
WHERE num = 10005

UPDATE estrela
SET nomereal = 'Miles Alexander Teller'
WHERE nome = 'Miles Teller'

DELETE FROM filme WHERE titulo = 'Sing'


SELECT * FROM filme
WHERE ano = 2014

SELECT id, ano FROM filme
WHERE titulo = 'Birdman'

SELECT id, ano FROM filme
WHERE titulo LIKE '%plash'

SELECT id, nome, nomereal FROM estrela
WHERE nome LIKE 'Steve%'

SELECT filmeID, 
CONVERT(CHAR(12), data_fabricacao, 103) as fab FROM dvd
WHERE data_fabricacao >= '2020-01-01'

SELECT dvdNum, data_locacao, data_devolucao, valor,
valorMulta = valor + 2 FROM locacao
WHERE clienteNum_cadastro = 5505

SELECT logradouro, num, cep FROM cliente
WHERE nome = 'Matilde Luz'

SELECT nomereal FROM estrela
WHERE nome = 'Michael Keaton'

SELECT num_cadastro, nome, 
logradouro + ' ' + CONVERT(VARCHAR(5), num) + ' | ' + cep as end_comp FROM cliente
WHERE num_cadastro >= 5503