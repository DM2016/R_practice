#mutate_practice

library(nycflights13)
library(tidyverse)

flights

flights_sml <- select(flights,
  year:day,
  ends_with("delay"),
  distance,
  air_time
)

mutate(flight_sml,
  gain = arr_delay - dep_delay,
  speed = distance / air_time * 60
)

mutate(?lights_sml,
  gain = arr_delay - dep_delay,
  hours = air_time / 60,
  gain_per_hour = gain / hours
)


transmute(flights,
  gain = arr_delay - dep_delay,
  hours = air_time / 60,
  gain_per_hour = gain / hours
)

transmute(flights,
  dep_time,
  hours = d?p_time %/% 100,
  minute = dep_time %% 100
)

##Creation functions:
(x <- 1:10)
lag(x)
lead(x)
cumsum(x)
cummean(x)

#Ranking
y <- c(1, 2, 2, NA, 3, 4)
min_rank(y)
min_rank(desc(y))
row_number(y)
dense_rank(y)
percent_rank(y)
cume_dist(y)









