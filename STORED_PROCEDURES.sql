/* STORED PROCEDORES */

/* ESTRUTURA DE UM PROCEDURE

DELIMITER $

CREATE PROCEDURE NOME ()
BEGIN 
	QUALQUER PROGRAMACAO;
END
$

DELIMITER ;	
*/

** CRIANDO PROCEDURE SEM PARAMETRO **

/* REQUISITO: TODA VEZ QUE ALGUEM LOGAR NO BANCO DEVERÁ TRAZER O NOME DA EMPRESA */
DELIMITER $

CREATE PROCEDURE NOME_EMPRESA()
BEGIN
	SELECT 'EMPRESA DOS PROGRAMADORES' AS EMPRESA;
END
$

DELIMITER ;

/* CHAMANDO UMA PROCEDURE */
CALL NOME_EMPRESA();
+---------------------------+
| EMPRESA                   |
+---------------------------+
| EMPRESA DOS PROGRAMADORES |
+---------------------------+


/* ** APAGANDO PROCEDURE ** */
DROP PROCEDURE CONTA;

/* ** CRIANDO PROCEDURE COM PARAMETRO ***/

DELIMITER $

CREATE PROCEDURE SOMA(NUMERO1 INT, NUMERO2 INT)
BEGIN
	SELECT NUMERO1 + NUMERO2 AS SOMA;
END
$

DELIMITER ;

CALL SOMA(10,2);

/* ******************************** PROCEDURE NO MUNDO REAL ********************************* */
CREATE DATABASE PROJETO;
USE PROJETO;

/* SERÁ CRIADO UMA TABELA DE CURSOS BASICO APENAS PARA UTILIZAÇÃO DA PROCEDURE*/
CREATE TABLE CURSOS (
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR (30) NOT NULL,
	HORAS INT (3) NOT NULL,
	VALOR FLOAT (10,2) NOT NULL
);

/* TABELA CRIADA */
+-------------------+
| Tables_in_projeto |
+-------------------+
| cursos            |
+-------------------+

/* CONFERIR TABELA */
DESC CURSOS;
+---------+-------------+------+-----+---------+----------------+
| Field   | Type        | Null | Key | Default | Extra          |
+---------+-------------+------+-----+---------+----------------+
| IDCURSO | int         | NO   | PRI | NULL    | auto_increment |
| NOME    | varchar(30) | NO   |     | NULL    |                |
| HORAS   | int         | NO   |     | NULL    |                |
| VALOR   | float(10,2) | NO   |     | NULL    |                |
+---------+-------------+------+-----+---------+----------------+


/* INSERINDO DADOS NA TABELA */
INSERT INTO CURSOS (NOME, HORAS, VALOR) VALUES ('CURSO DE POO', 30, 30.00);
INSERT INTO CURSOS (NOME, HORAS, VALOR) VALUES ('CURSO DE JAVA', 60, 300.00);
INSERT INTO CURSOS (NOME, HORAS, VALOR) VALUES ('CURSO DE VBA', 90, 380.00);
INSERT INTO CURSOS (NOME, HORAS, VALOR) VALUES ('CURSO DE C++', 120, 100.00);
INSERT INTO CURSOS (NOME, HORAS, VALOR) VALUES ('CURSO DE PHP', 150, 500.00);

/* CONFERIR DADOS INSERIDOS*/
SELECT * FROM CURSOS;
+---------+---------------+-------+--------+
| IDCURSO | NOME          | HORAS | VALOR  |
+---------+---------------+-------+--------+
|       1 | CURSO DE POO  |    30 |  30.00 |
|       2 | CURSO DE JAVA |    60 | 300.00 |
|       3 | CURSO DE VBA  |    90 | 380.00 |
|       4 | CURSO DE C++  |   120 | 100.00 |
|       5 | CURSO DE PHP  |   150 | 500.00 |
+---------+---------------+-------+--------+

/* VAMOS CADASTRAR 2 PROCEDURES: 1-CADASTRAR - 2- LER DADOS */

/* CADASTRAR */
DELIMITER $
CREATE PROCEDURE CADASTRAR_CURSOS(P_NOME VARCHAR(30), 
								  P_HORAS INT, 
								  P_VALOR FLOAT(10,2))
BEGIN
	INSERT INTO CURSOS (NOME, HORAS, VALOR) VALUES ( P_NOME, P_HORAS, P_VALOR);
END
$
DELIMITER ;

/* USAR PROCEDURE CADASTRAR_CURSOS */
CALL CADASTRAR_CURSOS('CURSO TI', 166, 1.200); 

/* CONFERIR DADO INSERIDO*/
SELECT * FROM CURSOS
WHERE IDCURSO = 6;
+---------+----------+-------+-------+
| IDCURSO | NOME     | HORAS | VALOR |
+---------+----------+-------+-------+
|       6 | CURSO TI |   166 |  1.20 |
+---------+----------+-------+-------+