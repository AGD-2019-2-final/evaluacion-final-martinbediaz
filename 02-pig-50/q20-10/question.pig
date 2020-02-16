-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT
--        firstname,
--        color
--    FROM 
--        u 
--    WHERE 
--       color REGEXP '^[^b]';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
A = FOREACH u GENERATE firstname, color, SUBSTRING(color, 0, 1);
B = FOREACH A GENERATE $0, $1, COUNT(DIFF($2, 'b'));
C = FOREACH B GENERATE $0, $1, ($2 > 0 ? '1' : '0' );
D = FILTER C BY $2 MATCHES '1';
E = FOREACH D GENERATE $0, $1;
STORE E INTO 'output' USING PigStorage(',');