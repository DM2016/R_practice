#Find the 10 most delayed flights using a ranking function, how would you handle ties?

rm(list = ls())
cat("\014")

library(tidyverse)

flights

#mutate the dep_delay_rank column, min_rank
my_delayed_flights <- flights %>% 
  group_by(flight) %>%
  mutate(dep_delay_rank = min_rank((desc(dep_delay)))
  )

#filter the flights by top 10
my_delayed_flights2 <- my_delayed_flights %>%
  filter(!(dep_delay_rank > 10))
