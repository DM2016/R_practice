library(tidyverse)
library(nycflights13)

arrange(flights, year, month, day)
arrange(flights, desc(arr_delay))

df <- tibble(x = c(5, 2, NA))
arrange(df, x)
arrange(df, desc(x))

#Ex1
arrange(df, x)
arrange(flights, desc(is.na(dep_time)), dep_time)

#Ex2
a?range(flights, desc(dep_delay))
arrange(flights, dep_delay)        

#Ex3
arrange(flights, air_time)  

#Ex4
flights1 <- mutate(flights, speed = distance / air_time * 60)
flights2 <- select(flights1, year, month, day, flight, origin, distance, air_time, sp?ed)
flights3 <- arrange(flights2, desc(speed))

                    