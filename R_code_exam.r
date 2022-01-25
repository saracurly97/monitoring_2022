# Project Sara Sena – Fire and Temperature in Australia 

# in this R script I will analyze data that are retrievable from Copernicus that regards fire and temperature. I will focus my analysis on Australia. 
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
#install.packages("ncdf4") 
#install.packages("viridis") 
#install.packages("patchwork") 
#install.packages("RStoolbox") 
#install.packages('rgdal',configure.args="--with-proj-include=/sw/proj/4.9.2/include --with-proj-lib=/sw/proj/4.9.2/lib") 
#install.packages("rasterVis") 
#install.packages("ggplot2") 

library(ncdf4)  
library(raster)  
library(RStoolbox)  
library(viridis)   
library(ggplot2)  
library(patchwork)   
library(rgdal)  
library(gridExtra) 


#Now I load the burnt area of the the years. I will analyse if there was decay during that dayand the fires of the whole season

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


#I am going to show first the area that had Decay in those days for the 3 years 
InDecay = stack(BA20192, BA20202, BA20212) 

ID2019 = ggplot() + geom_raster(InDecay$c_gls_BA300.CP.DEKAD_201906100000_AUSTRALIA_PROBAV_V1.1.1, mapping = aes(x=x, y=y, fill=c_gls_BA300.CP.DEKAD_201906100000_AUSTRALIA_PROBAV_V1.1.1)) + guides(fill=guide_legend(title="Date")) + scale_fill_viridis(option="viridis") + ggtitle("Area with Decay_2019") 
ID2020 = ggplot() + geom_raster(InDecay$c_gls_BA300.CP.DEKAD_202006100000_AUSTRALIA_PROBAV_V1.1.1, mapping = aes(x=x, y=y, fill=c_gls_BA300.CP.DEKAD_202006100000_AUSTRALIA_PROBAV_V1.1.1)) + guides(fill=guide_legend(title="Date")) + scale_fill_viridis(option="viridis") + ggtitle("Area with Decay_2020") 
ID2021 = ggplot() + geom_raster(InDecay$c_gls_BA300.NOBS_202106100000_AUSTRALIA_S3_V1.2.1, mapping = aes(x=x, y=y, fill=c_gls_BA300.NOBS_202106100000_AUSTRALIA_S3_V1.2.1)) + guides(fill=guide_legend(title="Date")) + scale_fill_viridis(option="viridis") + ggtitle("Area with Decay_2021") 

grid.arrange(ID2019, ID2020, ID2021, nrow=1) 


#I am going to show all the fires that were burning from the begin of the season 
FirstDaySeasonFire = stack(BA20194, BA20204, BA20214) 

FDSF2019 = ggplot() + geom_raster(FirstDaySeasonFire$c_gls_BA300.FDOB.SEASON_201906100000_AUSTRALIA_PROBAV_V1.1.1, mapping= aes (x=x, y=y, fill=c_gls_BA300.FDOB.SEASON_201906100000_AUSTRALIA_PROBAV_V1.1.1)) + guides(fill=guide_legend(title="Date")) + scale_fill_viridis(option="viridis") + ggtitle("All season fires_2019") 
FDSF2020 = ggplot() + geom_raster(FirstDaySeasonFire$c_gls_BA300.FDOB.SEASON_202006100000_AUSTRALIA_PROBAV_V1.1.1, mapping= aes (x=x, y=y, fill=c_gls_BA300.FDOB.SEASON_202006100000_AUSTRALIA_PROBAV_V1.1.1)) + guides(fill=guide_legend(title="Date")) + scale_fill_viridis(option="viridis") + ggtitle("All season fires_2020") 
FDSF2021 = ggplot() + geom_raster(FirstDaySeasonFire$c_gls_BA300.FDOB.SEASON_202106100000_AUSTRALIA_S3_V1.2.1, mapping= aes (x=x, y=y, fill=c_gls_BA300.FDOB.SEASON_202106100000_AUSTRALIA_S3_V1.2.1)) + guides(fill=guide_legend(title="Date")) + scale_fill_viridis(option="viridis") + ggtitle("All season fires_2021") 

grid.arrange(FDSF2019, FDSF2020, FDSF2021, nrow=1) 

#Now 

#Now I am going to show the max temperature  of the days for the years selected 
MaxTemp = stack(LST20191, LST20201, LST20211) 

