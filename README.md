# pTools
Requirements are samtools, python3, biopython and numpy. Alternatively, you can use the command below and the "requirements.txt" file in the bundle to install the dependencies:
```
pip install requirements.txt
```
## BAM to pBAM conversion
This is a combination of scripts that converts BAM files into a pBAM format.
The list of corresponding folders are: (1) 10xscell/pbam/, (2) genome, (3) transcriptome
### 10xscell/pbam
This folder contains the code that converts a 10x single cell RNA-Seq BAM file into a pBAM format. The BAM file must be created by mapping the reads to the reference genome and keeping the unaligned reads in the BAM file. This folder contains the following scripts:
* PrintSequence.py
* getSeq_wN.py
* getSeq_woN.py
* makepBAM.sh
* README

Usage:
```
sh makepBAM.sh <bam> <ref>
```
* bam : input BAM file. Name of the bam file before the ".bam" extension.
* ref : input reference genome.  This should be the same reference genome that was used to generate the BAM file. Please use the full path.
* This script will generate an output "<bam>.p.bam", a pBAM file that has the same name as the input BAM file
  
### genome
This folder contains the code that converts a functional genomics BAM file into a pBAM format. This is specifically for BAM files that are created by mapping the reads to reference genome. This is the code to use for ChIP-Seq, ATAC-Seq and genome aligned RNA-Seq BAM files. This folder contains the following scripts:
* PrintSequence.py
* getSeq_wN.py
* getSeq_woN.py
* makepBAM.sh
* README

Usage:
```
sh makepBAM.sh <bam> <ref> <dir>
```
* bam : input BAM file. Name of the bam file before the ".bam" extension.
* ref : input reference genome.  This should be the same reference genome that was used to generate the BAM file. Please use the full path.
* <dir> : a path for a temporary directory. 
* This script will generate an output "<bam>.p.bam", a pBAM file that has the same name as the input BAM file
  
### transcriptome

This folder contains the code that converts an RNA-Seq BAM file into a pBAM format. This is specifically for BAM files that are created by mapping the reads to reference transcriptome (such as those created by STAR alignment tool). This folder contains the following scripts:
* PrintSequence.py
* PrintTransSequence.py
* pbam_mapped_transcriptome.py
* makepBAM.sh
* README

Usage:
```
sh makepBAM.sh <bam> <gref> <tref> <gtf>
```
* bam : input BAM file. Name of the bam file before the ".bam" extension.
* gref : input reference genome.  This should be the same reference genome that was used to generate the reference transcriptome and genome aligned RNA-seq BAM file. Please use the full path.
* tref : input reference transcriptome.  This should be the same reference genome transcriptome was used to generate the transcriptome aligned BAM file. Please use the full path.
* gtf : gene annotation file that was used to generate the transcriptome aligned RNA-seq BAM file. Please use the full path.
* This script will generate an output "<bam>.p.bam", a pBAM file that has the same name as the input BAM file
  
## pBAM to pFastq conversion

Although "samtools fastq" option will be enough to convert the pBAM files to fastq files, 10x single-cell BAM files that are created using STAR alignments require a special fastq conversion. For this, we will use the folder "10xscell/pfastq/".

### 10xscell/pfastq

This folder contains the code that converts a 10x single cell RNA-seq pBAM file into a pFastq format. This is specifically for BAM files that are created by mapping the reads to reference genome using STAR aligner (part of HCA Optimus pipeline). This folder contains the following scripts:
* 10x_bam2fastq.py
* makeFastq.sh
* make_unique.py
* print_unique.py
* README

Usage:
```
sh makeFastq.sh <pbam>
```
* pbam : input pBAM file. Name of the p.bam file before the "p.bam" extension.
* This script will generate three output files that are named
  * pbam_R1.fastq.gz, 
  * pbam_R2.fastq.gz, 
  * pbam_I1.fastq.gz
  
## BAM to .diff conversion

This is a combination of scripts that converts BAM files into a .diff format. For this, we will use the folder "diff". This folder contains the following scripts:
* createDiff.py
* makeDiff.sh
* compress.py
* README

Usage:
```
sh makeDiff.sh <bam>
```
* bam : input BAM file. Name of the bam file before the ".bam" extension.
* This script will generate an output "<bam>.diff", a diff file that has the same name as the input BAM file
  
## pBAM + .diff to BAM conversion

This is a combination of scripts that converts pBAM and .diff files into BAM format. For this, we will use the folder "pbam2bam". This folder contains the following scripts:
* PrintSequence.py
* PrintTransSequence.py
* pbam2bam.py
* makeBAM.sh
* README

Usage:
```
sh makeBAM.sh <pbam> <ref> <tmp> <prompt>
```
* pbam : input pBAM file. Name of the p.bam file before the "p.bam" extension.
* ref : input reference genome.  This should be the same reference genome that is in the header of the pBAM file. Please use the full path.
* tmp : a temporary folder name, will be deleted at the end of the run.
* prompt : use "genome" for genome aligned pBAMs and "transcriptome" for transcriptome aligned pBAMs
* This script will generate an output "<pbam>.bam", a BAM file that has the same name as the input and diff BAM file
* MAKE SURE THE .diff AND THE .p.bam FILE HAS THE SAME EXACT NAME and are in the same folder

