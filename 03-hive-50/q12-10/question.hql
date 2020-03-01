--
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que compute la cantidad de registros por letra de la
-- columna 2 y clave de la columna 3; esto es, por ejemplo, la cantidad de
-- registros en tienen la letra `a` en la columna 2 y la clave `aaa` en la
-- columna 3 es:
--
--     a    aaa    5
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
DROP TABLE IF EXISTS t0;
CREATE TABLE t0 (
    c1 STRING,
    c2 ARRAY<CHAR(1)>,
    c3 MAP<STRING, INT>
    )
    ROW FORMAT DELIMITED
        FIELDS TERMINATED BY '\t'
        COLLECTION ITEMS TERMINATED BY ','
        MAP KEYS TERMINATED BY '#'
        LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'data.tsv' INTO TABLE t0;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS inicio1;
CREATE TABLE inicio1 AS
SELECT
    c2,
    letras
FROM
    t0
LATERAL VIEW
    explode(c3) t0 AS letras, valor;


DROP TABLE IF EXISTS inicio2;
CREATE TABLE inicio2 AS
SELECT
    valores,
    letras
FROM
    inicio1
LATERAL VIEW
    explode(C2) inicio1 AS valores
ORDER BY
    valores,
    letras;

DROP TABLE IF EXISTS resultado;
CREATE TABLE resultado AS
SELECT
    valores,
    letras,
    COUNT(*)
FROM
    inicio2
GROUP BY
    letras,
    valores;

INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM resultado;
