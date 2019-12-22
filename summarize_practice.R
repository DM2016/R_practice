##summarize practice
rm(list = ls())
cat("\014")

library(tidyverse)
library(nycflights13)

flights

#summarize the average dep_delay in the dataset flights, with na.rm = true
summarize(flights, delay = mean(dep_delay, na.rm = TRUE))

#analyzes multiple groups of variable/columns
by_day <- group_by(flights, year, month, day)
summarize(by_day, delay = mean(dep_delay, na.rm = TRUE))

#combine muliple operations with pipe
#find relationship between distance and average delay for each location

#version 1 un piped:
by_dest <- group_by(flights, dest)
delay <- summarize(by_dest,
  count = n(),
  dist = mean(distance, na.rm = TRUE),
  delay = mean(arr_delay, na.rm = TRUE)
)

delay <- filter(delay, count > 20, dest != "HNL")

#plot the data
ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
geom_point(aes(size = count), alpha = 1/3) +
geom_smooth(se = FALSE)

#Version with Pipe

delays2 <- flights %>% 
  group_by(dest) %>%
  summarize(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
    )%>%
  filter(count > 20, dest != "HNL")
  
flights %>%
  group_by(year, month, day) 

##Missing values
flights %>%
  group_by(year, month, day) %>%
  summarize(mean = mean(dep_delay))

#remove NA values
flights %>%
  group_by(year, month, day) %>%
  summarize(mean = mean(dep_delay, na.rm = TRUE))

#missing values represent cancelled flights
not_cancelled <- flights%>%
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>% 
  group_by(year, month, day) %>%
  summarize(mean = mean(dep_delay))

##count the nonmissing data values of plane with highest avg delays
delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarize(
    delay = mean(arr_delay)
  )

##plot the information of the planes with the highest avg delays
ggplot(data = delays, mapping = aes(x = delay)) +
  geom_freqpoly(binwidth = 10)

#get a scatterplot of delayed planes
delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarize(
    delay = mean(arr_delay, na.rm = TRUE),
    n = n()
  )

ggplot(data = delays, mapping = aes(x = n, y = delay)) +
  geom_point(alpha = 1/10)

#filtering out groups with the smallest number of observations
#will allow us to see more of the pattern of interest 
#and less of the extremr variation in small groups

delays %>% 
  filter(n > 25) %>%
  ggplot(mapping = aes(x = n, y = delay)) +
    geom_point(alpha = 1/10)







