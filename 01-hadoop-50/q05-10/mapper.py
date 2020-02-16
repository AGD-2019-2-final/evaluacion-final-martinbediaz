import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        cont=0
        for word in line.split():
            if cont==1:
                ano,mes,dia=word.split("-")
                sys.stdout.write("{}\t1\n".format(mes))
            if(cont==2):
                cont=0
            cont+=1