##### This script wil read in the three YWCA data sets and get them in a format that is app ready
library(tidyverse)
library(readr)
library(reshape2)

# readin in data 
hr_data <- read_csv('data/hr_stats.csv')
time_data <- read_csv('data/stats_over_time.csv')
total_data <- read_csv('data/total_stats.csv')


# explore time data
str(time_data)
time_data <- as.data.frame(time_data)

# make data long 
time_data <- melt(time_data, id.vars = 'Category')

# rename category to year
names(time_data)[1] <- 'year'

rm(hr_data, total_data)
# save the new data

save.image('data/time_data.RData' )



