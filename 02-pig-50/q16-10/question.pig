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
--    WHERE color = 'blue' OR firstname LIKE 'K%';
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
C = FOREACH u GENERATE id, firstname, color, SUBSTRING(firstname, 0, 1);
D = FILTER C BY $3 MATCHES 'K';
E = FOREACH D GENERATE $0, $1, $2;
F = UNION B, E;
G = ORDER F BY $0 ASC;
H = FOREACH G GENERATE $1, $2;
--grouped = GROUP G BY ($1,$2);
--keycount = FOREACH grouped GENERATE group, COUNT(G);
--n = FOREACH keycount GENERATE FLATTEN($0);
STORE H INTO 'output' USING PigStorage(',');