#More Factors practice

rm(list = ls())

setwd("C:/Users/Diego/Documents/Rstudio_practice/Data_Science/chr3/Ex_1_18_2020")

library(tidyverse)

# 1. Read pupae data
# This dataset contains a temperature (T_treatment)
# and CO2 treatment (CO2_treatment). Both should logically be factors, 
# however, CO2_treatment is read as numeric
# Check the structure of pupae to verify this assumption
# str(pupae) convert CO2_treatment into a factor,
# re-check the pupae table (str(pupae))

my_pupae <- read.csv("pupae.csv")
head(my_pupae)

mode(names(my_pupae[1]))
mode(names(my_pupae[2]))
mode(my_pupae$T_treatment)
mode(my_pupae$CO2_treatment)
str(my_pupae)

my_pupae$CO2_treatment <- as.factor(my_pupae$CO2_treatment)
str(my_pupae)

# 2. Consider the data set Allometry.csv
# a) How many levels does the variable species have?

my_allometry <- read.csv("Allometry.csv", stringsAsFactors = F)
str(my_allometry)
my_allometry$species <- as.factor(my_allometry$species)
str(my_allometry)
print(my_allometry)
#3 levels

# b) Re-arrange the levels in this order “PSME","PIMO","PIPO"

# sizes <- relevel(sizes, "medium")
# sizes
#my_allometry$species <- relevel(my_allometry$species, “PSME")

#my_allometry2 = factor(my_allometry, levels(my_allometry)[c(“PSME","PIMO","PIPO")])

my_allometry$species <- factor(my_allometry$species, levels=c("PSME","PIMO","PIPO"))
print(my_allometry$species)


#x = factor(x,levels(x)[c(4,5,1:3)])
# c) Create a new factor called treeSizeClass  
# based on the diameter variable, 
# if diameter is less than 10 call it “small” otherwise “large”.
# Verify that this correct once you finished the code.

my_allometry3 <- my_allometry %>%
  mutate(
    treeSizeClass = if_else(diameter > 10, "large", "small")
  )
str(my_allometry3)
my_allometry3$treeSizeClass <- as.factor(my_allometry3$treeSizeClass)
str(my_allometry3)

# d) Modify the treeSizeClass to include “small","medium", or “large” 
# using the following  breaks=c(0,25,50,75),

# data2cut<- 
#   cut(data1, breaks = c(1, 3.25, 5.50, 7.75, 10),
#       labels = c("1-3.25", "3.25-5.50", "5.50-7.75", "7.75-10"),
#       include.lowest = TRUE)

my_allometry3$treeSizeClass <- cut(my_allometry3$diameter,  breaks=c(0,25,50,75),
                     labels=c("small","medium","large"))

table(my_allometry3$treeSizeClass)


