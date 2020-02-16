#!/usr/bin/env python3
import sys
if __name__ == '__main__':
    maxi = 0
    mini = None
    curkey=None
    for line in sys.stdin:
        key, val = line.split("\t")
        val=float(val)
        if key == curkey:
            if mini is None:
                mini=val
            if maxi < val:
                maxi=val
            if mini > val:
                mini=val
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, maxi, mini))
            curkey = key
            mini = val
            maxi = val
    sys.stdout.write("{}\t{}\t{}\n".format(curkey, maxi, mini))
