/* ENTENDENDO TRIGGERS */

/*CRIANDO UMA DATABASE PARA TESTE*/

CREATE DATABASE AULA40;
USE AULA40;

CREATE TABLE USUARIO (
	IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR (30),
	LOGIN VARCHAR (30), 
	SENHA VARCHAR(100)
);

CREATE TABLE BKP_USUARIO (
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDUSUARIO INT,
	NOME VARCHAR (30), 
	LOGIN VARCHAR (30)
);


/* DESENVOLVENDO A TRIGGER*/

/* PRIMEIRO TROQUE O DELIMITADOR ";"*/
DELIMITER $


/* ESTRUTURA DE UMA TRIGGER */
CREATE TRIGGER NOME
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABELA
FOR EACH ROW (PARA CADA LINHA)
BEGIN -> INICIO

	QUALQUER COMANDO SQL

END -> FIM	

/* EXPLICANDO ESTRUTURA TRIGGER*/
/* DML */
BEFORE -> ANTES
AFTER  -> DEPOIS
NEW    -> NOVO = ("INSERT" // ("UPDATE ENTRA NEW E SAI OLD"))
OLD    -> VELHO = ("DELETE")


/* CRIANDO A TRIGGER PARA REALIZAR O BACKUP SEMPRE QUE UM REGISTRO FOR APAGADO */
CREATE TRIGGER BKP_USUARIO
BEFORE DELETE ON USUARIO
FOR EACH ROW 
BEGIN
	
	INSERT INTO BKP_USUARIO VALUES
	(NULL, OLD.IDUSUARIO, OLD.NOME, OLD.LOGIN);

END $

/* INSERT USUARIOS*/
INSERT INTO USUARIO VALUES (NULL, "WESLLEY ROCHA", "ROCHA", "123");
INSERT INTO USUARIO VALUES (NULL, "BIANCA ROCHA", "BIA", "XEXACAMPEAO");

+-----------+---------------+-------+-------------+
| IDUSUARIO | NOME          | LOGIN | SENHA       |
+-----------+---------------+-------+-------------+
|         1 | WESLLEY ROCHA | ROCHA | 123         |
|         2 | BIANCA ROCHA  | BIA   | XEXACAMPEAO |
+-----------+---------------+-------+-------------+

/* DELETAR USUARIO */
SELECT * FROM USUARIO
WHERE IDUSUARIO = 1;

DELETE FROM USUARIO WHERE IDUSUARIO = 1;

/* APOS DELETER, VAMOS DAR UM SELECT NA TABELA BACKUP*/
SELECT * FROM BKP_USUARIO;

+----------+-----------+---------------+-------+
| IDBACKUP | IDUSUARIO | NOME          | LOGIN |
+----------+-----------+---------------+-------+
|        1 |         1 | WESLLEY ROCHA | ROCHA |
+----------+-----------+---------------+-------+

