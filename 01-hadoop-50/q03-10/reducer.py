import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':
    for line in sys.stdin:
        line=line.rstrip()
        key, val = line.split(",")
        sys.stdout.write("{},{}\n".format(val,key))