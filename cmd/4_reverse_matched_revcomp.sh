#!/bin/bash

for f in ./reverse_matched/*
do
    g=${f%.*}_rc.fastq
    #echo $f

    seqkit -t dna seq $f -r -p > $g
done

mkdir ./reverse_matched/revcomp
mv ./reverse_matched/*_rc* ./reverse_matched/revcomp