##### This script wil read in the three YWCA data sets and get them in a format that is app ready
library(tidyverse)
library(readr)

# readin in data 
hr_data <- read_csv('data/hr_stats.csv')
time_data <- read_csv('data/stats_over_time.csv')
total_data <- read_csv('data/total_stats.csv')

