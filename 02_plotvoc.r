library(ggplot2)
library(maps)

#Import the saved cleaned data from source1
vo <- read.delim("volcano.tsv")
summary(vo)

#Get the world map
world_map <- map_data("world")
#Make a base plot
p <- ggplot() + coord_fixed()
#Then add the map to this plot
base_world <- p + geom_polygon(data=world_map,
                               aes(x=long,
                                   y=lat,
                                   group=group))


#Set the data to be plotted
geo_data <- data.frame(long=vo$long,
                       lat=vo$lat,
                       elev=vo$Elev,Type=vo$Type,
                       Facet=rep(vo$Status, 3),2)

#Plot the volcano data onto this map, control the colour and area according to volcano type and elevation
base_world+geom_point(data=geo_data, aes(x=long,y=lat,size=elev,colour=Type),position="jitter",
                      alpha=I(0.3))
ggsave("vocmap.png")

base_world+geom_point(data=geo_data, aes(x=long,y=lat,size=elev,colour=Type),position="jitter",
                      alpha=I(0.6)) + facet_wrap(~Facet)

ggsave("vocmaptype.png")
