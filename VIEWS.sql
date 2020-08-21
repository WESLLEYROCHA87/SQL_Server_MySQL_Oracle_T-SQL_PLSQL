/* VIEWS */

/* VIEWS -> VISÃO -> PONTEIRO -> APONTA PARA A QUERY */

/* BANCO COMERCIO */
+--------------------+
| Tables_in_comercio |
+--------------------+
| alunos             |
| cliente            |
| endereco           |
| telefone           |
+--------------------+

/* LEVANTE: NOME, SEXO, EMAIL, TIPO, NUMERO, BAIRRO, CIDADE, ESTADO */
CREATE VIEW V_RELATORIO_PRINC AS
SELECT C.NOME, C.SEXO, IFNULL(C.EMAIL, '***************') AS 'EMAIL', 
       T.TIPO, T.NUMERO, 
       E.BAIRRO, E.CIDADE, E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
ORDER BY C.NOME;


SELECT * FROM V_RELATORIO_PRINC;

+---------+------+-------------------+------+----------+------------+----------------+--------+
| NOME    | SEXO | EMAIL             | TIPO | NUMERO   | BAIRRO     | CIDADE         | ESTADO |
+---------+------+-------------------+------+----------+------------+----------------+--------+
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 89955665 | LAPA       | SAO PAULO      | SP     |
| ANA     | F    | ANA@IG.COM        | CEL  | 78989765 | JARDINS    | SAO PAULO      | SP     |
| ANA     | F    | ANA@IG.COM        | CEL  | 99766676 | JARDINS    | SAO PAULO      | SP     |
| ANTONIO | M    | ANTONIO@UOL.COM   | CEL  | 89966809 | CENTRO     | CURITIBA       | PR     |
| CARLOS  | M    | CARLOSA@IG.COM    | COM  | 54768899 | ESTACIO    | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOSA@IG.COM    | CEL  | 88687909 | ESTACIO    | RIO DE JANEIRO | RJ     |
| CARMEM  | F    | CARMEM@IG.COM     | CEL  | 99655768 | BOM RETIRO | CURITIBA       | PR     |
| DANIELE | F    | DANIELE@GMAIL.COM | CEL  | 33567765 | CENTRO     | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM | CEL  | 88668786 | CENTRO     | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM | COM  | 55689654 | CENTRO     | RIO DE JANEIRO | RJ     |
| EDUARDO | M    | EDUARDO@GMAIL.COM | COM  | 88965676 | CENTRO     | VITORIA        | ES     |
| ELAINE  | F    | ELAINE@GLOBO.COM  | COM  | 88679978 | JARDINS    | SAO PAULO      | SP     |
| GIOVANA | F    | ***************   | RES  | 68976565 | CASCADURA  | B. HORIZONTE   | MG     |
| GIOVANA | F    | ***************   | CEL  | 99656675 | CASCADURA  | B. HORIZONTE   | MG     |
| JOAO    | M    | ***************   | CEL  | 87866896 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | ***************   | RES  | 99667587 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | ***************   | COM  | 66687899 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM   | RES  | 77455786 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM   | RES  | 89766554 | CENTRO     | RIO DE JANEIRO | RJ     |
| JORGE   | M    | JORGE@IG.COM      | CEL  | 78458743 | CENTRO     | VITORIA        | ES     |
| JORGE   | M    | JORGE@IG.COM      | RES  | 56576876 | CENTRO     | VITORIA        | ES     |
| JORGE   | M    | JORGE@IG.COM      | RES  | 89986668 | CENTRO     | VITORIA        | ES     |
| LORENA  | F    | ***************   | COM  | 88687979 | COPACABANA | RIO DE JANEIRO | RJ     |
+---------+------+-------------------+------+----------+------------+----------------+--------+

/* LOCALIZAR VIEWS NO BD*/
SHOW TABLES;
+--------------------+
| Tables_in_comercio |
+--------------------+
| alunos             |
| cliente            |
| endereco           |
| telefone           |
| v_relatorio        |
| v_relatorio_princ  |
+--------------------+

/* APAGANDO UMA VIEW */
DROP VIEW V_RELATORIO;

/* TESTANDO FUNCIONALIDADES */

SELECT NOME, SEXO, EMAIL
FROM V_RELATORIO_PRINC;

+---------+------+-------------------+
| NOME    | SEXO | EMAIL             |
+---------+------+-------------------+
| ADRIANA | F    | ADRIANA@GMAIL.COM |
| ANA     | F    | ANA@IG.COM        |
| ANA     | F    | ANA@IG.COM        |
| ANTONIO | M    | ANTONIO@UOL.COM   |
| CARLOS  | M    | CARLOSA@IG.COM    |
| CARLOS  | M    | CARLOSA@IG.COM    |
| CARMEM  | F    | CARMEM@IG.COM     |
| DANIELE | F    | DANIELE@GMAIL.COM |
| DANIELE | F    | DANIELE@GMAIL.COM |
| DANIELE | F    | DANIELE@GMAIL.COM |
| EDUARDO | M    | EDUARDO@GMAIL.COM |
| ELAINE  | F    | ELAINE@GLOBO.COM  |
| GIOVANA | F    | ***************   |
| GIOVANA | F    | ***************   |
| JOAO    | M    | ***************   |
| JOAO    | M    | ***************   |
| JOAO    | M    | ***************   |
| JOICE   | F    | JOICE@GMAIL.COM   |
| JOICE   | F    | JOICE@GMAIL.COM   |
| JORGE   | M    | JORGE@IG.COM      |
| JORGE   | M    | JORGE@IG.COM      |
| JORGE   | M    | JORGE@IG.COM      |
| LORENA  | F    | ***************   |
+---------+------+-------------------+

SELECT SEXO,
COUNT(*) AS 'QTDE'
FROM V_RELATORIO_PRINC
GROUP BY SEXO;
+------+------+
| SEXO | QTDE |
+------+------+
| M    |   10 |
| F    |   13 |
+------+------+

SELECT ESTADO,
COUNT(*) AS 'QTDE'
FROM V_RELATORIO_PRINC
GROUP BY ESTADO;
+--------+------+
| ESTADO | QTDE |
+--------+------+
| RJ     |   11 |
| SP     |    4 |
| ES     |    4 |
| MG     |    2 |
| PR     |    2 |
+--------+------+