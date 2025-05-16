#!/bin/sh

#SBATCH --job-name=fastp_wgs  	# Job name
#SBATCH --cpus-per-task=40     	# Run on a single CPU
#SBATCH --mem=256gb             	# Job memory request
#SBATCH --time=1:55:00       	# Time limit hrs:min:sec
#SBATCH --output=/home/zlarionov/Bioinformatics205/HW_last/hm_rna_seq/trimmed/trimm.log  # Standard output and error log
#SBATCH --partition=short

cd ~/Bioinformatics205/HW_last/hm_rna_seq/trimming/;
ls ~/Bioinformatics205/HW_last/hm_rna_seq/*_1.fastq.gz | parallel -j2 "fastp -w 20 -i {} -I {=s:_1.fastq.gz:_2.fastq.gz:=} -o {=s:.*/::;s:_1.fastq.gz:_trimmed_1.fastq.gz:=} -O {=s:.*/::;s:_1.fastq.gz:_trimmed_2.fastq.gz:=} --unpaired1 {=s:.*/::;s:_1.fastq.gz:_unpaired.fastq.gz:=} --unpaired2 {=s:.*/::;s:_1.fastq.gz:_unpaired.fastq.gz:=} -x -5 -r -f 15 -M 25"
