/* FUNCÕES*/

/* IFNULL  - MOSTRA DE FORMA AMIGAVEL DADOS NULL PARA O USUÁRIO */

/*BANCO COMERCIO*/
+--------------------+
| Tables_in_comercio |
+--------------------+
| alunos             |
| cliente            |
| endereco           |
| telefone           |
| v_relatorio        |
+--------------------+

/* LEVANTE O NOME, EMAIL, NUMERO, ESTADO*/
SELECT C.NOME, C.EMAIL, E.ESTADO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE;

+---------+-------------------+--------+----------+
| NOME    | EMAIL             | ESTADO | NUMERO   |
+---------+-------------------+--------+----------+
| JORGE   | JORGE@IG.COM      | ES     | 78458743 |
| JORGE   | JORGE@IG.COM      | ES     | 56576876 |
| JOAO    | NULL              | RJ     | 87866896 |
| CARLOS  | CARLOSA@IG.COM    | RJ     | 54768899 |
| JOAO    | NULL              | RJ     | 99667587 |
| ANA     | ANA@IG.COM        | SP     | 78989765 |
| ANA     | ANA@IG.COM        | SP     | 99766676 |
| JOAO    | NULL              | RJ     | 66687899 |
| JORGE   | JORGE@IG.COM      | ES     | 89986668 |
| CARLOS  | CARLOSA@IG.COM    | RJ     | 88687909 |
| GIOVANA | NULL              | MG     | 68976565 |
| GIOVANA | NULL              | MG     | 99656675 |
| DANIELE | DANIELE@GMAIL.COM | RJ     | 33567765 |
| DANIELE | DANIELE@GMAIL.COM | RJ     | 88668786 |
| DANIELE | DANIELE@GMAIL.COM | RJ     | 55689654 |
| LORENA  | NULL              | RJ     | 88687979 |
| EDUARDO | EDUARDO@GMAIL.COM | ES     | 88965676 |
| ANTONIO | ANTONIO@UOL.COM   | PR     | 89966809 |
| ELAINE  | ELAINE@GLOBO.COM  | SP     | 88679978 |
| CARMEM  | CARMEM@IG.COM     | PR     | 99655768 |
| ADRIANA | ADRIANA@GMAIL.COM | SP     | 89955665 |
| JOICE   | JOICE@GMAIL.COM   | RJ     | 77455786 |
| JOICE   | JOICE@GMAIL.COM   | RJ     | 89766554 |
+---------+-------------------+--------+----------+


/* IFNULL  - MOSTRA DE FORMA AMIGAVEL DADOS NULL PARA O USUÁRIO */

SELECT C.NOME, 
	   IFNULL(C.EMAIL, '************'), 
	   E.ESTADO, 
	   T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE;

+---------+---------------------------------+--------+----------+
| NOME    | IFNULL(C.EMAIL, '************') | ESTADO | NUMERO   |
+---------+---------------------------------+--------+----------+
| JOAO    | ************                    | RJ     | 87866896 |
| JOAO    | ************                    | RJ     | 99667587 |
| JOAO    | ************                    | RJ     | 66687899 |
| ANA     | ANA@IG.COM                      | SP     | 78989765 |
| ANA     | ANA@IG.COM                      | SP     | 99766676 |
| CARLOS  | CARLOSA@IG.COM                  | RJ     | 54768899 |
| CARLOS  | CARLOSA@IG.COM                  | RJ     | 88687909 |
| JORGE   | JORGE@IG.COM                    | ES     | 78458743 |
| JORGE   | JORGE@IG.COM                    | ES     | 56576876 |
| JORGE   | JORGE@IG.COM                    | ES     | 89986668 |
| GIOVANA | ************                    | MG     | 68976565 |
| GIOVANA | ************                    | MG     | 99656675 |
| DANIELE | DANIELE@GMAIL.COM               | RJ     | 33567765 |
| DANIELE | DANIELE@GMAIL.COM               | RJ     | 88668786 |
| DANIELE | DANIELE@GMAIL.COM               | RJ     | 55689654 |
| LORENA  | ************                    | RJ     | 88687979 |
| EDUARDO | EDUARDO@GMAIL.COM               | ES     | 88965676 |
| ANTONIO | ANTONIO@UOL.COM                 | PR     | 89966809 |
| ELAINE  | ELAINE@GLOBO.COM                | SP     | 88679978 |
| CARMEM  | CARMEM@IG.COM                   | PR     | 99655768 |
| ADRIANA | ADRIANA@GMAIL.COM               | SP     | 89955665 |
| JOICE   | JOICE@GMAIL.COM                 | RJ     | 77455786 |
| JOICE   | JOICE@GMAIL.COM                 | RJ     | 89766554 |
+---------+---------------------------------+--------+----------+

