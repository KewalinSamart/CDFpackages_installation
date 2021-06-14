# CDFpackages_installation

### installCDFpkgs_run.R

This is the script used to install CDF packages from BrainArray (http://brainarray.mbni.med.umich.edu/Brainarray/Database/CustomCDF/CDF_download.asp)

- *args[1]* is the path to the folder, namely `mapping_genes`, containing `BrainArrayMapping_withGPL_version.csv`
- *args[2]* is string indicating version of ENTREZG e.g. `"25"` (the latest version)
- *args[3]* is a comma separted list of organism name(s)we want the packages for e.g. `"Mus musculus,Homo sapiens")`

**Example**: downloading and installing CDF packages version 25 for human and mouse data

```r
Rscript installCDFpkgs_run.R path/to/mapping_genes "25" "Mus musculus,Homo sapiens")
```
*Note: all the arguments must be specified for the script to run*
