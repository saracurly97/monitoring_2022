#R_code_quantitative_estimates_land_cover.r

library(raster)
install.packages("RStoolbox")
library(RStoolbox)
install.packages("ggplot2")
library(ggplot2)

setwd("C:/Users/saras/Desktop/lab/")

# brick 
# 1 listi the files available 
rlist <- list.files(pattern="defor")
rlist
# 2 lapply: apply a function to a list 
list_rast <- lapply(rlist, brick)
list_rast

plot(list_rast[[1]])

#defor: NIR 1, red 2, green 3
plotRGB(list_rast[[1]], r=1, g=2, b=3, stretch="lin")

l1992 <- list_rast[[1]]
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")

l2006 <- list_rast[[2]]
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

#unsupervised classification 
l1992c <- unsuperClass(l1992, nClasses=2)
l1992c

plot(l1992c$map)
# value 1 = agricoltural areas and water 
# value 2 = forests 

freq(l1992c$map)
#      value  count
# [1,]     1  35424
# [2,]     2 305868

# agricultural areas and water (class 1) = 35424
# forest (class 2) = 305868

total <- 341292
propagri <- 35424/total
propforest <- 305868/total

# agriculture and water: 0.1037938
# forest: 0.8962062

# build a dataframe
cover <- c("Forest", "Agriculture")
prop1992 <- c(0.8962062, 0.1037938)

proportion1992 <- data.frame(cover, prop1992)

ggplot(proportion1992, aes(x=cover, y=prop1992, color=cover)) + geom_bar(stat="identity", fill="white")






