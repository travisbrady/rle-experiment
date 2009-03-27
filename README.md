Run Length Encoding
==================

The goal here is to implement a simple program to accept a single column of strings
on stdin and print an RLE compressed version of that column to stdout to understand
a few things about performance, expressiveness and what sorts of tasks certain languages
are well-suited too.

The output is an RLE Triple of the form (value, start position, length)

Example
=======

The input file fakedata contains a list of pets with duplicates.
Programs should do this:

    $ python rle1.py < fakedata 
    dog,0,3
    cat,3,2
    bird,5,1
    fish,6,4
    monkey,10,6
    rabbit,16,1
    hamster,17,5

Testing
=======

Run replicate.py to create bigfake to make it easier to measure wall clock performance.
