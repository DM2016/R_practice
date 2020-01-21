#MY practices 1_18_2020

rm(list = ls())

setwd("C:/Users/Diego/Documents/Rstudio_practice/Data_Science/chr3/Ex_1_18_2020")

library(tidyverse)

# 1. Read the dataset ('train.csv'), 
# into a passengers dataframe. 
# Check out the first several 
# observat?ons of your dataframe passengers.

passengers <- read.csv('train.csv', stringsAsFactors = F)
dim(passengers)
names(passengers)
mode(passengers)


# 2. Obtain a summary of 
# the dataframe passengers.

passengers_summary1 <- summary(passengers)

# 3. Now ob?ain a new summary 
# but using drop_na(), 
# i.e no NA's should be in the summary.

passengers_summary2 <- summary(drop_na(passengers))


# 4. Get only the passengers that are male (use filter)
male_passengers <- passengers %>%
  filter(Sex == "male")

# 5? Re-arrange your passenger by 
# the Fare paid (increasing), use arrange

passengers_fare <- passengers %>%
  arrange(Fare)

# 6. Try re-arranging the 
# passenger by decreasing Fare.

passengers_fare2 <- passengers %>%
  arrange(desc(Fare))
 
# 7. Make a ?ew variable FamSize, 
# in passengers dataframe,  
# by adding  the variable Parch 
# (which is the number of parents and children)  
# with SibSp (which is the number of siblings and spouses).

passengers2 <- passengers %>%
  mutate(family = Parch + SibSp)

# 8. Now that you have your extra variable, 
# you can ask other questions, such as 
# "Is it possible that larger family have a lower rate of survival?". 
# To test this hypothesis, 
# arrange the new dataframe in step 8 
# by decreasing FamSize.

passe?gers3 <- passengers2 %>%
  arrange(desc(family))

#the larger the family size the lower the survival rate

# 9. However, as zeroes and ones don't 
# often say a great deal, create new data 
# frame by mutating the values of the 
# Survived variable to stri?gs No and Yes.

require(dplyr)
passengers4 <- passengers2 %>%
  mutate(Survived = ifelse(Survived == 0,"No","Yes"))


# 10.  Create a barplot of Sex to see 
# how many males and females were 
# recorded aboard the Train.

ggplot(data = passengers) + 
  stat_count(mapping = aes(x = Sex, fill = Sex))

# 11. Create a scatterplot of 
# Fare vs age (any correlation between the two?)

ggplot(data = passengers) +
  geom_point(
    mapping = aes(x = Age, y = Fare)
  )

# 12. Modify the previous plot and color each point by Sex, 
# to see any correlations between Sex, Age and Fare.

ggplot(data = passengers) +
  geom_point(
    mapping = aes(x = Sex, y = Fare)
  )

#A box plot makes more sense here

ggplot(data = passengers, mapping = aes(x = Sex, y = Fare)) +
  geom_boxplot()

# 13. Visualizing three variables 
# (two numeric ones, Age and Fare, and one categorical one, Sex) 
# on one plot is pretty cool, but what if you wanted 
# to throw the Survived variable into the mix 
# to see if there are any apparent trends? 
#?You can do this with faceting, which is a way to 
# produce multiple plots simultaneously  (use facet_grid()).


ggplot(data = passengers) +
  geom_point(mapping = aes(x = Age, y = Fare)) +
  facet_grid(Sex ~ Survived)

# 14.  Use the summarise() verb to find out the mean fare paid
passenger_fare <- passengers %>%
  summarise(
    mean_fare = mean(Fare),
    n = n()
  )

# 15.  Use filter() and summarise() verbs 
# to find out the mean fare paid among men.

male_passenger_fare <- passengers %>%
  filter(Sex == "male") %>%
  summarise(
    men_mean_fare = mean(Fare),
    n = n()
  )

# 16. Use the filter() and summarise() verbs 
# to find out the mean fare paid among women 
# and how many women survived.
female_passengersA <- passengers %>%
  filter(Sex == "fem?le") %>%
  count(Survived) 

female_passengersB <- passengers %>%
  filter(Sex == "female") %>%
  summarise(
    female_mean_fare = mean(Fare),
    n = n()
  )


# 17.  Use the group_by() and summarise() verbs 
# to find the mean fare and number of survivo?s as a function of sex:. 

passengersC <- passengers %>%
  group_by(Sex) %>%
  count(Survived) 

passengerD <- passengers %>%
  group_by(Sex) %>%
  summarise(
    mean_fare = mean(Fare),
    n = n()
  )






