# Project Sara Sena – Fire and Temperature in Australia 

# in this R script I will analyze data that are retrievable from Copernicus that regards fire disturbance and land surface temperature. I will focus my analysis on Australia. 
# I will analyze the first 10 days of June of the following years: 2019 - 2020 - 2021 

# Data taken from Australia. I used the Dataset Burnt Area 300m and Land Surface Temperature for the first decade of june 2019 - 2020 - 2021 

# I have created the structure of file 

# I set the directory where I have downloaded the files using the structure

setwd("C:/lab/") 

#install and then Import library raster 
#install.packages("raster", repos="https://rspatial.r-universe.dev") 
#install.packages("terra", repos="https://rspatial.r-universe.dev") 
#install.packages("graster", repos="https://rspatial.r-universe.dev") 
#install.packages("rgdal", repos="https://rspatial.r-universe.dev") 
#install.packages("viridis") 
#install.packages("patchwork") 
#install.packages("RStoolbox") 
#install.packages('rgdal',configure.args="--with-proj-include=/sw/proj/4.9.2/include --with-proj-lib=/sw/proj/4.9.2/lib") 
#install.packages("rasterVis") 
#install.packages("ggplot2") 

library(raster)  
library(RStoolbox)  
library(viridis)   
library(ggplot2)  
library(patchwork)   
library(rgdal)  
library(gridExtra) 


#Now I load the burnt area of the the years. I will analyse if there area burnt during those days and the fires of the whole season

#2019 
BA20192 <- raster("fire_disturbance/OnlyAustralia/2019/20190610/c_gls_BA300-CP-DEKAD_201906100000_AUSTRALIA_PROBAV_V1.1.1.tiff") 
BA20194 <- raster("fire_disturbance/OnlyAustralia/2019/20190610/c_gls_BA300-FDOB-SEASON_201906100000_AUSTRALIA_PROBAV_V1.1.1.tiff") 

#2020  
BA20202 <- raster("fire_disturbance/OnlyAustralia/2020/20200610/c_gls_BA300-CP-DEKAD_202006100000_AUSTRALIA_PROBAV_V1.1.1.tiff")  
BA20204 <- raster("fire_disturbance/OnlyAustralia/2020/20200610/c_gls_BA300-FDOB-SEASON_202006100000_AUSTRALIA_PROBAV_V1.1.1.tiff")  

#2021  
BA20212 <- raster("fire_disturbance/OnlyAustralia/2021/20210610/c_gls_BA300-NOBS_202106100000_AUSTRALIA_S3_V1.2.1.tiff")  
BA20214 <- raster("fire_disturbance/OnlyAustralia/2021/20210610/c_gls_BA300-FDOB-SEASON_202106100000_AUSTRALIA_S3_V1.2.1.tiff") 

 
#Now I load the temperature of the years 

#2019 
LST20191 <- raster("land_surface_temperature/Australia/2019/20190601/c_gls_LST10-DC-MAX_201906010000_AUSTRALIA_GEO_V1.2.1.tiff") 
LST20192 <- raster("land_surface_temperature/Australia/2019/20190601/c_gls_LST10-DC-MIN_201906010000_AUSTRALIA_GEO_V1.2.1.tiff") 
LST20193 <- raster("land_surface_temperature/Australia/2019/20190601/c_gls_LST10-DC-MEDIAN_201906010000_AUSTRALIA_GEO_V1.2.1.tiff") 

#2020 
LST20201 <- raster("land_surface_temperature/Australia/2020/20200601/c_gls_LST10-DC-MAX_202006010000_AUSTRALIA_GEO_V1.2.1.tiff") 
LST20202 <- raster("land_surface_temperature/Australia/2020/20200601/c_gls_LST10-DC-MIN_202006010000_AUSTRALIA_GEO_V1.2.1.tiff") 
LST20203 <- raster("land_surface_temperature/Australia/2020/20200601/c_gls_LST10-DC-MEDIAN_202006010000_AUSTRALIA_GEO_V1.2.1.tiff") 

#2021
LST20211 <- raster("land_surface_temperature/Australia/2021/20210601/c_gls_LST10-DC-MAX_202106010000_AUSTRALIA_GEO_V2.0.1.tiff") 
LST20212 <- raster("land_surface_temperature/Australia/2021/20210601/c_gls_LST10-DC-MIN_202106010000_AUSTRALIA_GEO_V2.0.1.tiff") 
LST20213 <- raster("land_surface_temperature/Australia/2021/20210601/c_gls_LST10-DC-MEDIAN_202106010000_AUSTRALIA_GEO_V2.0.1.tiff") 


#I am going to show first the area that had been burnt in those days for the 3 years 
ID2019 = ggplot() + geom_raster(BA20192, mapping = aes(x=x, y=y, fill=c_gls_BA300.CP.DEKAD_201906100000_AUSTRALIA_PROBAV_V1.1.1)) + guides(fill=guide_legend(title="Date")) + scale_fill_viridis(option="viridis") + ggtitle("Burnt Area 2019")
ID2020 = ggplot() + geom_raster(BA20202, mapping = aes(x=x, y=y, fill=c_gls_BA300.CP.DEKAD_202006100000_AUSTRALIA_PROBAV_V1.1.1)) + guides(fill=guide_legend(title="Date")) + scale_fill_viridis(option="viridis") + ggtitle("Burnt Area 2020")
ID2021 = ggplot() + geom_raster(BA20212, mapping = aes(x=x, y=y, fill=c_gls_BA300.NOBS_202106100000_AUSTRALIA_S3_V1.2.1)) + guides(fill=guide_legend(title="Date")) + scale_fill_viridis(option="viridis") + ggtitle("Burnt Area 2021")

