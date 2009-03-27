/*
Note: I do not know perl
This seems to be just a touch faster than the Python version
*/
$lastline = readline(STDIN);
$its = 1;
$this_len = 1;
while (<>) {
    #chomp;
    if ($_ ne $lastline) {
        chomp($k = $lastline);
        printf "%s,%d,%d\n", $k, $this_start, $this_len;
        $this_len = 1;
        $this_start = $its;
    } else {
        $this_len++;
    }
    $lastline = $_;
    $its++;
}
printf "%s,%d,%d\n", $lastline, $this_start, $this_len;
