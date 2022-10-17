#!/bin/bash
# generate count matrices from sc human liver (andrews ms, donor 4)

#sc c72
kb count --verbose \
-i ../ref/refdata-gex-GRCh38-2020-A/kallisto/index.idx \
-g ../ref/refdata-gex-GRCh38-2020-A/t2g_grch38.txt \
-x 10xv2 \
-o ./liver_andrews_c72_sc/ \
-t 30 -m 30G \
-w ../datasets/liver_andrews/sc/whitelist.txt \
-c1 ../ref/refdata-gex-GRCh38-2020-A/kallisto/cdna_t2c.txt \
-c2 ../ref/refdata-gex-GRCh38-2020-A/kallisto/intron_t2c.txt \
--workflow lamanno --filter bustools --overwrite --loom \
../datasets/liver_andrews/sc/SRR16227578_2.fastq \
../datasets/liver_andrews/sc/SRR16227578_3.fastq \
../datasets/liver_andrews/sc/SRR16227579_2.fastq \
../datasets/liver_andrews/sc/SRR16227579_3.fastq \
../datasets/liver_andrews/sc/SRR16227580_2.fastq \
../datasets/liver_andrews/sc/SRR16227580_3.fastq \
../datasets/liver_andrews/sc/SRR16227581_2.fastq \
../datasets/liver_andrews/sc/SRR16227581_3.fastq \
../datasets/liver_andrews/sc/SRR16227582_2.fastq \
../datasets/liver_andrews/sc/SRR16227582_3.fastq \
../datasets/liver_andrews/sc/SRR16227583_2.fastq \
../datasets/liver_andrews/sc/SRR16227583_3.fastq
