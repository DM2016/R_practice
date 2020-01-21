#Tilde practice

rm(list = ls())

setwd("C:/Users/Diego/Documents/Rstudio_practice/Data_Science/chr3/Ex_1_18_2020")

library(tidyverse)
library(tidyr)
library(modelr)
library(MASS)


diamonds

# 1. Look at the data set diamonds to see 
# if there’s a linear relationship between 
# weight and cost of diamonds using tilde operator when graphing

my_diamonds <- lm(carat ~ price, data = diamonds)

coef(my_diamonds)

my_diamonds2 <- diamonds %>%
  data_grid(price) %>%
  add_predictions(my_diamonds, "carat")

my_diamonds3 <- my_diamonds2[1:100, 1:2]

ggplot(my_diamonds3, aes(carat, price)) +
  geom_point()

#there is non linear relationship between both variables

# 2.  Use the animals (see below)dataset to 
# put the data on a log scale and 
# find that it looks much better. 
# As you know the  I or AsIs function does something 
# like the opposite of the tilde operator. 
# It tells the interpreter to go ahead and 
# evaluate the enclosed expression. 
# The general gist is to transform our data to 
# log scale then apply linear modeling. 
# As you remember in the tutorial we have y ~ x + I(x^2), 
# where the operator I(x^2) evaluates x^2 before using it in a formula. 

Animals

Animals2 <- log(Animals)

my_Animals <- lm(brain ~ body + I(body^2), data = Animals2)


coef(my_Animals)

my_animal <- Animals2 %>%
  data_grid(body) %>%
  add_predictions(my_Animals, "brain")

ggplot(Animals2, aes(body, brain)) +
  geom_point()

#better fit
