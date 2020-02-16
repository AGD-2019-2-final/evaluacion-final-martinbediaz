import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        cont=0
        for word in line.split(','):
            if(cont==2):
                sys.stdout.write("{}\t1\n".format(word))
            cont+=1