CREATE DATABASE projetos

USE projetos

CREATE TABLE projects (
id					INT				NOT NULL	IDENTITY(10001,1),
nome				VARCHAR(45)		NOT NULL,
descricao			VARCHAR(45),
dataproj			DATE			NOT NULL	CHECK(dataproj > '20140901'),
PRIMARY KEY (id)
)


CREATE TABLE users (
id					INT				NOT NULL	IDENTITY,
nome				VARCHAR(45)		NOT NULL,
nomeusuario			VARCHAR(45)		NOT NULL	UNIQUE,
senha				VARCHAR(45)		DEFAULT('123mudar'),
email				VARCHAR(45),
PRIMARY KEY (id)
)

EXEC sp_help users



CREATE TABLE user_has_projects(
users_id		INT		NOT NULL,
projects_id		INT		NOT NULL,
FOREIGN KEY (users_id) REFERENCES users(id),
FOREIGN KEY (projects_id) REFERENCES projects(id),
PRIMARY KEY(users_id, projects_id)
)


ALTER TABLE users
DROP CONSTRAINT UQ__users__CBB6AA364D3259FA

ALTER TABLE users
ALTER COLUMN nomeusuario VARCHAR(10)
ALTER TABLE users
ADD CONSTRAINT UQ_users_NomeUsuario UNIQUE (nomeusuario)

ALTER TABLE users
ALTER COLUMN senha	 VARCHAR(8)

EXEC sp_help users

INSERT INTO users(nome, nomeusuario, email)
VALUES('Maria', 'Rh_maria', 'maria@empresa.com')

INSERT INTO users(nome, nomeusuario, senha, email)
VALUES('Paulo', 'Ti_paulo', '123@456', 'paulo@empresa.com')

INSERT INTO users(nome, nomeusuario, email)
VALUES('Ana', 'Rh_ana', 'ana@empresa.com')

INSERT INTO users(nome, nomeusuario, email)
VALUES('Clara', 'Ti_clara', 'clara@empresa.com')

INSERT INTO users(nome, nomeusuario, senha, email)
VALUES('Aparecido', 'Rh_apareci', '55@!cido', 'aparecido@empresa.com')


INSERT INTO projects(nome, descricao, dataproj)
VALUES('Re-folha', 'Refatoração das Folhas', '2014-09-05')

INSERT INTO projects(nome, descricao, dataproj)
VALUES('Manutenção PCs', 'Manutenção PCs', '2014-09-06')

INSERT INTO projects(nome, dataproj)
VALUES('Auditoria', '2014-09-07')

INSERT INTO user_has_projects(users_id, projects_id)
VALUES(1, 10001)

INSERT INTO user_has_projects(users_id, projects_id)
VALUES(5, 10001)

INSERT INTO user_has_projects(users_id, projects_id)
VALUES(3, 10003)

INSERT INTO user_has_projects(users_id, projects_id)
VALUES(4, 10002)

INSERT INTO user_has_projects(users_id, projects_id)
VALUES(2, 10002)

UPDATE projects
SET dataproj = '2014-09-12'
WHERE id = 10002
SELECT * FROM projects

UPDATE users
SET nomeusuario = 'Rh_cido'
WHERE nome = 'Aparecido'

UPDATE users
SET senha = '888@*'
WHERE (nomeusuario = 'Rh_maria' AND senha = '123mudar')
SELECT * FROM users

DELETE FROM user_has_projects WHERE users_id = 2
SELECT * FROM user_has_projects

