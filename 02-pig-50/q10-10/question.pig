-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Genere una relación con el apellido y su longitud. Ordene por longitud y 
-- por apellido. Obtenga la siguiente salida.
-- 
--   Hamilton,8
--   Garrett,7
--   Holcomb,7
--   Coffey,6
--   Conway,6
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
        quantity:CHARARRAY);
A = FOREACH u GENERATE surname, SIZE(surname);
B = ORDER A BY $1 desc, surname ;
C = LIMIT B 5;
--A = FOREACH u GENERATE $2, FLATTEN(STRSPLIT($2,''));
--B = FOREACH A GENERATE $0, COUNT(TOBAG($1..));
--C = ORDER B BY $0 ASC;
--D = ORDER C BY $1 DESC;
--E = LIMIT D 5;
STORE C INTO 'output' USING PigStorage(',');