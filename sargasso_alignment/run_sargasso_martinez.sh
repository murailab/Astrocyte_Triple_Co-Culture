#! /bin/bash
venv/bin/species_separator rnaseq\
    --reads-base-dir=/Volumes/one/DATA/Astro_Endo_Neuron_RNAseq/sargasso/fastq --best --run-separation --num-threads 30\
    samples_martinez.tsv results_martinez\
    mouse /Volumes/one/DATA/Astro_Endo_Neuron_RNAseq/sargasso/Mouse/\
    rat /Volumes/one/DATA/reference_data/Ensembl/Rat/      
