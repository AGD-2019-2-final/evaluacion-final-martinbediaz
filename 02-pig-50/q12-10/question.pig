-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Obtenga los apellidos que empiecen por las letras entre la 'd' y la 'k'. La 
-- salida esperada es la siguiente:
-- 
--   (Hamilton)
--   (Holcomb)
--   (Garrett)
--   (Fry)
--   (Kinney)
--   (Klein)
--   (Diaz)
--   (Guy)
--   (Estes)
--   (Jarvis)
--   (Knight)
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
A = FOREACH u GENERATE surname, SUBSTRING(surname, 0, 1), id;
B = FILTER A BY $1 MATCHES 'D';
C = FILTER A BY $1 MATCHES 'E';
D = FILTER A BY $1 MATCHES 'F';
E = FILTER A BY $1 MATCHES 'G';
F = FILTER A BY $1 MATCHES 'H';
G = FILTER A BY $1 MATCHES 'I';
H = FILTER A BY $1 MATCHES 'J';
I = FILTER A BY $1 MATCHES 'K';
J = UNION B, C, D, E, F, G, H, I;
K = ORDER J BY $2 ASC;
L = FOREACH K GENERATE $0;
STORE L INTO 'output';
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
