#Consider a dataset of sequential measurements of a person’s weight 
#while on a diet (the ’weightloss’ dataset, see attached).

#1. Read the dataset (‘weightloss.csv’), and 
# convert the ’Date’ variable to the Date class 
rm(list = ls())

setwd("C:/Users/Diego/Documents/Rstudio_practice/Data_Science/chr3/Ex_1_11_2020")

library(tidyverse)

my_weightloss <- read.csv("weightloss.csv", stringsAsFactors = F)

my_weightloss$Date <- format(as.Date(my_weightloss$Date), format = "%m/%y/%d")
row.names(my_weightloss$Date) = NULL




#2.  Add a new variable to the dataset, 
# with the subjects’s weight in kilograms (kg) ( kg = 2.204 pounds).

my_weightloss2 <- my_weightloss %>%
  mutate(Weight_kg = Weight / 2.204)

#3. Produce a line plot that shows weight (in kg) versus time.
#make line plot
ggplot(data = my_weightloss2, aes(x = Date, y = Weight_kg, group = 1)) +
  geom_line() +
  geom_point()

# #4.  The problem with the plot you just produced
# is that all measurements are connected by a line, 
# although we would like to have line breaks for the 
# days where the weight was not measured. 
# To do this, construct a dataframe based on the weightloss 
# dataset that has daily values. 
# Hints:
#   
# • Make an entirely new dataframe, with a Date variable, 
# ranging from the first to last days in the weightloss dataset, 
# with a step of one day 
# 
# • Using merge, paste the Weight data onto this new dataframe. 
# Check for missing values. Use the new dataframe to make the plot.

library(data.table) 

my_weightloss3 <- as.data.frame(seq(as.Date("2005-02-10"), as.Date("2005-05-16"), "days"))
names(my_weightloss3)[1] <- "Date"
my_weightloss3$Date <- format(as.Date(my_weightloss3$Date), format = "%m/%d/%y")

my_weightloss4 <- left_join(my_weightloss3, my_weightloss2, by = "Date")

ggplot(data = my_weightloss4, aes(x = Date, y = Weight_kg, group = 1)) +
  geom_line(colour = 'black', size = 1) +
  geom_point(colour = 'red')


# #5. Based on the new dataframe you just produced, 
# graph the daily change in weight versus time. 
# Also add a dashed horizontal line at y=0
view(my_weightloss4$Weight_kg)
my_y=diff(my_weightloss4$Weight_kg)
my_y<-c(0,my_y)
ggplot(data = my_weightloss4, aes(x = Date, y = my_y, group = 1)) +
  geom_line(colour = 'black', size = 1) +
  geom_point(colour = 'red') +
  geom_hline(yintercept=0, color = "forestgreen")


