#Hawkes Practice Ch 4.4
library(janitor)
library(tidyverse)

beer <- read.csv("C:/Users/Diego/Desktop/BioinformaticTraining/R_practice/Beers_and_Breweries.csv", header = F)[-c(1:3),]
beer1 <- beer %>%
  row_to_names(row_number = 1)

beer2 <- beer1 %>%
  dplyr::rename("brewery_name" = "brewery name",
                "beer_style" = "beer style",
                "beer_name" = "beer name")

#question 1
# Which craft beer has the highest Alcohol by Volume (ABV) 
# of the beers brewed in Astoria? 
# Give the name of the beer and the brewery. 
# Please ensure the spelling and capitalization 
# of your answer matches the spelling and 
# capitalization of the beer and brewery names 
# as given in the data set. 
# Please also note that any additional spaces 
# or characters in your answer may cause the 
# answer to be evaluated as incorrect.

astoria_beer <- beer2 %>%
  dplyr::filter(city == "Astoria") %>%
  dplyr::arrange(desc(abv))

# question 2:
# For the Astoria Brewing Company, 
# how many different beers in the IPA style 
# do they make?

astoria_beer2 <- beer2 %>%
  dplyr::filter(brewery_name == "Astoria Brewing Company" & city == "Astoria") %>%
  dplyr::filter(grepl("IPA", beer_style))

table(astoria_beer2$beer_style)

#question 3:
# Which craft beer has the highest Alcohol by Volume (ABV) 
# of the beers brewed in Boston? Give the name of the beer and the brewery.
Boston_beer <- beer2 %>%
  dplyr::filter(city == "Boston") %>%
  dplyr::arrange(desc(abv))

#question 4
# For the Harpoon Brewery, how many different beers 
# in the IPA style do they make?
Harpoon_brewery <- beer2 %>%
  dplyr::filter(brewery_name == "Harpoon Brewery") %>%
  dplyr::filter(grepl("IPA", beer_style))

#question 5
# What is the mean and standard deviation of the ABV values for the 
# craft beers made by the Boston Beer Company? 

#Boston_beer_stats <- Boston_beer %>%

abv <- as.data.frame(Boston_beer$abv)
abv1 <- unlist(abv)
abv2 <- as.numeric(as.character(abv1))


mean(abv2)
sd(abv2)

#question 6
#What is the average price of homes 
#with more than 1 acre? In MT Pleasant, 
#near charleston, sc
#Round to the nearest cent.
mt_pleasant_Q6 <- read.csv("C:/Users/Diego/Desktop/BioinformaticTraining/R_practice/Mount_Pleasant_Real_Estate_Data.csv", header = T) #[-c(1:3),]

mt_pleasant_Q6_A1 <- mt_pleasant_Q6 %>%
  filter(Acreage > 1.0) %>%
  separate(List.Price, c(NA, "Price"), sep = "\\$")

mt_pleasant_Q6_A1$Price <- as.numeric(gsub(",","", mt_pleasant_Q6_A1$Price))
  

price <- as.data.frame(mt_pleasant_Q6_A1$Price)
price1 <- unlist(price)
price2 <- as.numeric(as.character(price1))

mean(price2)
sd(price2)

#Q7 What is the minimum price of the homes
# with over 1 arce and its price 
# per square foot? Round to the nearest cent 
# if necessary.

min(price2)

#Q8
# What is the maximum price of the homes 
# with this amount of acreage and its 
# price per square foot?
# Round to the nearest cent if necessary.

max(price2)

#Q9
# What is the mean and standard deviation 
# of the ABV values for the craft beers made 
# by the Ska Brewing Company? 
# Round any intermediate calculations, 
# if needed, to no less than six decimal 
# places, and round your final answer to 
# four decimal places.

ska_brewery <- beer2 %>%
  dplyr::filter(brewery_name == "Ska Brewing Company") 

ska_abv <- ska_brewery$abv
mean(as.numeric(as.character(ska_abv)))
sd(as.numeric(as.character(ska_abv)))

#CV (sd/mean *100)
(0.01113927/0.05991667) * 100

#Q10
# What is the average price of homes in 
# this subdivision Park West? 
# Round to the nearest cent.

mt_pleasant_Q10_A1 <- mt_pleasant_Q6 %>%
  filter(Subdivision == "Park West") %>%
  separate(List.Price, c(NA, "Price"), sep = "\\$")


mt_pleasant_Q10_A1$Price <- as.numeric(gsub(",","", mt_pleasant_Q10_A1$Price))
mean(mt_pleasant_Q10_A1$Price)

#Q12
# What is the minimum price of the 
# homes in this subdivision and its 
# price per square foot? 
# Round to the nearest cent if necessary.
min(mt_pleasant_Q10_A1$Price)

#Q13
#Now get the max price and cost/sq ft
max(mt_pleasant_Q10_A1$Price)

price <- as.data.frame(mt_pleasant_Q6_A1$Price)
price1 <- unlist(price)
price2 <- as.numeric(as.character(price1))
