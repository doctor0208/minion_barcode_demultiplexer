#!/bin/bash

echo ""
echo "--------------------------------------"
echo "Script for MinION basecalled fastq with V1-V9 and original barcoding"
echo "--------------------------------------"
echo ""
echo "Make sure 1. fastq is in fastq folder, and 2. primer files are edited appropriately (described only used index)."
echo "If ready to start, input y and hit the enter button. n to exit."
echo ""

while [[ $REPLY != "y" && $REPLY != "n" ]]
do
    printf "y or n? > "
    read
    if [[ $REPLY != "y" && $REPLY != "n" ]]; then
        echo "Enter y or n."
        echo ""
    fi
done

if [[ $REPLY = "n" ]]; then
    exit 0
fi

if [[ $REPLY = "y" ]]; then
    echo ""

    echo "0. concatenating all reads (0_concat.sh)"
    ./cmd/0_concat.sh
    echo ""

    echo "1. filtering by length 1400-1800 (1_length_filter.sh)"
    ./cmd/1_length_filter.sh
    echo ""

    echo "2. separating by forward barcode (2_separation_by_forward.sh)"
    ./cmd/2_separation_by_forward.sh
    echo ""

    echo "3. separating forward-matched seqs in step 2 by reverse barcode (3_separate_by_reverse_from_forward_matched.sh)"
    ./cmd/3_separate_by_reverse_from_forward_matched.sh
    echo ""

    echo "4. creating rev+comp of reverse-matched seqs in step 2 (4_reverse_matched_revcomp.sh)"
    ./cmd/4_reverse_matched_revcomp.sh
    echo ""

    echo "5. separating seqs in step 4 by forward barcode (5_sep_by_forward_for_revcomp_from_reverse_matched.sh)"
    ./cmd/5_sep_by_forward_for_revcomp_from_reverse_matched.sh
    echo ""

    echo "6. combining same-index seqs (6_combine_same_index.sh)"
    ./cmd/6_combine_same_index.sh
    echo ""

    echo "7. trimming primer region (7_primer_trimming.sh)"
    ./cmd/7_primer_trimming.sh
    echo ""

    echo "8. cleaning mess up (8_cleanup.sh)"
    ./cmd/8_cleanup.sh
    echo ""

    echo "Done. check the preprocessing_completed folder."
    echo ""


    exit 0
fi