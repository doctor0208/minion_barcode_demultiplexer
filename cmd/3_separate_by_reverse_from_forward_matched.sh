#!/bin/bash

for f in ./forward_matched/*_BC01.*
do
    g=${f%.*}
    h=${g##*_}
    #echo $h

    flexbar -r $f -b R.fasta -bt RTAIL -be 0.3 -bn 80 -bo 20 -bg -5 -t $h
done

mkdir ./forward_matched/f_r_matched
mv ./BC* ./forward_matched/f_r_matched
rm ./forward_matched/f_r_matched/*.log