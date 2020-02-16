-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
u = LOAD 'data.tsv' USING PigStorage('\t') AS (key: CHARARRAY, fecha: CHARARRAY, quantity: INT);
x = FOREACH u GENERATE $2;
y = ORDER x BY $0 ASC;
z = LIMIT y 5;
STORE z INTO 'output' USING PigStorage('\t');