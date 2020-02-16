-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
u = LOAD 'data.tsv' AS (f1:chararray, f2:BAG{t: TUPLE()}, f3:MAP[]);
A = FOREACH u GENERATE FLATTEN(f2), FLATTEN(f3);
B = FOREACH A GENERATE $0, $1;
grouped = GROUP B BY ($0, $1);
D = FOREACH grouped GENERATE group, COUNT(B);
STORE D INTO 'output' USING PigStorage('\t');