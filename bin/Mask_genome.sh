#!/bin/bash
module load bioinfo-tools 
module load RepeatMasker/4.1.0
#lib="/home/yanjun/wm/umea/TE/results/TE_ad_pita_pila_reduced_0.8.fa"

lib="/home/yanjun/wm/umea/TE/data/EDTA_250Mbp.fasta"
out="/home/yanjun/wm/umea/TE/results/test/"
ref1="/home/yanjun/wm/umea/TE/data/genome"$1".fa"
RepeatMasker -nolow  -no_is  -norna  -parallel 20 -lib $lib $ref1 -dir $out
#python batch_submit_bash_scripts.py --bs Mask_genome.sh --nt 20 --nj 8
#echo $ref1