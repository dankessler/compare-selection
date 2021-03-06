setwd(getwd())
source("test_knockoffs.R")

args = commandArgs(trailingOnly=TRUE)
seed = round(as.numeric(args[1]))
type=toString(args[2])
  
outdir = "/scratch/users/jelenam/full/"
label=paste(type,"_result_", sep="")
outfile = file.path(outdir, paste(sep="",label, toString(seed), ".rda"))

test_knockoffs(seed, outfile, method=type)

