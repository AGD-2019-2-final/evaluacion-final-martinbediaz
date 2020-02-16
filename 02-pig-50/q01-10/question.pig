-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
u = LOAD 'data.tsv' USING PigStorage('\t') AS (key: CHARARRAY, fecha: CHARARRAY, quantity: INT);
x = FOREACH u GENERATE $0;
y = ORDER x BY $0;
grouped = GROUP y BY key;
keycount = FOREACH grouped GENERATE group, COUNT(y);
STORE keycount INTO 'output' USING PigStorage('\t');