MaxTemp2019 = ggplot() + geom_raster(MaxTemp$c_gls_LST10.DC.MAX_201906010000_AUSTRALIA_GEO_V1.2.1, mapping= aes (x=x, y=y, fill=c_gls_LST10.DC.MAX_201906010000_AUSTRALIA_GEO_V1.2.1)) + ggtitle("MaxTemp2019") + guides(fill=guide_legend(title="Temperature")) + scale_fill_viridis(option="plasma") + ggtitle("Max Temperature_2019") 
MaxTemp2020 = ggplot() + geom_raster(MaxTemp$c_gls_LST10.DC.MAX_202006010000_AUSTRALIA_GEO_V1.2.1, mapping= aes (x=x, y=y, fill=c_gls_LST10.DC.MAX_202006010000_AUSTRALIA_GEO_V1.2.1)) + ggtitle("MaxTemp2020") + guides(fill=guide_legend(title="Temperature")) + scale_fill_viridis(option="plasma") + ggtitle("Max Temperature_2020") 
MaxTemp2021 = ggplot() + geom_raster(MaxTemp$c_gls_LST10.DC.MAX_202106010000_AUSTRALIA_GEO_V2.0.1, mapping= aes (x=x, y=y, fill=c_gls_LST10.DC.MAX_202106010000_AUSTRALIA_GEO_V2.0.1)) + ggtitle("MaxTemp2021") + guides(fill=guide_legend(title="Temperature")) + scale_fill_viridis(option="plasma") + ggtitle("Max Temperature_2021") 

grid.arrange(MaxTemp2019, MaxTemp2020, MaxTemp2021, nrow=1) 


#Now I am going to show the min temperature of the days for the years selected 
MinTemp = stack(LST20192, LST20202, LST20212)

MinTemp2019 = ggplot() + geom_raster(MinTemp$c_gls_LST10.DC.MIN_201906010000_AUSTRALIA_GEO_V1.2.1, mapping= aes (x=x, y=y, fill=c_gls_LST10.DC.MIN_201906010000_AUSTRALIA_GEO_V1.2.1))+ guides(fill=guide_legend(title="Temperature")) + scale_fill_viridis(option="plasma") + ggtitle("Min Temperature_2019") 
MinTemp2020 = ggplot() + geom_raster(MinTemp$c_gls_LST10.DC.MIN_202006010000_AUSTRALIA_GEO_V1.2.1, mapping= aes (x=x, y=y, fill=c_gls_LST10.DC.MIN_202006010000_AUSTRALIA_GEO_V1.2.1)) + guides(fill=guide_legend(title="Temperature")) + scale_fill_viridis(option="plasma") + ggtitle("Min Temperature_2020") 
MinTemp2021 = ggplot() + geom_raster(MinTemp$c_gls_LST10.DC.MIN_202106010000_AUSTRALIA_GEO_V2.0.1, mapping= aes (x=x, y=y, fill=c_gls_LST10.DC.MIN_202106010000_AUSTRALIA_GEO_V2.0.1)) + guides(fill=guide_legend(title="Temperature")) + scale_fill_viridis(option="plasma") + ggtitle("Min Temperature_2021") 

grid.arrange(MinTemp2019, MinTemp2020, MinTemp2021, nrow=1) 


#Now I am going to show the median temperature of the days for the years seleceted 
MedianTemp = stack(LST20193, LST20203, LST20213) 

MedianTemp2019 = ggplot() + geom_raster(MedianTemp$c_gls_LST10.DC.MEDIAN_201906010000_AUSTRALIA_GEO_V1.2.1, mapping= aes (x=x, y=y, fill=c_gls_LST10.DC.MEDIAN_201906010000_AUSTRALIA_GEO_V1.2.1)) + guides(fill=guide_legend(title="Temperature")) + scale_fill_viridis(option="plasma") + ggtitle("Median Temperature_2019") 
MedianTemp2020 = ggplot() + geom_raster(MedianTemp$c_gls_LST10.DC.MEDIAN_202006010000_AUSTRALIA_GEO_V1.2.1, mapping= aes (x=x, y=y, fill=c_gls_LST10.DC.MEDIAN_202006010000_AUSTRALIA_GEO_V1.2.1)) + guides(fill=guide_legend(title="Temperature")) + scale_fill_viridis(option="plasma") + ggtitle("Median Temperature_2020") 
MedianTemp2021 = ggplot() + geom_raster(MedianTemp$c_gls_LST10.DC.MEDIAN_202106010000_AUSTRALIA_GEO_V2.0.1, mapping= aes (x=x, y=y, fill=c_gls_LST10.DC.MEDIAN_202106010000_AUSTRALIA_GEO_V2.0.1)) + guides(fill=guide_legend(title="Temperature")) + scale_fill_viridis(option="plasma") + ggtitle("Median Temperature_2021") 

grid.arrange(MedianTemp2019, MedianTemp2020, MedianTemp2021, nrow=1) 

# now I will print together the images of min, median and max temperature 
grid.arrange(MinTemp2019, MinTemp2020, MinTemp2021, MedianTemp2019, MedianTemp2020, MedianTemp2021, MaxTemp2019, MaxTemp2020, MaxTemp2021, nrow = 3, ncol = 3) 


# Now I will print the images of fire that were burning, all the fire of the season and the median temperature 
grid.arrange(FDSF2019, FDSF2020, FDSF2021, MedianTemp2019, MedianTemp2020, MedianTemp2021, nrow = 2, ncol = 3) 
