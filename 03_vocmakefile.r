vooutputs <- c("volcano.tsv", "vocmap.png")
list.files(pattern = "*.png$")
file.remove(vooutputs)
         
#Run the two scripts
source("01_cleanvoc.r")
source("01_plotvoc.r")
