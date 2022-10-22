#!/bin/bash

mkdir ./preprocessing_completed

for f in ./demuxed/*BC*
do
    #echo $f
    g=${f##*/}
    #echo $g

    flexbar -r $f -b primerF.fasta -be 0.3 -bt LTAIL -bn 60 -bg -5 -t "temp_fwd"

    cat ./temp_fwd_* > ./tmp.fastq

    rm ./temp_fwd*

    flexbar -r ./tmp.fastq -b primerR.fasta -be 0.3 -bt RTAIL -bn 60 -bg -5 -t "temp_rev"

    cat ./temp_rev_* > ./preprocessing_completed/$g

    rm ./tmp.fastq
    rm ./temp_rev*

done
