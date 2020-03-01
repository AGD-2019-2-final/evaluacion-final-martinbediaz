--
-- Pregunta
-- ===========================================================================
--
-- Realice una consulta que compute la cantidad de veces que aparece cada valor
-- de la columna `t0.c5`  por año.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
DROP TABLE IF EXISTS tbl0;
CREATE TABLE tbl0 (
    c1 INT,
    c2 STRING,
    c3 INT,
    c4 DATE,
    c5 ARRAY<CHAR(1)>,
    c6 MAP<STRING, INT>
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl0.csv' INTO TABLE tbl0;
--
DROP TABLE IF EXISTS tbl1;
CREATE TABLE tbl1 (
    c1 INT,
    c2 INT,
    c3 STRING,
    c4 MAP<STRING, INT>
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl1.csv' INTO TABLE tbl1;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

DROP TABLE IF EXISTS variables_anno;
CREATE TABLE variables_anno AS
SELECT c4, c5,
SUBSTR(c4, 1, INSTR(c4,'-')-1) AS anno
FROM tbl0;

DROP TABLE IF EXISTS resultado;
CREATE TABLE resultado AS SELECT anno, c5 FROM variables_anno;


DROP TABLE IF EXISTS x;
CREATE TABLE x AS
SELECT
    CAST(anno AS INT) AS anno,
    result
FROM
    resultado
LATERAL VIEW
    explode(c5) resultado AS result;

DROP TABLE IF EXISTS z;
CREATE TABLE z AS SELECT anno, result, COUNT(*) AS conteo FROM x GROUP BY anno, result;


INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM z;
