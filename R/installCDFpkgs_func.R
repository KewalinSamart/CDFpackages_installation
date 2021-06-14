# created date: 06/14/21
# Kewalin Samart

download_entrezg <- function(path_to_BAMfolder, version, organisms){
  
  #' This function does one-time download ENTREZG from BrainArray 
  #' http://brainarray.mbni.med.umich.edu/Brainarray/Database/CustomCDF/CDF_download.asp
  #' @param path_to_BAMfolder path to the folder containing BrainArrayMapping_withGPL_version.csv
  #' @param version string indicating version of ENTREZG e.g. "25" (the latest version)
  #' @param organisms list containing organism names e.g. list("Mus musculus", "Homo sapiens")
  #' @author Stephanie Hickey, Kewalin Samart
  
  # read in BAMwithGPL file
  BrainArray_with_GPL_df = read.csv(paste0(path_to_BAMfolder,"/","BrainArrayMapping_withGPL_",version,".csv"))
  
  # start timing the function
  tic <- as.integer(as.POSIXct( Sys.time() )) 
  
  # get the corresponding pdNames and dbNames
  pdNames <- list(BrainArray_with_GPL_df$pdName[which(BrainArray_with_GPL_df$organism %in% organisms)])
  dbNames <- list(BrainArray_with_GPL_df$dbName[which(BrainArray_with_GPL_df$organism %in% organisms)])
  
  # installing packages
  for (pdName in pdNames) {
    install.packages(paste0("http://mbni.org/customcdf/",version,".0.0/entrezg.download/pd.", 
                            pdName, 
                            "_",version,".0.0.tar.gz"), 
                     repos = NULL, 
                     type = "source")
  }
  for (dbName in dbNames)
    install.packages(paste0("http://mbni.org/customcdf/",version,".0.0/entrezg.download/", 
                            dbName,
                            ".db_",version,".0.0.tar.gz"), 
                     repos = NULL, 
                     type = "source")
  
  toc <- as.integer(as.POSIXct( Sys.time() )) # store finished time
  print(paste('The time it took in minutes to run the function was',(toc-tic)/60,sep=" "))
}

#################
## Example Run ##
#################
# ## install all CDF packages version "25" for "Mus musculus" and "Homo sapiens" organisms
# library(here)
# starting directory: CDFpackages_installation (this GitHub repo)
# ## set up variables
# path_to_BAMfolder <- here("data/mapping_genes")
# version <- "25"
# organisms <- list("Mus musculus", "Homo sapiens")
# ## run the function to install packages
# download_entrezg(path_to_BAMfolder, version, organisms)
