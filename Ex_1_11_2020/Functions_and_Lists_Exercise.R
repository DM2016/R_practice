##MY Writing functions and using lists Exercise

rm(list = ls())

setwd("C:/Users/Diego/Documents/Rstudio_practice/Data_Science/chr3/Ex_1_11_2020")

library(tidyverse)

# 1. You learned that you can take subset of a string 
# using the substr function. Fir?t, using that function to extract 
# the first character of a bit of text. 
# Then, write a function called firstTwoChars that extracts 
# the first two characters of any bit of text.

my_word = "Vivaldi"

first_char <- substr(my_word, 1, 1)
first_char_sor?ed <- sort(first_char)

two_letter_extractor <- function(my_word) {
    first_two_char <- substr(my_word, 1, 2)
    first_two_char_sorted <- sort(first_two_char)
    return(first_two_char_sorted)
}

two_letter_extractor(my_word)


# 2. Recall the functions?head and tail. 
# Write a function called middle that shows a few rows around (approx.) 
# the 'middle' of the dataset. Hint: use nrow, print, and possibly floor.


 
# 3. First read the following list:
# 4. veclist <- list(x=1:5, y=2:6, z=3:7)
# 5. Using ?apply, check that all elements of the list
# are vectors of the same length. 
# Also calculate the sum of each element.

veclist <- list(x=1:5, y=2:6, z=3:7)

sapply(veclist, length)
my_veclist_sums <- sapply(veclist, sum)

# 6. Add an element to the list ?alled 'norms' 
# that is a vector of 10 numbers drawn 
# from the standard normal distribution

norms <- as.vector(rnorm(10))

x1 <- 1:6
x2 = as.list(norms)

my_Expanded_veclist <- append(veclist, norms)

# 7. Using the pupae data (see below), 
# use a t-t?st to find if PupalWeight 
# varies with temperature treatment, 
# separate for the two CO2 treatments 
# (so, do two t-tests). Use split and lapply.

my_pupae <- read.csv("pupae.csv", stringsAsFactors = F)

t_test_result_Temp <- t.test(my_pupae$PupalWeigh?[my_pupae$T_treatment=="ambient"], my_pupae$PupalWeight[my_pupae$T_treatment=="elevated"])
t_test_result_CO2 <- t.test(my_pupae$PupalWeight[my_pupae$CO2_treatment=="280"], my_pupae$PupalWeight[my_pupae$CO2_treatment=="400"])

# 8. Read the data coweta.csv ?see below). 
# Then, split the data by species, 
# to produce a list called coweeta_sp. 
# Keep only those species that have at least 10 observations.
# (Hint: first count the number of observations per species, 
# save that as a vector, second which are a? least 10, 
# and use that to subscript the list.) 
# If you don't know how to do this last step, 
# skip it and continue to the next item.

my_coweeta <- read.csv("coweeta.csv", stringsAsFactors = F)
coweeta_sp <- split(my_coweeta, my_coweeta$species)

my?coweeta2 <- my_coweeta %>%
  group_split(species)

# 9. Using the split Coweeta data, 
# perform a linear regression of log10(biomass) on log10(height), 
# separately by species. 

linearReg1 <- lm(log10(biomass)~log10(height), coweeta_sp)


# 10.  Run thi? code to get two vectors:
#   
#   x <- rnorm(100)
# y <- x + rnorm(100)
# 
# Run a linear regression y = f(x), 
# save the resulting object. 
# Look at the structure of this object, 
# and note the names of the elements. 
# Extract the residuals and make ? histogram.

x <- rnorm(100)
y <- x + rnorm(100)

linearReg_Q10 <- lm(x~y)
 
# 11. From question 10 write a function 
# that takes an lm object as an argument, 
# and plots a histogram of the residuals.



