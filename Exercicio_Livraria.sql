/* SECAO 4: EXERCICIO DE REVISAO - 16/08/2020 /*

/* 
O NOSSO CLIENTE SOLICITOU UMA TABELA PARA ARMAZENAR OS LIVOS QUE SÃO COMERCIALIZADOS PELA EMPRESA.
A SOLICITAÇÃO É SOMENTE PARA LIVROS E NÃO HÁ A NECESSIDADE DE REALIZAR BUSCA EM OUTRAS TABELAS.
HOJE HÁ UM FUNCIONÁRIO DE VENDAS QUE TEM UMA TABELA NO EXCEL PARA GUARDAR ESSES REGISTROS, MAS
ESTÃO FICANDO COMPLEXAS. DECIDIU-SE ENTAO CRIAR UM BANCO DE DADOS SEPARADA PARA ESTE FUNCIONARIO.

APÓS A CRIAÇAO DA TABELA, DEVEREMOS ENTREGAR ALGUMAS QUERIES PRONTAS PARA QUE SEJAM ENVIADAS PARA O PROGRAMADOR. 
AS QUERIES SAO AS SEGUINTES

1-> TRAZER TODOS OS DADOS;
2-> TRAZER O NOME DO LIVRO E O NOME DA EDITORA;
3-> TRAZER O NOME DO LIVRO E A UF DOS LIVROS PUBLICADOS POR AUTORES DO SEXO MASCULINO;
4-> TRAZER O NOME DO LIVRO E O NUMERO DE PAGINAS DOS LIVROS PUBLICADOS POR AUTORES DO SEXO FEMININO.
5-> TRAZER OS VALORES DOS LIVROS E O NÚMERO DAS EDITORAS DE SAO PAULO.
6-> TRAZER OS DADOS DOS AUTORES DO SEXO MASCULINO QUE TIVERAM LIVROS PUBLICADOS POR SÃO PAULO OU RIO DE JANEIRO.

*/

/*  RESOLUÇAO DO EXERCICIO: */

/*CRIACAO DO BANCO*/
CREATE DATABASE LIVRARIA;
USE LIVRARIA;

/* CRIANDO TABELA*/
CREATE TABLE LIVROS 
(
	ID_LIVRO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_LIVRO VARCHAR (100) NOT NULL,
	NOME_AUTOR VARCHAR (100) NOT NULL,
	SEXO_AUTOR ENUM ('M', 'F') NOT NULL,
	N_PAG VARCHAR (30) NOT NULL,
	NOME_EDITORA VARCHAR (100) NOT NULL, 
	VALOR_LIVRO FLOAT (10,2) NOT NULL, 
	UF_EDITORA CHAR (2) NOT NULL, 
	ANO_PUBLICACAO VARCHAR (30)
);

/* VISULIZANDO A TAB NO BANCO*/
DESC LIVROS;
+----------------+---------------+------+-----+---------+----------------+
| Field          | Type          | Null | Key | Default | Extra          |
+----------------+---------------+------+-----+---------+----------------+
| ID_LIVRO       | int           | NO   | PRI | NULL    | auto_increment |
| NOME_LIVRO     | varchar(100)  | NO   |     | NULL    |                |
| NOME_AUTOR     | varchar(100)  | NO   |     | NULL    |                |
| SEXO_AUTOR     | enum('M','F') | NO   |     | NULL    |                |
| N_PAG          | varchar(30)   | NO   |     | NULL    |                |
| NOME_EDITORA   | varchar(100)  | NO   |     | NULL    |                |
| VALOR_LIVRO    | float(10,2)   | NO   |     | NULL    |                |
| UF_EDITORA     | char(2)       | NO   |     | NULL    |                |
| ANO_PUBLICACAO | varchar(30)   | YES  |     | NULL    |                |
+----------------+---------------+------+-----+---------+----------------+

