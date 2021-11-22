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
#defor1_2 = red
#defor1_3 = green

plotRGB(l1992, r=2, g=1, b=3, stretch="Lin")
plotRGB(l1992, r=2, g=3, b=1, stretch="Lin")

#day 2
l2006 <- brick("defor2_.png")
l2006
#plotting the imported image
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")

#par
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")

# let's calculate energy in 1992
dev.off()
dvi1992 <-l1992$defor1_.1 - l1992$defor1_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1992, col=cl)

#calculate energi in 2006 
dvi2006 <-l2006$defor2_.1 - l2006$defor2_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi2006, col=cl)

#differencing two images of energy in two different times
dvidif <- dvi1992 - dvi2006 
# plot the results
cld <- colorRampPalette(c('blue','white','red'))(100)
plot(dvidif, col=cld)

#final plot: original images, dvis, final dvi difference 
par(mfrow=c(3,2))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)
plot(dvidif, col=cld)

pdf("energy.pdf")
par(mfrow=c(3,2))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)
plot(dvidif, col=cld)
dev.off()



