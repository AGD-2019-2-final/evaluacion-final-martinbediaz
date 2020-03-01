-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Compute la cantidad de registros por cada letra de la columna 1.
-- Escriba el resultado ordenado por letra. 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
!hdfs dfs -rm -r -f /output
DROP TABLE IF EXISTS data;
DROP TABLE IF EXISTS result;
CREATE TABLE data (letra STRING, fecha STRING, num INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
TBLPROPERTIES ('skip.header.line.count'='1');
LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE data;
CREATE TABLE result
AS
    SELECT CONCAT (letra,',', count(letra))
    FROM data
    GROUP BY letra;

INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM result;
!hdfs dfs -copyToLocal /output  output;