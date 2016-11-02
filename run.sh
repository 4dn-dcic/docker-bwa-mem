#!/bin/bash

fastq1=$1
fastq2=$2
index=$3
prefix=$4
nThreads=$5

bwa mem -t $nThreads -SP5 $index $fastq1 $fastq2 | samtools view -Shb - > $prefix.bam

