# script to run download_entrezg() function to install needed CDF packages from BrainArray
# created date: 06/14/21
# Kewalin Samart

library(stringr)

source("R/installCDFpkgs_func.R")

args <- commandArgs(TRUE)

path_to_BAMfolder <- args[1]
version <- args[2]
organisms <- str_split(args[3],",")

download_entrezg(path_to_BAMfolder, version, organisms)
