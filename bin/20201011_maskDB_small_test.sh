#!/bin/bash
#SBATCH --job-name=small_test
#SBATCH --output=./out/small_test
#SBATCH --error=./err/small_test
#SBATCH -t 10-00:00:00
#SBATCH -p core -n 20
#SBATCH -A snic2020-5-469
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yanjunzan@slu.se
module load bioinfo-tools 
module load RepeatMasker/4.1.0
lib="/home/yanjun/wm/umea/TE/results/TE_ad_pita_reduced_0.8.fa"
out="/home/yanjun/wm/umea/TE/results/"
ref1="/home/yanjun/wm/umea/TE/data/genome1.fa"
RepeatMasker -nolow  -no_is  -norna  -parallel 20 -lib $lib $ref1 -dir $out
