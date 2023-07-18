#!/bin/bash

ls results/filtered_reads/*___mouse___filtered.sorted.bam  |\
parallel  -j 20 "htseq-count -f bam -r pos -s reverse -i gene_name {} Mouse/mm10_eGFP.gtf > {.}.counts" 
 
