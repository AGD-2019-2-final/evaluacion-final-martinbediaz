#!/usr/bin/env python3
import sys
if __name__ == "__main__":
    for line in sys.stdin:
        x,y=line.split()
        sys.stdout.write("{}\t{}\n".format(x,y))
