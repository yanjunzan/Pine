#!/bin/bash
#SBATCH --job-name=200712_emmax02_hj_kin_Q_K1.sh1
#SBATCH --output=./out/200712_emmax02_hj_kin_Q_K1.out
#SBATCH --error=./err/200712_emmax02_hj_kin_Q_K1.err
#SBATCH -t 10-00:00:00
#SBATCH -p core -n 6
#SBATCH -A snic2019-8-347 
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yanjunzan@slu.se
module load bioinfo-tools cd-hit
fasta="/home/yanjun/wm/umea/TE/results/Pila.1_0_repeats_5_10k.fa"
out="/home/yanjun/wm/umea/TE/results/Pila.1_0_repeats_5_10k_reduced.fa"
# first index the ref
cd-hit-est -i $fasta -o $out -M 22000 -T 4 -mask NX -c 0.8
