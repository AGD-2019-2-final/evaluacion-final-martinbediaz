-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
u = LOAD 'data.tsv' AS (f1:chararray, f2:BAG{t: TUPLE()}, f3:MAP[]);
A = FOREACH u GENERATE f1, COUNT(f2), f3#'aaa', f3#'bbb', f3#'ccc', f3#'ddd', f3#'eee', f3#'fff',f3#'ggg',f3#'hhh',f3#'iii', f3#'jjj';
B = FOREACH A GENERATE $0, $1, COUNT(TOBAG($2..));
C = ORDER B BY $0, $1, $2;
STORE C INTO 'output' USING PigStorage(',');