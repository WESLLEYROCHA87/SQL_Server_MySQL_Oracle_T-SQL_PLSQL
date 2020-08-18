/* FILTROS EM LINHA */

/* VAMOS UTILIZAR O BANCO LIVRARIA PARA TESTES*/
USE LIVRARIA;
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

/* WHERE */
SELECT NOME_LIVRO, SEXO_AUTOR /* PROJECAO*/
FROM LIVROS /* ORIGEM */
WHERE SEXO_AUTOR = 'M'; /* SELECAO */

+---------------------+------------+
| NOME_LIVRO          | SEXO_AUTOR |
+---------------------+------------+
| SQL para leigos     | M          |
| Pessoas Efetivas    | M          |
| Habitos Saudáveis   | M          |
| A Casa Marrom       | M          |
| Estacio Querido     | M          |
| Copas Inesqueciveis | M          |
+---------------------+------------+

/* UTILIZANDO O LIKE */

SELECT NOME_LIVRO, NOME_AUTOR
FROM LIVROS
WHERE NOME_LIVRO LIKE 'A%';
+---------------+---------------+
| NOME_LIVRO    | NOME_AUTOR    |
+---------------+---------------+
| A Casa Marrom | Hermes Macedo |
+---------------+---------------+

SELECT NOME_LIVRO, NOME_AUTOR
FROM LIVROS
WHERE NOME_AUTOR LIKE '%A';
+---------------------+-----------------+
| NOME_LIVRO          | NOME_AUTOR      |
+---------------------+-----------------+
| Cavaleiro Real      | Ana Claudia     |
| Pra sempre amigas   | Leda Silva      |
| Copas Inesqueciveis | Marco Alcantara |
| O poder da mente    | Clara Mafra     |
+---------------------+-----------------+

/* COMO TRAZER VALORES NULL*/