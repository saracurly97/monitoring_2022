# this is my first code in github! Quite exciting, right? 

# Here are the input data 
# Costanza data on streams
water <- c(100, 200, 300, 400, 500)
water

# Marta data on fishes genomes
fishes <- c(10, 50, 60, 100, 200)
fishes

#plot the diversity of fishes (y) versus the amount of water (x)
# a function is used with arcuments inside! 
plot(water, fishes)

# the data we developed can be stored in a table 
# a table in R is called data frame

streams <- data.frame(water, fishes)
streams


# from now on, we are going to important and/or export data

# setwd for windows (where is the folder)
setwd("C:/Users/saras/Desktop/lab/")

#let's export our table!
write.table(streams, file="my_first_table.txt")

#some colleagues did send us a table how to import it in R?
read.table("my_first_table.txt")
#let's assign it to an object uinside R
saratable <- read.table("my_first_table.txt")

#the first statistics for lazy beautiful people
summary(saratable)

#marta does not like water
#marta wants to get info only on fishes
summary(saratable$fishes)

#histogram
hist(saratable$fishes)
hist(saratable$water)