/* INSERINDO DADOS NA TABELA*/
INSERT INTO LIVROS VALUES(NULL, 'Cavaleiro Real','Ana Claudia','F',465,'Atlas',49.9,'RJ',2009);
INSERT INTO LIVROS VALUES(NULL,'SQL para leigos','João Nunes','M',450,'Addison',98,'SP',2018);
INSERT INTO LIVROS VALUES(NULL,'Receitas Caseiras','Celia Tavares','F',210,'Atlas',45,'RJ',2008);
INSERT INTO LIVROS VALUES(NULL,'Pessoas Efetivas','Eduardo Santos','M',390,'Beta',78,'RJ',2018);
INSERT INTO LIVROS VALUES(NULL,'Habitos Saudáveis','Eduardo Santos','M',630,'Beta',150,'RJ',2019);
INSERT INTO LIVROS VALUES(NULL,'A Casa Marrom','Hermes Macedo','M',250,'Bubba',60,'MG',2016);
INSERT INTO LIVROS VALUES(NULL,'Estacio Querido','Geraldo Francisco','M',310,'Insignia',100,'ES',2015);
INSERT INTO LIVROS VALUES(NULL,'Pra sempre amigas','Leda Silva','F',510,'Insignia',78,'ES',2011);
INSERT INTO LIVROS VALUES(NULL,'Copas Inesqueciveis','Marco Alcantara','M',200,'Larson',130,'RS',2018);
INSERT INTO LIVROS VALUES(NULL,'O poder da mente','Clara Mafra','F',120,'Continental',56,'SP',2017);

/* CONFERINDO DADOS CADASTRADOS*/
SELECT * FROM LIVROS;

+----------+---------------------+-------------------+------------+-------+--------------+-------------+------------+----------------+
| ID_LIVRO | NOME_LIVRO          | NOME_AUTOR        | SEXO_AUTOR | N_PAG | NOME_EDITORA | VALOR_LIVRO | UF_EDITORA | ANO_PUBLICACAO |
+----------+---------------------+-------------------+------------+-------+--------------+-------------+------------+----------------+
|        1 | Cavaleiro Real      | Ana Claudia       | F          | 465   | Atlas        |       49.90 | RJ         | 2009           |
|        2 | SQL para leigos     | João Nunes        | M          | 450   | Addison      |       98.00 | SP         | 2018           |
|        3 | Receitas Caseiras   | Celia Tavares     | F          | 210   | Atlas        |       45.00 | RJ         | 2008           |
|        4 | Pessoas Efetivas    | Eduardo Santos    | M          | 390   | Beta         |       78.00 | RJ         | 2018           |
|        5 | Habitos Saudáveis   | Eduardo Santos    | M          | 630   | Beta         |      150.00 | RJ         | 2019           |
|        6 | A Casa Marrom       | Hermes Macedo     | M          | 250   | Bubba        |       60.00 | MG         | 2016           |
|        7 | Estacio Querido     | Geraldo Francisco | M          | 310   | Insignia     |      100.00 | ES         | 2015           |
|        8 | Pra sempre amigas   | Leda Silva        | F          | 510   | Insignia     |       78.00 | ES         | 2011           |
|        9 | Copas Inesqueciveis | Marco Alcantara   | M          | 200   | Larson       |      130.00 | RS         | 2018           |
|       10 | O poder da mente    | Clara Mafra       | F          | 120   | Continental  |       56.00 | SP         | 2017           |
+----------+---------------------+-------------------+------------+-------+--------------+-------------+------------+----------------+

/* CRIANDO AS QUERIES*/

/*1-> TRAZER TODOS OS DADOS; */
SELECT * FROM LIVROS;

+----------+---------------------+-------------------+------------+-------+--------------+-------------+------------+----------------+
| ID_LIVRO | NOME_LIVRO          | NOME_AUTOR        | SEXO_AUTOR | N_PAG | NOME_EDITORA | VALOR_LIVRO | UF_EDITORA | ANO_PUBLICACAO |
+----------+---------------------+-------------------+------------+-------+--------------+-------------+------------+----------------+
|        1 | Cavaleiro Real      | Ana Claudia       | F          | 465   | Atlas        |       49.90 | RJ         | 2009           |
|        2 | SQL para leigos     | João Nunes        | M          | 450   | Addison      |       98.00 | SP         | 2018           |
|        3 | Receitas Caseiras   | Celia Tavares     | F          | 210   | Atlas        |       45.00 | RJ         | 2008           |
|        4 | Pessoas Efetivas    | Eduardo Santos    | M          | 390   | Beta         |       78.00 | RJ         | 2018           |
|        5 | Habitos Saudáveis   | Eduardo Santos    | M          | 630   | Beta         |      150.00 | RJ         | 2019           |
|        6 | A Casa Marrom       | Hermes Macedo     | M          | 250   | Bubba        |       60.00 | MG         | 2016           |
|        7 | Estacio Querido     | Geraldo Francisco | M          | 310   | Insignia     |      100.00 | ES         | 2015           |
|        8 | Pra sempre amigas   | Leda Silva        | F          | 510   | Insignia     |       78.00 | ES         | 2011           |
|        9 | Copas Inesqueciveis | Marco Alcantara   | M          | 200   | Larson       |      130.00 | RS         | 2018           |
|       10 | O poder da mente    | Clara Mafra       | F          | 120   | Continental  |       56.00 | SP         | 2017           |
+----------+---------------------+-------------------+------------+-------+--------------+-------------+------------+----------------+

