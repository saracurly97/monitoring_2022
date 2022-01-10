#riguarda lezioni #R code for species distribution

#install.packages("sdm")
#install.packages("rgdal")
#or:install.packages(c("sdm", "rgdal"))

library(sdm)
library(raster) #predictors
library(rgdal) #species

#species data
file <- system.file("external/species.shp", package="sdm")

file 

species <- shapefile(file) #exactly as the raster function for raster files

#how many occurrence are there? subset a dataframe
presences <- species[species$Occurrence == 1,]
absences <- species[species$Occurrence == 0,]

#plot!
plot(species, pch=19)

#plot presences and absences
plot(presences, pch=19, col="blue")
points(absences, pch=19, col="red") #add points at the previus points

#let's look at the predictors
path <- system.file("external", package="sdm")

lst <- list.files(path, pattern='asc', full.name=T)

# you can use the lapply function wih the raster .......
preds <- stack(lst)

cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

plot(preds$elevation, col=cl)
points(presences, pch=19)

plot(preds$temperature, col=cl)
points(presences, pch=19)

plot(preds$vegetation, col=cl)
points(presences, pch=19)

plot(preds$precipitation, col=cl)
points(presences, pch=19)