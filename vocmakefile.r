vooutputs <- c("volcano.tsv", "vocmap.png")
list.files(pattern = "*.png$"
file.remove(vooutputs)
         
#Run the two scripts
source("cleanvoc.R")
source("plotvoc.R")
