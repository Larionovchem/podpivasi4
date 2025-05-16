#!/bin/sh
#SBATCH --job-name=star_mapping
#SBATCH --cpus-per-task=34
#SBATCH --mem=128gb
#SBATCH --time=1:55:00
#SBATCH --output=/home/zlarionov/Bioinformatics205/HW_last/hm_rna_seq/trimming/star.log
#SBATCH --partition=short
export PATH="/home/zlarionov/.conda/envs/genome/bin/STAR:$PATH"

GENOME_DIR="/projects/mipt_dbmp_biotechnology/GRCh38/"    
READS1="R_trimmed_1.fastq.gz"   
READS2="R_trimmed_2.fastq.gz"
OUTPUT_DIR="trimming"

STAR \
  --runThreadN 32 \
  --runMode alignReads \
  --genomeDir $GENOME_DIR \
  --readFilesIn $READS1 $READS2\
  --readFilesCommand zcat \
  --outFileNamePrefix ${OUTPUT_DIR}/RNA_ \
  --outSAMtype BAM SortedByCoordinate \
  --quantMode GeneCounts

echo "Alignment Done"
