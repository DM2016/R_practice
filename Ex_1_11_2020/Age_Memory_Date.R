#Ex4 Jan 11 2020

# 1.  Using the ’Age and memory’ dataset (see below how to read this dataset), 
# find the mean and maximum number of words 
# recalled by ’Older’ and ’Younger’ age classes.

rm(list = ls())
setwd("C:/Users/Diego/Documents/Rstudio_practice/Data_Science/chr3/Ex_1_11_2020")

library(tidyverse)
my_eysenck <- read.table("eysenck.txt",  header=TRUE)

dim(my_eysenck)
names(my_eysenck)
contents(my_eysenck)
head(my_eysenck)

my_eysenck2 <- my_eysenck %>%
  group_by(Age) %>%
  summarise(
    mean_Words = mean(Words, na.rm = T),
    max_Words = max(Words, na.rm = T),
    n = n()
  )

# 2. Using the HFE weather dataset find the mean air temperature by month. 
# To do this, first add the month variable into de data set.
library(chron)
my_HFEmet2008 <- read.csv("HFEmet2008.csv", stringsAsFactors = F)

dim(my_HFEmet2008)
names(my_HFEmet2008)
contents(my_HFEmet2008)
head(my_HFEmet2008)

#set dates
my_HFEmet2008$myDate <- t(as.data.frame(strsplit(my_HFEmet2008$DateTime,' ')))
row.names(my_HFEmet2008$myDate ) = NULL
# convert to standrad american form
my_HFEmet2008mymonth <- format(as.Date(my_HFEmet2008$myDate[,1], format="%m/%d/%Y"))
row.names(my_HFEmet2008mymonth) = NULL
# now extract the month
my_HFEmet2008mymonth1 <- format(as.Date(my_HFEmet2008mymonth), "%B")
mymonth<- mutate(my_HFEmet2008,month=my_HFEmet2008mymonth1)



my_HFEmet2008_B <- mymonth %>%
  group_by(month) %>%
  summarise(
    mean_air_temp = mean(Tair, na.rm = T),
    n = n()
  )

