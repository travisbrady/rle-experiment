lastline = STDIN.readline
this_start = 0
this_len = 1
its = 1
STDIN.each{ |line|
    if line != lastline then
        printf("%s,%d,%d\n", lastline.chomp, this_start, this_len)
        this_start = its
        this_len = 1
    else
        this_len += 1
    end
    lastline = line
    its += 1
}
printf("%s,%d,%d\n", lastline.chomp, this_start, this_len)

