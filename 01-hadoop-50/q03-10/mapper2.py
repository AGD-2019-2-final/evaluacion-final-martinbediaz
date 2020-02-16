#!/usr/bin/env python3
import sys
if __name__ == "__main__":
    for line in sys.stdin:
        line=line.rstrip()
        val,key = line.split(",")
        sys.stdout.write("{},{}\n".format(key,val))
