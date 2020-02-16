import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':
    cont=0
    curkey=None    
    lista=[]
    aux=[]
    for line in sys.stdin:
        key, ano, val = line.split("\t")
        val=int(val)        
        if cont==0:
            lista.append(line)
        else:
            cont2=0
            aux=line
            for i in lista:
                x=i.split("\t")
                if int(x[2].strip()) > val:
                    aux=lista[cont2]
                    lista[cont2]=line     
                    y=aux.split('\t')
                    val=int(y[2].strip())
                    line=aux
                cont2+=1
            lista.append(aux)
        cont+=1
    cont=0
    for datos in lista:
        datos=datos.split("\t")
        if cont<6:
            sys.stdout.write("{}\t{}\t{}".format(datos[0], datos[1], datos[2]))
        cont+=1