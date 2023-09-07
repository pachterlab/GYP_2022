[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.8122410.svg)](https://doi.org/10.5281/zenodo.8122410)

# Overview
This repository contains all of the simulation and analysis code for the manuscript ["Transient and delay chemical master equations"](https://www.biorxiv.org/content/10.1101/2022.10.17.512599v1), a discussion of the prospects for solving and applying delay master equations in the context of RNA sequencing. In the first part of the report, we numerically solve a fairly generic set of systems with gene switching and mixed Markovian/non-Markovian downstream processing.  In the second part, we analytically solve a set of bursty two-species systems with delayed steps, fit single-cell and single-nucleus RNA sequencing data, and compare the fits to draw conclusions about model suitability and identifiability.

# Repository contents

* `metadata/`: All dataset metadata. Brain metadata were obtained from NeMO ([single-cell](https://data.nemoarchive.org/biccn/grant/u19_zeng/zeng/transcriptome/scell/10x_v3/mouse/processed/analysis/10X_cells_v3_AIBS/), [single-nucleus](https://data.nemoarchive.org/biccn/grant/u19_zeng/zeng/transcriptome/sncell/10x_v3/mouse/processed/analysis/10X_nuclei_v3_AIBS/)). Liver metadata were obtained from [GSE185477](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE185477) at GEO.
* `counting/`: All scripts used to generate and pseudoalign FASTQ files.
  * `liver/`: scripts to download and process liver data.
    * `sc/`: bash scripts to `wget` SRA files and `fasterq-dump` them to biological and technical read FASTQ files. Whitelist with all barcodes.
    * `sn/`: bash scripts to `wget` BAM file and process with `bamtofastq`. Whitelist with all barcodes.
  * `kb/`: scripts to pseudoalign datasets using `kb-python`. 
* `polyA_ref/`: poly(A) count and gene length references, copied from the [*Monod* example repository](https://github.com/pachterlab/monod_examples); used for internal QC but not for analysis.

# Installation

The following packages were used to perform the analyses:
```
kb-tools 0.26.0
monod 0.2.6.0
numdifftools 0.9.40
pandas 1.2.4
numpy 1.23.2
scipy 1.9.1
loompy 3.0.6
matplotlib 3.6.0
PyMC 3.11.5
Theano-PyMC 1.1
```

*Monod* was used to filter data. The MCMC procedure was performed on fifty 3.7GHz cores on a dedicated server. Raw data and results results are available on [Zenodo](https://zenodo.org/record/8122410). The simulations can be immediately reproduced using Google Colaboratory. 

# Reproducibility guide

To obtain brain FASTQ files, download them from NeMO. To obtain liver FASTQ files, use the scripts in `counting/liver/` to convert BAM or SRA files.

To obtain whitelists for the liver dataset, run `gg220908_liver_whitelist.ipynb`. 

To generate count matrices, build a `kb` intronic reference (as described [previously](https://github.com/pachterlab/GP_2021_3/tree/master/processing_scripts/make_references)) and run the scripts in `counting/kb/` to obtain spliced and unspliced count matrices in the `loom` format. The results of the `kb` pipeline are available on [Zenodo](https://zenodo.org/record/8122410).

To run the inference pipeline, run `gg230620_mcmc_allen.ipynb` and `gg230621_mcmc_liver.ipynb` using the `loom` files and annotations. This will perform the following tasks:
* Filter cells.
* Select a set of genes with at least moderate expression in all datasets for a category.
* Extract their count data to a *Monod* `SearchData` or `sd` object.
* Use PyMC3 to obtain model parameter posteriors for each gene, using the *Monod* solvers for likelihood functions.
* Generate `pickle` files for each search, comprising a list of PyMC3 traces. 

To generate Figures 1c, 2, 3, S3, and S4 run `gg230612_BF_analysis.ipynb` using the data and result files. These files are available on [Zenodo](https://zenodo.org/record/8122410), as are the intermediate results. This notebook also generates Supplementary Data File 1 (`gg230705_smc_results.xlsx`).

To generate Figure S1, run `delay_cat_sim_twospec` and `delay_cauchy.ipynb`. To generate Figure S2, run `gg220909_telegraph.ipynb`.

Some derivations in the manuscript are partially automated using MATLAB scripts. To reproduce the moment calculations, run `gg230629_odesolv.mlx`. To reproduce the characteristic calculations, run `gg220629_2species_moments.m`.
