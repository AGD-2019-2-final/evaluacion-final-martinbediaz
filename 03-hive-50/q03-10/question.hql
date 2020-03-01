--
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Escriba una consulta que devuelva los cinco valores diferentes más pequeños
-- de la tercera columna.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS ejercicio;

CREATE TABLE ejercicio (letra STRING,
                        fecha STRING,
                        numero INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE ejercicio;
--LOAD DATA INPATH 'data.tsv' OVERWRITE INTO TABLE ejercicio;

DROP TABLE IF EXISTS unicos;
CREATE TABLE unicos AS SELECT DISTINCT numero FROM ejercicio SORT BY numero;


DROP TABLE IF EXISTS respuesta;
CREATE TABLE respuesta AS SELECT  * FROM unicos LIMIT 5;


INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM respuesta LIMIT 5;
