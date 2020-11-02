#A python pipline to generate and submit R scripts
import argparse
import os
import re

parser = argparse.ArgumentParser(description='Submitt R scripts in multiple batches')
parser.add_argument('--bs', help='The name of the bash scripts', type=str)
parser.add_argument('--nt', help='the number of threads to quene', type=int,default=5)
parser.add_argument('--nj', help='the number of jobs to use', type=int)
parser.add_argument('--pid', help='project id, can be either snic2019-8-347 or snic2018-8-107', type=str,default="snic2020-5-469")
parser.add_argument('--tm', help='How long to queue', type=str,default="5-00:00:00")
#parser.add_argument('--s', help='The name of the output script', type=str)
args = parser.parse_args()


def generate_scripts(r=args.bs,nt=args.nt,nj=args.nj,pid=args.pid,tm=args.tm):

    for i in range(nj):
        j = i +1
        outfile = re.sub(".sh","",r) + str(j) +".sh"
        OF = open(outfile,"w")
        print("Creating script" + str(j) + "file "+ outfile)
        print("--------------------------------------------")
        print("#!/bin/bash",file=OF)
        print("#SBATCH --job-name="+outfile+str(j),file=OF)
        print("#SBATCH --output=./out/" + re.sub(".sh","",r) + str(j) +".out",file=OF)
        print("#SBATCH --error=./err/"+ re.sub(".sh","",r) + str(j) +".err",file=OF)
        print("#SBATCH -t " + tm,file=OF)
        print("#SBATCH -p core -n " + str(nt),file=OF)
        print("#SBATCH -A " + pid,file=OF)
        print("#SBATCH --mail-type=ALL",file=OF)
        print("#SBATCH --mail-user=yanjun.zan@slu.se",file=OF)
        #print("module load R/3.3.2",file=OF)
        print("bash /home/yanjun/wm/umea/TE/bin/Pine/bin/" + r + " " + str(j),file=OF)
        OF.close()

        if not os.path.exists(outfile):
            print("job " + str(j) + "file "+ outfile +" does not exist")
        else:
            print("--------------------------------------------")
            os.system("sbatch /home/yanjun/wm/umea/TE/bin/Pine/bin/" + outfile)
            print("job " + str(j) + " file "+ outfile + " submitted")
            print("--------------------------------------------")
            print("--------------------------------------------")
#print
#if "__name__" == "__main__":
print("Start running script")
generate_scripts(r=args.bs,nt=args.nt,nj=args.nj,pid=args.pid,tm=args.tm)
