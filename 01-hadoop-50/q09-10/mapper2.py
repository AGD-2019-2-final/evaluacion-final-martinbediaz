#!/usr/bin/env python3
import sys
if __name__ == "__main__":
    for line in sys.stdin:
        letra,ano,valor=line.split()
        sys.stdout.write("{}\t{}\t{}\n".format(letra,ano,valor))
