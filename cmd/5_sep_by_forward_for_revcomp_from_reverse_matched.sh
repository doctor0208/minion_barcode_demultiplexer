#!/bin/bash

for f in ./reverse_matched/revcomp/*_BC*
do
    #echo $f
    g=${f%_*}
    h=${g##*_}
    #echo $h
    flexbar -r $f -b F_only.fasta -bt LTAIL -be 0.3 -bn 80 -bo 20 -bg -5 -t $h
done

mkdir ./reverse_matched/revcomp/r_f_matched
mv ./BC*.fastq ./reverse_matched/revcomp/r_f_matched

rm ./BC*.log