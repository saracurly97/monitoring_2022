#R code for estimating energy in ecosystems 


#install packages ("raster")

library(raster)

#set the working directory 
setwd("C:/Users/saras/Desktop/lab")

install.packages("rgdal")
test <- brick("defor1_.png")
plot(test)
library(rgdal)
#import data
l1992 <- brick("defor1_.png") # image of 1992
l1992

# bands: defor1_1, defor1_2, defor1_3
#plotRGB
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")

#defor1_1 = NIR (near infra red)
