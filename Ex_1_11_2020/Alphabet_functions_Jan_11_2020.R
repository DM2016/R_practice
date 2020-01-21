#Exercise 1
# In this exercise you will practice a bit more working with text, 
# using the lyrics of the song 'Alphabet Aerobics' by Blackalicious. 
# The lyrics are provided as a text file, 
# which we can most conveniently read into a vector with readLi?es, like this,
# lyric <- readlines("alphabet.txt")

rm(list = ls())

library(tidyverse)
library(data.table)

setwd("C:/Users/Diego/Documents/Rstudio_practice/Data_Science/chr3/Ex_1_11_2020")

# 1.Read the text file into a character vector like above. 
# Count the number of characters in each line (Hint : use nchar).

lyric <- readLines("alphabet.txt")
length(lyric)
char_num_lyric <- as.data.frame(nchar(lyric))

# 2.	Extract the first character of each line and store it in a vector. 
# Now sort this vector alphabetically and compare it to the unsorted vector. 
# Are they the same? (Hint : use the == operator to compare the two vectors). 
# How many are the same, that is, how many of the first letters are 
# actually in alphabetical order already?

first_char <- substr(lyric, 1, 1)
first_char_sorted <- sort(first_char)

compare_vectors <- first_char == first_char_sorted
compare_vectors_count <- as.numeric(length(compare_vectors[compare_vectors == TRUE]))
#11 first letters are already alphabetically ordered   

# 3.	Find the most frequent word used in the lyrics.
# To do this, first paste all lyrics together into one string, 
# then split the string into words, remove commas, then count the words. 
# You may need to create your own function 
# (Hint : use a combinat?on of paste, strsplit, gsub, table and sort)

most_common_word1 <- function(x) {
  y <- paste(x, collapse = ' ')
  y2 <- gsub(",", "", y)
  y3 <- strsplit(y2, " ")
  y4 <- sort(table(y3), decreasing = T)
  y5 <- head(y4)
  return(y5)
}


most_common_word1(lyric)

# library(tidytext)
# library(dplyr)
# 
# data_frame(lyric = text) %>% 
#   unnest_tokens(word, text) %>%    # split words
#   anti_join(stop_words) %>%    # take out "a", "an", "th?", etc.
#   count(word, sort = TRUE)    # count occurrences





    