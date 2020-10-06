#!/bin/bash
#SBATCH --job-name=makedb
#SBATCH --output=./out/makedb.out
#SBATCH --error=./err/makedb.err
#SBATCH -t 18:00:00
#SBATCH -p core -n 2
#SBATCH -A snic2020-5-469
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yanjunzan@slu.se
module load bioinfo-tools 
module load blast/2.10.1+
ref_1mb="/home/yanjun/wm/umea/TE/results/ptb_1mb.fa"
#out="/home/yanjun/wm/umea/TE/results/ptab"
log="/home/yanjun/wm/umea/TE/results/ref_1Mb_makedb.log"
makeblastdb -in $ref_1mb -dbtype nucl -title Pinus_tabuliformis -parse_seqids -out /home/yanjun/wm/umea/TE/results/ptab -logfile $log