/* 2-> TRAZER O NOME DO LIVRO E O NOME DA EDITORA; */
SELECT NOME_LIVRO, NOME_EDITORA
FROM LIVROS;

+---------------------+--------------+
| NOME_LIVRO          | NOME_EDITORA |
+---------------------+--------------+
| Cavaleiro Real      | Atlas        |
| SQL para leigos     | Addison      |
| Receitas Caseiras   | Atlas        |
| Pessoas Efetivas    | Beta         |
| Habitos Saudáveis   | Beta         |
| A Casa Marrom       | Bubba        |
| Estacio Querido     | Insignia     |
| Pra sempre amigas   | Insignia     |
| Copas Inesqueciveis | Larson       |
| O poder da mente    | Continental  |
+---------------------+--------------+

/* 3-> TRAZER O NOME DO LIVRO E A UF DOS LIVROS PUBLICADOS POR AUTORES DO SEXO MASCULINO; */
SELECT NOME_LIVRO, UF_EDITORA, SEXO_AUTOR
FROM LIVROS
WHERE SEXO_AUTOR = 'M';

+---------------------+------------+------------+
| NOME_LIVRO          | UF_EDITORA | SEXO_AUTOR |
+---------------------+------------+------------+
| SQL para leigos     | SP         | M          |
| Pessoas Efetivas    | RJ         | M          |
| Habitos Saudáveis   | RJ         | M          |
| A Casa Marrom       | MG         | M          |
| Estacio Querido     | ES         | M          |
| Copas Inesqueciveis | RS         | M          |
+---------------------+------------+------------+

/* 4-> TRAZER O NOME DO LIVRO E O NUMERO DE PAGINAS DOS LIVROS PUBLICADOS POR AUTORES DO SEXO FEMININO. */
SELECT NOME_LIVRO, UF_EDITORA, SEXO_AUTOR
FROM LIVROS
WHERE SEXO_AUTOR = 'F';

+-------------------+------------+------------+
| NOME_LIVRO        | UF_EDITORA | SEXO_AUTOR |
+-------------------+------------+------------+
| Cavaleiro Real    | RJ         | F          |
| Receitas Caseiras | RJ         | F          |
| Pra sempre amigas | ES         | F          |
| O poder da mente  | SP         | F          |
+-------------------+------------+------------+

/* 5-> TRAZER OS VALORES DOS LIVROS E O NÚMERO DAS EDITORAS DE SAO PAULO. */
SELECT NOME_LIVRO , VALOR_LIVRO, N_PAG, UF_EDITORA
FROM LIVROS
WHERE UF_EDITORA = 'SP';

+------------------+-------------+-------+------------+
| NOME_LIVRO       | VALOR_LIVRO | N_PAG | UF_EDITORA |
+------------------+-------------+-------+------------+
| SQL para leigos  |       98.00 | 450   | SP         |
| O poder da mente |       56.00 | 120   | SP         |
+------------------+-------------+-------+------------+


/*  6-> TRAZER OS DADOS DOS AUTORES DO SEXO MASCULINO QUE TIVERAM LIVROS PUBLICADOS POR SÃO PAULO OU RIO DE JANEIRO. */
SELECT NOME_AUTOR, SEXO_AUTOR, UF_EDITORA
FROM LIVROS
WHERE 
SEXO_AUTOR  = 'M' AND (UF_EDITORA = 'SP' OR UF_EDITORA = 'RJ')
ORDER BY 3;

+----------------+------------+------------+
| NOME_AUTOR     | SEXO_AUTOR | UF_EDITORA |
+----------------+------------+------------+
| Eduardo Santos | M          | RJ         |
| Eduardo Santos | M          | RJ         |
| João Nunes     | M          | SP         |
+----------------+------------+------------+