#!/bin/bash
#SBATCH --job-name=small_test
#SBATCH --output=./out/small_test
#SBATCH --error=./err/small_test
#SBATCH -t 2-00:00:00
#SBATCH -p core -n 8
#SBATCH -A snic2020-5-469
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yanjunzan@slu.se

ref="/home/yanjun/wm/umea/TE/data/ref/ys.pilon2.fa"
idfile=($(ls /home/yanjun/wm/umea/TE/data/ref/Pt_IDS/ | grep "xls" ))
out="/home/yanjun/wm/umea/TE/data/ref/Pt_IDS/"
for i in "${idfile[@]}"
do
    #echo $i
    t="${i%.id.xls}"
    refn="/home/yanjun/wm/umea/TE/data/ref/Pt_IDS/"$t
    idf="/home/yanjun/wm/umea/TE/data/ref/Pt_IDS/"$i
    #echo $idf
    #echo $ref
    #echo $refn
    python fish_seq.py $idf $ref $refn &
done
wait
#python fish_seq.py