#MY evening practices 1_18_2020

rm(list = ls())

setwd("C:/Users/Diego/Documents/Rstudio_practice/Data_Science/chr3/Ex_1_18_2020")

library(tidyverse)

#1. Read student_assignment_data.csv into a list

student1 <- read.csv("student_assignment_data.csv", stringsAsFactors = F)
student2 <- as.list(student1)

#2. Create a function called add_cfa_col (.data) 
# that adds a column in the list indicating whether 
# the student got the correct answer on their first attempt 
# (“cfa”). Input the data, output a list with the extra column

add_cfa_col <- function(df) {
  df2 <- mutate(df, cfa = if_else(correct == 1 & attempts == 1, "Yes", "No"))
  return(df2)
}

student3 <- add_cfa_col(student1)

# 3. Create a function summarize_student_performance(.data, group_col) 
# with two input parameters data that 
# summarizes student performance group by either   
# student_id, assignment_id, or question_number. 
# Return a list with the summary 
# Note that in this case group_col is not a keyword, 
# i.e. the problem is,  
# group_by already expects a “bare” symbol naming that column; 
# if you tell it to group_by(group_col), 
# it will look for a column named “group_col” 
# in the data, fail to find that column, and throw an error. 
# You need to tell it to translate the parameter 
# you send in to the name of a column. 
# To do this, we need two functions from rlang: 
# ensym and !! (pronounced “bang-bang”). 
# First, = we tell our function “think of this parameter as a symbol” 
# using the ensym function, rlang::ensym(group_col). 
# Then we’ll tell group_by to process the code we gave it 
# rather than looking for a column named “rlang::ensym(group_col)” 
# with !!, !!rlang::ensym(group_col). 
# I think of !! as telling group_by 
# “It’s not group_col, but it’s also not not group_col.”
# 
# See beginning of the function below
summarize_student_performance <- function(.data, group_col) {
  mySummary <- .data %>%  
    group_by(!!rlang::ensym(group_col)) %>%
    summarise(
      mean_correct = mean(correct), 
      mean_viewed_hint = mean(viewed_hint), 
      mean_requested_solution = mean(requested_solution)
  )
  return(mySummary)
}

summarize_answer1 <- summarize_student_performance(student1, question_number)


# 4. Summarize with multiple parameters: 
# Modify the summarize_student_performance function 
# by including three dots … to include multiple parameters at once  like this
# 
# summarize_student_performance <- function(.data, …){
#   .data<-  group_by(.data, !!!rlang::ensyms(…))
#   
#   #   Complete the rest
#   )
# return(mySummary)
# }
# 
# Note the difference you have three !!! 
# in the new function versus 2 !! in the old one, 
# as well as ensym vs ensyms ( one extra s)
# Call the function
# 
# mysummary<-summarize_student_performance(student_assignment_data,assignment_id, question_number)

summarize_student_performance2 <- function(.data, ...) {
  mySummary <- .data %>% 
    dplyr::group_by(!!!rlang::ensyms(...)) %>% 
    dplyr::summarize(
      mean_correct = mean(correct), 
      mean_viewed_hint = mean(viewed_hint), 
      mean_requested_solution = mean(requested_solution)
    )
  return(mySummary)
}

summarize_answer2 <- summarize_student_performance2(student1, assignment_id, question_number)


# 5. Create function to mutate the integer columns correct, 
# view_hint and requested_solution to logical (TRUE/FALSE).

require(dplyr)
student4 <- student1 %>%
  mutate(
    correct = ifelse(correct == 0,"FALSE","TRUE"),
    viewed_hint = ifelse(viewed_hint == 0,"FALSE","TRUE"),
    requested_solution = ifelse(requested_solution == 0,"FALSE","TRUE")
    )

# 6. More with !!rlang. Take the mtcars dataset 
# that group the dataset by any column (dist, speed, etc.) 
# and summarizes by the mean of the column. 
# Notice that column name is a variable 
# use knowledge of point 2 and 3 above.

summarize_cars <- function(.data, group_col) {
  mySummary <- .data %>%  
    group_by(!!rlang::ensym(group_col)) %>%
    summarise(
      mean_mpg = mean(mpg), 
      mean_hp = mean(hp), 
    )
  return(mySummary)
}

summarize_cars1 <- summarize_cars(mtcars, cyl)


# 7. More exercises in function. 
# Write both_na() function that 
# takes to vectors of the same length 
# and returns the number of positions 
# that have an NA in both vectors.

both_na <- function(x, y) {
  x1 <- sum(is.na(x))
  y1 <- sum(is.na(y))
  z <- c(x1, y1)
  return(z)
}

vector1 <- c(1, NA, 3, NA, 5)
vector2 <- c(2, 4, 6, NA, 10)

both_na(vector1, vector2)

# 8. Create a function that finds the 
# match of the letters AC in  strings of characters, 
# the output should be a list of the indexes 
# 
# Inputs:  strings like the one below 
# 
# strings<- c("abcd","ACdc","zcac","dcAC","myActc", "tenAC", "ACten")
# mymatch<-c(“AC”)
# 
# output: indexes of the matched strings

string_matcher <- function(x, y) {
  x1 <- x
  z <- grep(y, x1, value = F) #add value = TRUE if you want the actual values where it was matched to
  return(z)
}

# AC_extractor <- function(x, y) {
#   x <- string
#   z <- grep(y, x, value = TRUE)
#   return(z)
# }

strings <- c("CAAC","GGTT","GACT","TTTT","AAAA", "CACG", "GGGG")
mymatch <- c("AC")

string_matcher(strings, mymatch)
