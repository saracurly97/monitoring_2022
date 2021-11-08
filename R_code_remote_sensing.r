# R code for ecosystem monitoring by remote sensing 
# first of all, we need to install additional packages
# raster pckage to manage image data 
# https://cran.r-project.org/web/packages/raster/index.html

install.packages("raster")
# C:\Users\saras\AppData\Local\Temp\RtmpoZejaJ\downloaded_packages

library(raster)

# windows
#I have to write this 
setwd("C:/Users/saras/Desktop/lab/")  


# we are going to import satellite data 
# objects cannot be numbers #brick function to import images 
l2011 <- brick("p224r63_2011.grd")

l2011

plot(l2011)
#B1 is the reflectance in the blue band
#B2 is the reflectance in the green band
#B3 is the reflectance in the red band

cl <- colorRampPalette(c("black","grey","light grey"))(100)
plot(l2011,col=cl)

plotRGB(l2011, r=3, g=2, b=1, stretch="Lin")

#------------- day 2

#B1 is the reflectance in the blue band
#B2 is the reflectance in the green band
#B3 is the reflectance in the red band
#B4 is the reflectance in the NIR band

#let's plot the green band 
plot(l2011$B2_sre)

cl <- colorRampPalette (c("black","grey","light grey"))(100)
plot(l2011$B2_sre, col=cl)

# change the colorRampPalette with dark green, green, light green, e.g. clg
clg <- colorRampPalette (c("dark green","green","light green"))(100)
plot(l2011$B2_sre, col=clg)

# do the same for the blue band using "dark blue", "blue", "light blue"
# B1
clb <- colorRampPalette (c("dark blue", "blue", "light blue"))(100)
plot(l2011$B1_sre, col=clb)


# plot both images in just one multiframe graph
par(mfrow=c(1, 2)) # the first number is the number of rows, second is the number of column
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)

# plot both images in just one multiframe graph with two rows and just one column
par(mfrow=c(2, 1))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)

#--- day 3

plot(l2011$B1_sre)

#plot the blue band using a blue colorRampPalette
clb <- colorRampPalette(c("dark blue", "blue", "light blue"))(100)
plot(l2011$B1_sre, col=clb)

#multiframe
par(mfrow=c(1, 2)) 

#plot the blue and the green bedides, with different colorRampPalette
clb <- colorRampPalette(c("dark blue", "blue", "light blue"))(100)
plot(l2011$B1_sre, col=clb)

clg <- colorRampPalette(c("dark green","green","light green"))(100)
plot(l2011$B2_sre, col=clg)

par(mfrow=c(2, 1))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)

# exercise: plot the first four bands with two  rows and two colums 
par(mfrow=c(2, 2))

clb <- colorRampPalette(c("dark blue", "blue", "light blue"))(100)
plot(l2011$B1_sre, col=clb)

clg <- colorRampPalette(c("dark green","green","light green"))(100)
plot(l2011$B2_sre, col=clg)

clr <- colorRampPalette(c("dark red","red","pink"))(100)
plot(l2011$B3_sre, col=clr)

clnir <- colorRampPalette(c("red","orange","yellow"))(100)
plot(l2011$B4_sre, col= clnir)


plotRGB(l2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin")  # false colours
plotRGB(l2011, r=3, g=2, b=4, stretch="Lin") 
plotRGB(l2011, r=3, g=4, b=2, stretch="Lin") 


