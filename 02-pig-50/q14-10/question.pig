--
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        color 
--    FROM 
--        u 
--    WHERE 
--        color NOT LIKE 'b%';
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
A = FOREACH u GENERATE color, SUBSTRING(color, 0, 1), id;
B = FOREACH A GENERATE color, COUNT(DIFF($1, 'b'));
C = FOREACH B GENERATE $0, ($1 > 0 ? '1' : '2' );
D = FILTER C BY $1 MATCHES '1';
E = FOREACH D GENERATE $0;
STORE E INTO 'output';
