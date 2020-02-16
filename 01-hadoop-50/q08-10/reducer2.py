#!/usr/bin/env python3
import sys
if __name__ == '__main__':
    suma = 0
    prom = 0
    cont=0
    curkey=None
    for line in sys.stdin:
        key, val = line.split("\t")
        val=float(val)
        if key == curkey:
            suma+=val
            cont+=1
        else:
            if curkey is not None:                
                promedio= suma/cont
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, suma, promedio))
            curkey = key
            suma = val
            cont = 1
    promedio= suma/cont
    sys.stdout.write("{}\t{}\t{}\n".format(curkey, suma, suma/cont))
