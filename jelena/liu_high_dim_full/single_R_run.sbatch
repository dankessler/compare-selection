#!/bin/bash 
#
#all commands that start with SBATCH contain commands that are just used by SLURM for scheduling
#################
#set a job name  
#SBATCH --job-name=job
#################  
#a file for job output, you can check job progress, append the job ID with %j to make it unique
#SBATCH --output=jobs/%j.out
#################
# a file for errors from the job
#SBATCH --error=jobs/%j.err
#################
#time you think you need; default is 2 hours
#format could be dd-hh:mm:ss, hh:mm:ss, mm:ss, or mm
#SBATCH --time=5:00:00
#################
#SBATCH --qos=normal
#SBATCH -p normal 
#################
#number of nodes you are requesting, the more you ask for the longer you wait
#SBATCH --nodes=1
#################
#SBATCH --mem=16000

# You can use srun if your job is parallel
#srun R CMD BATCH  ./rtest.R 
# otherwise: 

SEED=$1

# cd to program directory
cd /home/users/jelenam/R-selective/tests/liu_high_dim_full

module load R/3.4.0

Rscript cluster.R $SEED 

