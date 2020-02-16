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
--    WHERE color NOT IN ('blue','black');
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
A = FOREACH u GENERATE id, firstname, color, COUNT(DIFF(color, 'blue'));
B = FOREACH A GENERATE $0, $1, $2, ($3 > 0 ? '1' : '0' );
C = FILTER B BY $3 MATCHES '1';
D = FOREACH C GENERATE $0, $1, $2, COUNT(DIFF(color, 'black')); 
E = FOREACH D GENERATE $0, $1, $2, ($3 > 0 ? '1' : '0' );
F = FILTER E BY $3 MATCHES '1';
G = FOREACH F GENERATE $1, $2;
STORE G INTO 'output' USING PigStorage(',');