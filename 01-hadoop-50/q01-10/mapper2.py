#!/usr/bin/env python3
import sys
if __name__ == "__main__":
    for line in sys.stdin:
        cont=0
        for word in line.split(','):
            if(cont==3):
                purpose=word
            if(cont==4):
                amount=word                
            cont+=1
        sys.stdout.write("{}\t{}\n".format(purpose, amount))
