# R code for chemical cycling study 
# time series of NO2 change in Europe during the lockdown 

library(raster)

# Set the working directory
setwd("C:/Users/saras/Desktop/lab/EN")  # windows

en01 <- raster("EN_0001.png")
# what is the range of the data? (minimum and maximum data)
# https://www.google.com/search?q=R+colours+names&tbm=isch&ved=2ahUKEwiF-77Z1bX0AhULtKQKHQ3WDWYQ2-cCegQIABAA&oq=R+colours+names&gs_lcp=CgNpbWcQAzIECAAQEzoHCCMQ7wMQJzoICAAQCBAeEBNQiQhYnwxgwg1oAHAAeACAAUqIAZYDkgEBNpgBAKABAaoBC2d3cy13aXotaW1nwAEB&sclient=img&ei=vKKgYYWtOovokgWNrLewBg&bih=526&biw=1056#imgrc=OtMzJfyT_OwIiM
cl <- colorRampPalette(c('red','orange','yellow'))(100) 

# plot the no2 values of Jenuary 29020 by the cl palette
plot(en01, col=cl)

# exercise: import the end of March NO2 and plot it 

en13 <- raster("EN_0013.png")
plot(en13, col=cl)

#build a multiframe window with 2 rows and 1 column with the par function
par(mfrow=c(2,1))
plot(en01, col=cl)
plot(en13, col=cl)

# import all the images 
EN01 <- raster("EN_0001.png")
EN02 <- raster("EN_0002.png")
EN03 <- raster("EN_0003.png")
EN04 <- raster("EN_0004.png")
EN05 <- raster("EN_0005.png")
EN06 <- raster("EN_0006.png")
EN07 <- raster("EN_0007.png")
EN08 <- raster("EN_0008.png")
EN09 <- raster("EN_0009.png")
EN10 <- raster("EN_0010.png")
EN11 <- raster("EN_0011.png")
EN12 <- raster("EN_0012.png")
EN13 <- raster("EN_0013.png")

# plot all the data together 
par(mfrow=c(4,4))
plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)

EN <- stack(EN01, EN02, EN03, EN04, EN05, EN06, EN07, EN08, EN09, EN10, EN11, EN12, EN13)
plot(EN, col=cl)

#plot only the first image from the stack 
#check the stack name 
EN
plot(EN$EN_0001, col=cl)

#rgb
plotRGB(EN, r=1, g=7, b=13, stretch="lin")

#----- day2

#importing all the data together with the lapply function
rlist <- list.files(pattern="EN")
rlist

list_rast <- lapply(rlist, raster)
list_rast

EN_stack <- stack(list_rast)
EN_stack

cl <- colorRampPalette(c('red','orange','yellow'))(100) #
plot(EN_stack, col=cl)

#Exercise plot only the first images of the stack: $
plot(EN_stack$EN_0001, col=cl)

#difference (processing the data)
ENdif <- EN_stack$EN_0001 - EN_stack$EN_0013
cldif <- colorRampPalette(c('blue','white','red'))(100)
plot(ENdif, col=cldif) #red part big change(?)

# automeated processing source function
source("R_code_automatic_script.txt")

# paris 
paris(EN)

#direct import 
