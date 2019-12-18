##summarize practice
rm(list = ls())
cat("\014")

library(tidyverse)
library(nycflights13)

flights

summarize(flights, delay = mean(dep_delay, na.rm = TRUE))
by_day <- group_by(flights, year, month, day)
summarize(by_day, delay = mean(dep_delay, na.rm = T?UE))

#combine muliple operations with pipe
#find relationship between distance and average delay for each location

#version 1 un piped:
by_dest <- group_by(flights, dest)
delay <- summarize(by_dest,
  count = n(),
  dist = mean(distance, na.rm = TRUE),
 ?delay = mean(arr_delay, na.rm = TRUE)
)

delay <- filter(delay, count > 20, dest != "HNL")

#plot the data
ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
geom_point(aes(size = count), alpha = 1/3) +
geom_smooth(se = FALSE)

#Version with Pipe

?