grid.arrange(ID2019, ID2020, ID2021, nrow=1) 


#I am going to show all the fires that were burning from the begin of the season 
FDSF2019 = ggplot() + geom_raster(BA20194, mapping= aes (x=x, y=y, fill=c_gls_BA300.FDOB.SEASON_201906100000_AUSTRALIA_PROBAV_V1.1.1)) + guides(fill=guide_legend(title="Date")) + scale_fill_viridis(option="viridis") + ggtitle("All season fires_2019") 
FDSF2020 = ggplot() + geom_raster(BA20204, mapping= aes (x=x, y=y, fill=c_gls_BA300.FDOB.SEASON_202006100000_AUSTRALIA_PROBAV_V1.1.1)) + guides(fill=guide_legend(title="Date")) + scale_fill_viridis(option="viridis") + ggtitle("All season fires_2020") 
FDSF2021 = ggplot() + geom_raster(BA20214, mapping= aes (x=x, y=y, fill=c_gls_BA300.FDOB.SEASON_202106100000_AUSTRALIA_S3_V1.2.1)) + guides(fill=guide_legend(title="Date")) + scale_fill_viridis(option="viridis") + ggtitle("All season fires_2021") 

grid.arrange(FDSF2019, FDSF2020, FDSF2021, nrow=1) 

#Now 

#Now I am going to show the max temperature  of the days for the years selected 
MaxTemp2019 = ggplot() + geom_raster(LST20191, mapping= aes (x=x, y=y, fill=c_gls_LST10.DC.MAX_201906010000_AUSTRALIA_GEO_V1.2.1)) + guides(fill=guide_legend(title="Temperature")) + scale_fill_viridis(option="plasma") + ggtitle("Max_T_2019") 
MaxTemp2020 = ggplot() + geom_raster(LST20201, mapping= aes (x=x, y=y, fill=c_gls_LST10.DC.MAX_202006010000_AUSTRALIA_GEO_V1.2.1)) + guides(fill=guide_legend(title="Temperature")) + scale_fill_viridis(option="plasma") + ggtitle("Max_T_2020") 
MaxTemp2021 = ggplot() + geom_raster(LST20211, mapping= aes (x=x, y=y, fill=c_gls_LST10.DC.MAX_202106010000_AUSTRALIA_GEO_V2.0.1)) + guides(fill=guide_legend(title="Temperature")) + scale_fill_viridis(option="plasma") + ggtitle("Max_T_2021") 

# grid.arrange(MaxTemp2019, MaxTemp2020, MaxTemp2021, nrow=1) 


#Now I am going to show the min temperature of the days for the years selected 
MinTemp2019 = ggplot() + geom_raster(LST20192, mapping= aes (x=x, y=y, fill=c_gls_LST10.DC.MIN_201906010000_AUSTRALIA_GEO_V1.2.1))+ guides(fill=guide_legend(title="Temperature")) + scale_fill_viridis(option="plasma") + ggtitle("Min_T_2019") 
MinTemp2020 = ggplot() + geom_raster(LST20202, mapping= aes (x=x, y=y, fill=c_gls_LST10.DC.MIN_202006010000_AUSTRALIA_GEO_V1.2.1)) + guides(fill=guide_legend(title="Temperature")) + scale_fill_viridis(option="plasma") + ggtitle("Min_T_2020") 
MinTemp2021 = ggplot() + geom_raster(LST20212, mapping= aes (x=x, y=y, fill=c_gls_LST10.DC.MIN_202106010000_AUSTRALIA_GEO_V2.0.1)) + guides(fill=guide_legend(title="Temperature")) + scale_fill_viridis(option="plasma") + ggtitle("Min_T_2021") 

# grid.arrange(MinTemp2019, MinTemp2020, MinTemp2021, nrow=1) 


#Now I am going to show the median temperature of the days for the years seleceted 
MedianTemp2019 = ggplot() + geom_raster(LST20193, mapping= aes (x=x, y=y, fill=c_gls_LST10.DC.MEDIAN_201906010000_AUSTRALIA_GEO_V1.2.1)) + guides(fill=guide_legend(title="Temperature")) + scale_fill_viridis(option="plasma") + ggtitle("Median_T_2019") 
MedianTemp2020 = ggplot() + geom_raster(LST20203, mapping= aes (x=x, y=y, fill=c_gls_LST10.DC.MEDIAN_202006010000_AUSTRALIA_GEO_V1.2.1)) + guides(fill=guide_legend(title="Temperature")) + scale_fill_viridis(option="plasma") + ggtitle("Median_T_2020") 
MedianTemp2021 = ggplot() + geom_raster(LST20213, mapping= aes (x=x, y=y, fill=c_gls_LST10.DC.MEDIAN_202106010000_AUSTRALIA_GEO_V2.0.1)) + guides(fill=guide_legend(title="Temperature")) + scale_fill_viridis(option="plasma") + ggtitle("Median_T_2021") 

# grid.arrange(MedianTemp2019, MedianTemp2020, MedianTemp2021, nrow=1) 

# now I will print together the images of min, median and max temperature 
grid.arrange(MinTemp2019, MinTemp2020, MinTemp2021, MedianTemp2019, MedianTemp2020, MedianTemp2021, MaxTemp2019, MaxTemp2020, MaxTemp2021, nrow = 3, ncol = 3) 


# Now I will print the images of fire that were burning, all the fire of the season and the median temperature 
grid.arrange(FDSF2019, FDSF2020, FDSF2021, MedianTemp2019, MedianTemp2020, MedianTemp2021, nrow = 2, ncol = 3) 
