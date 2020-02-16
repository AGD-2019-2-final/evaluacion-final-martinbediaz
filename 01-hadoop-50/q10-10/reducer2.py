#!/usr/bin/env python3
import sys
if __name__ == '__main__':
    diccionario = {'A':[], 'B':[], 'C':[], 'D':[], 'F':[], 'G':[], 'H':[], 'I':[]}    
    for line in sys.stdin:
        x,y=line.split()
        for i in y.split(','):
            for key in diccionario:
                if(i==key):
                    lista=diccionario[key]
                    lista.append(int(x))
                    lista=sorted(lista)
                    diccionario[key]=lista
           
    for key in diccionario:
        datos=','.join(str(e) for e in diccionario[key])
        print(key+"\t"+datos)
        #sys.stdout.write("{}\t{}\n".format(key, datos)
