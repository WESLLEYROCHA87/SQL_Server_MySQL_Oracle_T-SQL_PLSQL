/* COMUNICACAO ENTRE BANCOS */

CREATE DATABASE LOJA;
USE LOJA;

CREATE TABLE PRODUTO (
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR (30),
	VALOR FLOAT (10,2)
);

CREATE DATABASE BACKUP;
USE BACKUP;

CREATE TABLE BKP_PRODUTO (
	IDBPK INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT, 
	NOME VARCHAR (30),
	VALOR FLOAT (10,2)
);

/* ACESSAR O BANCO LOJA*/
USE LOJA;

/* TENTAR INSERIR UM ITEM NO BKP_PRODUTO DE DENTRO DO BD LOJA*/
/*INSERT INTO BKP_PRODUTO VALUES (NULL, 1000, 'TESTE', 0.0);*/
/*ERROR 1146 (42S02): Table 'loja.bkp_produto' doesn't exist*/

/* A FORMA CORRETA PARA REALIZAR TAL OPERAÇÃO É A SEGRUINTE:
NOME DO BANCO.NOME DA TABELA
 */
INSERT INTO BACKUP.BKP_PRODUTO VALUES (NULL, 1000, 'TESTE', 0.0);

/* CONFERIR */
SELECT * FROM BACKUP.BKP_PRODUTO;
+-------+-----------+-------+-------+
| IDBPK | IDPRODUTO | NOME  | VALOR |
+-------+-----------+-------+-------+
|     1 |      1000 | TESTE |  0.00 |
+-------+-----------+-------+-------+


/* TUDO O QUE FOR FEITO NO BD LOJA TAMBEM DEVERÁ SER FEITO NO BKP */
DELIMITER $

/* FOR EACH ROW = PARA CADA LINHA */

CREATE TRIGGER BACKUP_PRODUTO
BEFORE INSERT ON PRODUTO
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES (NULL, NEW.IDPRODUTO, NEW.NOME, NEW.VALOR);

END
$

DELIMITER ;

/* TESTAR */
INSERT INTO PRODUTO VALUES (NULL, 'LIVRO MODELAGEM', 50.00);
INSERT INTO PRODUTO VALUES (NULL, 'LIVRO BI', 80.00);
INSERT INTO PRODUTO VALUES (NULL, 'LIVRO ORACLE', 40.00);
INSERT INTO PRODUTO VALUES (NULL, 'LIVRO SQL', 100.00);

/* SELECIONAR TABELA PRODUTO*/
SELECT * FROM PRODUTO;
+-----------+-----------------+--------+
| IDPRODUTO | NOME            | VALOR  |
+-----------+-----------------+--------+
|         1 | LIVRO MODELAGEM |  50.00 |
|         2 | LIVRO BI        |  80.00 |
|         3 | LIVRO ORACLE    |  40.00 |
|         4 | LIVRO SQL       | 100.00 |
+-----------+-----------------+--------+


/* SELECT: BACKUP.BKP_PRODUTO */
SELECT * FROM BACKUP.BKP_PRODUTO;
+-------+-----------+-----------------+--------+
| IDBPK | IDPRODUTO | NOME            | VALOR  |
+-------+-----------+-----------------+--------+
|     1 |      1000 | TESTE           |   0.00 |
|     2 |         0 | LIVRO MODELAGEM |  50.00 |
|     3 |         0 | BI              |  80.00 |
|     4 |         0 | ORACLE          |  40.00 |
|     5 |         0 | SQL             | 100.00 |
+-------+-----------+-----------------+--------+

/* TRIGGER USANDO DELETE*/

DELIMITER $

CREATE TRIGGER BKP_PRODUTO_DELETE
BEFORE DELETE ON PRODUTO
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES (NULL, OLD.IDPRODUTO, OLD.NOME, OLD.VALOR);

END
$

DELIMITER ;

/* DELETANDO PARA TESTE*/
SELECT * FROM PRODUTO;
+-----------+-----------------+--------+
| IDPRODUTO | NOME            | VALOR  |
+-----------+-----------------+--------+
|         1 | LIVRO MODELAGEM |  50.00 |
|         2 | LIVRO BI        |  80.00 |
|         3 | LIVRO ORACLE    |  40.00 |
|         4 | LIVRO SQL       | 100.00 |
+-----------+-----------------+--------+

SELECT * FROM PRODUTO
WHERE IDPRODUTO = 2;
+-----------+----------+-------+
| IDPRODUTO | NOME     | VALOR |
+-----------+----------+-------+
|         2 | LIVRO BI | 80.00 |
+-----------+----------+-------+


DELETE FROM PRODUTO WHERE IDPRODUTO = 2;

SELECT * FROM BKP_PRODUTO_DELETE;
Query OK, 1 row affected (0.01 sec)

SELECT * FROM PRODUTO;
+-----------+-----------------+--------+
| IDPRODUTO | NOME            | VALOR  |
+-----------+-----------------+--------+
|         1 | LIVRO MODELAGEM |  50.00 |
|         3 | LIVRO ORACLE    |  40.00 |
|         4 | LIVRO SQL       | 100.00 |
+-----------+-----------------+--------+




