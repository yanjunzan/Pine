#!/bin/bash
#SBATCH --job-name=200712_emmax02_hj_kin_Q_K1.sh1
#SBATCH --output=./out/200712_emmax02_hj_kin_Q_K1.out
#SBATCH --error=./err/200712_emmax02_hj_kin_Q_K1.err
#SBATCH -t 10-00:00:00
#SBATCH -p core -n 1
#SBATCH -A snic2019-8-347 
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yanjunzan@slu.se
module load  bioinfo-tools
module load BEDTools/2.29.2
ref1="/home/yanjun/wm/umea/TE/data/Pila.1_0.fa"
ref2="/home/yanjun/wm/umea/TE/data/Pita.1_01.fa"
gff1="/home/yanjun/wm/umea/TE/data/pila.repeats.final1000.gff3"
gff2="/home/yanjun/wm/umea/TE/data/pita.repeats.final1000.gff"
fo1="/home/yanjun/wm/umea/TE/results/Pila.1_0_repeats.fa"
fo2="/home/yanjun/wm/umea/TE/results/Pita.1_01_repeats.fa"
bedtools getfasta  -fi $ref1 -bed $gff1 -fo $fo1
