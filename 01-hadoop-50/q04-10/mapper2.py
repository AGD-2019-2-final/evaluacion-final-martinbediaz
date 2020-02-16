#!/usr/bin/env python3
import sys
if __name__ == "__main__":
    for line in sys.stdin:
        ##line=line.rstrip()
        val,key,otro = line.split("\t")
        sys.stdout.write("{}\t{}\n".format(key,val))
