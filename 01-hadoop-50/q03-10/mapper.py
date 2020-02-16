import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        line=line.rstrip()
        val,key = line.split(",")
        sys.stdout.write("{},{}\n".format(key,val))