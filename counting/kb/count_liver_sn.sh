#!/bin/bash
# generate count matrices from human liver (andrews ms, donor 4)

#sn c72
kb count --verbose \
-i ../ref/refdata-gex-GRCh38-2020-A/kallisto/index.idx \
-g ../ref/refdata-gex-GRCh38-2020-A/t2g_grch38.txt \
-x 10xv3 \
-o ./liver_andrews_c72_sn/ \
-t 30 -m 30G \
-w ../datasets/liver_andrews/sn/whitelist.txt \
-c1 ../ref/refdata-gex-GRCh38-2020-A/kallisto/cdna_t2c.txt \
-c2 ../ref/refdata-gex-GRCh38-2020-A/kallisto/intron_t2c.txt \
--workflow lamanno --filter bustools --overwrite --loom \
../datasets/liver_andrews/sn/b2f/MacParland_Sonya__C72_NUC_TST_3pr_v3_0_1_HT3CTDMXX/bamtofastq_S1_L001_R1.fastq.gz \
../datasets/liver_andrews/sn/b2f/MacParland_Sonya__C72_NUC_TST_3pr_v3_0_1_HT3CTDMXX/bamtofastq_S1_L001_R2.fastq.gz \
../datasets/liver_andrews/sn/b2f/MacParland_Sonya__C72_NUC_TST_3pr_v3_0_1_HT3CTDMXX/bamtofastq_S1_L002_R1.fastq.gz \
../datasets/liver_andrews/sn/b2f/MacParland_Sonya__C72_NUC_TST_3pr_v3_0_1_HT3CTDMXX/bamtofastq_S1_L002_R2.fastq.gz
