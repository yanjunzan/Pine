#!/bin/bash
#SBATCH --job-name=200712_emmax02_hj_kin_Q_K1.sh1
#SBATCH --output=./out/200712_emmax02_hj_kin_Q_K1.out
#SBATCH --error=./err/200712_emmax02_hj_kin_Q_K1.err
#SBATCH -t 10-00:00:00
#SBATCH -p core -n 1
#SBATCH -A snic2019-8-347 
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yanjunzan@slu.se
wget https://treegenesdb.org/FTP/Genomes/Pita/v1.01/genome/Pita.1_01.fa.gz
wget https://treegenesdb.org/FTP/Genomes/Psme/v1.0/genome/Psme.1_0.fa.gz
wget https://treegenesdb.org/FTP/Genomes/Pita/v1.01/annotation/pita.repeats.final1000.gff.gz
wget https://treegenesdb.org/FTP/Genomes/Pila/v1.0/annotation/pila.repeats.final1000.gff3.gz