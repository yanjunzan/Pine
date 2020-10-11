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
db="/home/yanjun/wm/umea/TE/results/ptab"
q1="/home/yanjun/wm/umea/TE/data/LRT/Ty1_copia_RT"
q2="/home/yanjun/wm/umea/TE/data/LRT/Ty3_gypsy_RT"
h1="/home/yanjun/wm/umea/TE/results/Ty1_hits"
h2="/home/yanjun/wm/umea/TE/results/Ty2_hits"
#blastn -task megablast -db Dmel_transcripts_Ensembl/Dmel_genes_all.fa -query blast_query.txt -dust no -max_target_seqs 1 -outfmt "6 qseqid sseqid evalue pident stitle" -out outputfile.txt
tblastn -db $db -query $q1  -max_target_seqs 1000 -evalue 1e-5 -outfmt 6 -out outputfile.txt
tblastn -db $db -query $q2  -max_target_seqs 1000 -evalue 1e-5 -outfmt 6 -out outputfile2.txt

awk '{OFS="\t"}{print $2,$9-20000,$10+20000}' outputfile.txt | xargs -n 3 sh -c 'blastdbcmd -db ptab -entry "$0" -range "$1"-"$2" -outfmt %f'
awk '{OFS="\t"}{print $2,$9-20000,$10+20000}' outputfile2.txt | xargs -n 3 sh -c 'blastdbcmd -db ptab -entry "$0" -range "$1"-"$2" -outfmt %f' > testbcmd.2.txt
