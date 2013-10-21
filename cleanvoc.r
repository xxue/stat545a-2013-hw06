#First clean the file by dropping an "Order" column since it's non-informative, and remove data that has blank cells.                                                                                                                                
vo <- read.delim("vo.txt", na.strings = "", stringsAsFactors = FALSE)                                                                                                                                
vo$Order <- NULL
vo<-na.omit(vo)
str(vo)

#Latitude and longitide independent of E/W and N/S.
vo <-
  within(vo, {
  lat = ifelse(NS == "N",lat, -lat)
  long = ifelse(EW == "E",long, -long)
  })

#Reorder according to elevation, in case it gets interesting
temp<- vo[with(vo, order(Elev)), ]
tail(temp)
summary(temp)

#write cleaned data to file
write.table(temp, "volcano.tsv", quote = FALSE,
            sep = "\t", row.names = FALSE)
