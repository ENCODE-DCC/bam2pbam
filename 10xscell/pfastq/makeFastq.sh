#!/bin/sh


pbam=$1
samtools view -H ${pbam}.p.bam > header.txt
samtools view ${pbam}.p.bam | python make_unique.py > reads.txt
awk '!seen[$1$2$3$4]++' reads.txt > unique_reads.txt
rm reads.txt
awk '{print $5}' unique_reads.txt > linenumbers.txt
rm unique_reads.txt
samtools view ${pbam}.p.bam | python print_unique.py | samtools view -h -bS - > filtered.bam
rm linenumbers.txt
rm header.txt
bam=filtered.bam
samtools view ${bam} | python 10x_bam2fastq.py pbam
rm ${bam}