-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname, color 
--    FROM 
--        u
--    WHERE color IN ('blue','black');
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
A = FILTER u BY color MATCHES 'blue';
B = FOREACH A GENERATE $0, $1, $4;
C = FILTER u BY color MATCHES 'black';
D = FOREACH C GENERATE $0, $1, $4;
E = UNION B, D;
F = ORDER E BY $0 ASC;
G = FOREACH F GENERATE $1, $2;
STORE G INTO 'output' USING PigStorage(',');
