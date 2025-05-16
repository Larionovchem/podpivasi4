#!/bin/bash
#SBATCH --job-name=stringtie_assembly
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G
#SBATCH --output=/home/zlarionov/Bioinformatics205/HW_last/hm_rna_seq/trimming/trimming/strtie.log
#SBATCH --partition=short

# Загрузка необходимых модулей (если требуется)
export PATH="/home/zlarionov/.conda/envs/genome/bin/stringtie:$PATH"

# Пути к данным
BAM_FILE="RNA_Aligned.sortedByCoord.out.bam"  # BAM-файл после выравнивания     # Референсный GTF (опционально)
OUTPUT_GTF="transcripts.gtf" # Выходной файл

# Запуск StringTie
stringtie $BAM_FILE -o $OUTPUT_GTF -p $SLURM_CPUS_PER_TASK