# Summarizing  the Cereal Data
#
#1. Read the cereal data, and produce quick summaries 
# using str, summary, contents and describe 
# (recall that the last two are in the Hmisc package). 
# Interpret the results.

rm(list = ls())
setwd("C:/Users/Diego/Documents/Rstudio_practice/Data_Science/chr3/Ex_1_11_2020")

library(tidyverse)
library(Hmisc)
library(doBy)

mycereal <- read.csv("Cereals.csv", stringsAsFactors = F)
str(mycereal)
names(mycereal)
head(mycereal)
contents(mycereal)
summary(mycereal)

# 2. Find the average sodium, fiber and carbohydrate contents by Manufacturer.
mycereal2 <- mycereal %>%
  group_by(Manufacturer) %>%
  summarise(
    mean_sodium = mean(sodium, na.rm = T),
    mean_fiber = mean(fiber, na.rm = T),
    mean_carbo = mean(carbo, na.rm = T),
    n = n()
)

# 3. Add a new variable ’SodiumClass’, 
# which is ’high’ when sodium >150 and ’low’ otherwise. 
# Make sure the new variable is a factor. 
# Look at the examples in factors. 
# Now, find the average, minimum and maximum sugar content 
# for ’low’ and ’high’ sodium. 
# Hint: make sure to use na.rm=TRUE, because the dataset contains missing values.

mycereal3a <- mycereal %>%
  group_by(Manufacturer) %>%
  mutate(SodiumClass = ifelse(sodium > 150, "high", "low"))
  
mycereal3a$SodiumClass <-as.factor(mycereal3a$SodiumClass) 
is.factor(mycereal3a$SodiumClass)

mycereal3b <- mycereal3a %>%
  group_by(SodiumClass) %>%
  summarise(
    mean_sugar = mean(sugars, na.rm = T),
    min_sugar = min(sugars, na.rm = T),
    max_sugar = max(sugars, na.rm = T),
    n = n()
  )


# 4.  Find the maximum sugar content by Manufacturer and sodiumClass, 
# using tapply. Inspect the result and notice there are missing values. 
# Try to use na.rm=TRUE as an additional argument to tapply, 
# only to find out that the values are still missing. 
# Finally, use xtabs to count the number of observations by the 
# two factors to find out if we have missing values in the tapply result.
mycereal4 <- mycereal3a %>%
  group_by(Manufacturer, SodiumClass) %>%
  summarise(
    max_sugar = max(sugars, na.rm = T),
    n = n()
  )

# 5. Repeat the previous question with summaryBy. Compare the results.
my_cereal_test<- mycereal3a %>%
  group_by(SodiumClass, Manufacturer) %>%
  summarise(
    mymin = min(sugars)
    )


# 6. Count the number of observations by
# Manufacturer and whether the cereal is ’hot’ or ’cold’, using xtabs.
mycereal6 <- mycereal3a %>%
  group_by(Manufacturer) %>%
  summarise(
      cold_sum = sum(Cold.or.Hot == "C"), 
      hot_sum = sum(Cold.or.Hot == "H")
  )




