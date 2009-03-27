# RLE experiment
from sys import stdin

def main():
    this_len,this_start = 1,0
    lastline = stdin.readline().strip()
    for i,line in enumerate(stdin):
        line = line.strip()
        if line != lastline:
            print "%s,%d,%d" % (lastline, this_start, this_len)
            this_start, this_len = i+1, 1
        else:
            this_len += 1
        lastline = line
    print "%s,%d,%d" % (line, this_start, this_len)

if __name__ == '__main__':
    main()

