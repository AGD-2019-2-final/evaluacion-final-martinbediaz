import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':
    cont=0
    curkey=None    
    lista=[]
    aux=[]
    inicio=0
    for line in sys.stdin:
        key, val, ano = line.split("\t")
        val=int(val)        
        if key == curkey:
            aux=line
            for i in range(inicio,len(lista)):
                x=lista[i].split("\t")   
                if int(x[1]) > val:
                    aux=lista[i]
                    lista[i]=line     
                    y=aux.split('\t')
                    val=int(y[1])
                    line=aux
            #lista.append(aux)  
            lista.append(line) 
        else:
            lista.append(line)
            curkey = key
            inicio=cont
        cont+=1  
    for datos in lista:
        datos=datos.split("\t")
        sys.stdout.write("{}\t{}\t{}\n".format(datos[0], datos[2].strip(), datos[1]))