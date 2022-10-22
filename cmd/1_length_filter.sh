#!/bin/bash

seqkit seq concat.fastq -m 1400 -M 1800 > concat_length_filtered.fastq
