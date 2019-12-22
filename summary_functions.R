##summary functions
rm(list = ls())

library(tidyverse)
library(nycflights13)

flights

#missing values represent cancelled flights
not_cancelled <- flights%>%
  filter(!is.na(dep_delay), !is.na(arr_delay))

#combining aggregation with logical subsetting
not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(
    #average delay:
    avg_delay1 = mean(arr_delay),
    #average positive delay
    avg_delay2 = mean(arr_delay[arr_delay > 0])
  )

#measures of spread:
#standard deviation: sd
#interquartile range: IQR
#median absolute deviation
not_cancelled %>%
  group_by(dest) %>%
  summarize(distance_sd = sd(distance)) %>%
  arrange(desc(distance_sd))

##Measures of rank
#min(x), 
#max
#quantile: (x, 0.25)
#quantiles represent a generalization of the median

#when do the first and last flights leave each day?
not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(
    first = min(dep_time),
    last = max(dep_time)
  )

#filtering on ranks
#we have all variables, with each observation in a separate row
not_cancelled %>%
  group_by(year, month, day) %>%
  mutate(r = min_rank(desc(dep_time))) %>%
  filter(r %in% range(r))

#counts
#count the number of distinct (unique) values
not_cancelled %>%
  group_by(dest) %>%
  summarize(carriers = n_distinct(carrier)) %>%
  arrange(desc(carriers))

#returns count
not_cancelled %>%
  count(dest)

# uses a weight variable (wt) to count the total number of miles that a plane flew
not_cancelled %>%
  count(tailsum, wt = distance)

#counts and proportions of logical sums
not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(n_early = sum(dep_time < 500))

#what proportions of flights are delayed by over an hour
not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(hour_perc = mean(arr_delay > 60))

#grouping by multiple variables
daily <- group_by(flights, year, month, day)
(per_day <- summarize(daily, flights = n()))
(per_month <- summarize(per_day, flights = sum(flights)))
(per_year <- summarize(per_month, flights = sum(flights)))

#ungrouping
daily %>%
  ungroup() %>%      #no longer grouped by date
  summarize(flights = n()) #all flights
  








