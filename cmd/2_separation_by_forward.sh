#!/bin/bash

flexbar -r concat_length_filtered.fastq -b F.fasta -bt LTAIL -be 0.3 -bn 80 -bo 20 -bg -5

# for forward-matched
mkdir ./forward_matched

for f in ./*BC01*
do
   mv $f ./forward_matched
done


# for reverse-matched
mkdir ./reverse_matched

for f in ./*BC25* ./*BC26*
do
   mv $f ./reverse_matched
done

rm ./flexbarOut.log