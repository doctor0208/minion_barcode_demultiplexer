#!/bin/bash

# CHIKARAWAZA
mkdir ./demuxed
cat ./forward_matched/f_r_matched/BC01_barcode_BC25R.fastq ./reverse_matched/revcomp/r_f_matched/BC25_barcode_BC01.fastq > ./demuxed/BC01_BC25.fastq
cat ./forward_matched/f_r_matched/BC01_barcode_BC26R.fastq ./reverse_matched/revcomp/r_f_matched/BC26_barcode_BC01.fastq > ./demuxed/BC01_BC26.fastq