#R code for uploading and visualizing copernicus data in R

install.packages("ncdf4")
install.packages("viridis")
library(ncdf4)
library(raster)
library(viridis)
library(ggplot2)
library(RStoolbox)

# Set the working directory
setwd("C:/Users/saras/Desktop/lab/copernicus")

snow20211214 <- raster("c_gls_SCE_202112140000_NHEMI_VIIRS_V1.0.1.nc")

snow20211214

plot(snow20211214)

cl <- colorRampPalette(c("dark blue","blue","light blue"))(100)

plot(snow20211214, col=cl)

##### à
ggplot() +
geom_raster(snow20211214, mapping = aes(x=x, y=y, fill=Snow.Cover.Extent)) +
scale_fill_viridis()


