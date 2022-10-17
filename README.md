# Overview
This repository contains all of the simulation and analysis code for the manuscript "Transient and delay chemical master equations", a discussion of the prospects for solving and applying delay master equations in the context of RNA sequencing. In the first part of the report, we numerically solve a fairly generic set of systems with gene switching and mixed Markovian/non-Markovian downstream processing.  In the second part, we analytically solve a set of bursty two-species systems with delayed steps, fit single-cell and single-nucleus RNA sequencing data, and compare the fits to draw conclusions about model suitability and identifiability.

# Repository contents

* `metadata/`: All dataset metadata. Brain metadata were obtained from NeMO ([single-cell](https://data.nemoarchive.org/biccn/grant/u19_zeng/zeng/transcriptome/scell/10x_v3/mouse/processed/analysis/10X_cells_v3_AIBS/), [single-nucleus](https://data.nemoarchive.org/biccn/grant/u19_zeng/zeng/transcriptome/sncell/10x_v3/mouse/processed/analysis/10X_nuclei_v3_AIBS/)). Liver metadata were obtained from [GSE185477](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE185477) at GEO.

* `counting/`: All scripts used to generate and pseudoalign FASTQ files.

  * `liver/`: scripts to download and process liver data.
  
    * `sc/`: bash scripts to `wget` SRA files and `fasterq-dump` them to biological and technical read FASTQ files.
    * `sn/`: bash scripts to `wget` BAM file and `
