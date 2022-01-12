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

#day 2
# importing the source script 

setwd("C:/Users/saras/Desktop/lab")
 
source("R_code_source_sdm.r")

# in the theioretical slide of SDMs we should us individuals of a species and
preds 
#these are the predictions: 

#let's ecxplain to the model what are the training and....
datasdm <- sdmData(train=species, predictors=preds)

#model
m1 <- sdm(Occurrence~temperature+elevation+precipitation+vegetation, data=datasdm, methods="glm")

#prediction: map probability
p1 <- predict(m1, newdata=preds)

plot(p1, col=cl)
points(presences, pch=19)

# stack everything together
s1 <- stack(preds, p1)
plot(s1, col=cl)

#
names(s1) <- c("Elevation", "Precipitation", "Temperature", "Vegetation", "Model")
plot(s1, col=cl)










