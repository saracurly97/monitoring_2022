#R code for uploading and visualizing copernicus data in R

install.packages("ncdf4")
library(ncdf4)

# Set the working directory
setwd("C:/Users/saras/Desktop/lab/copernicus")

snow20211214 <- raster("c_gls_SCE_202112140000_NHEMI_VIIRS_V1.0.1.nc")

snow20211214

plot(snow20211214)
