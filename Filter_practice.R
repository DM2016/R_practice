##Filter practice
library(nycflights13)
library(tidyverse)

flights

filter(flights, month == 1, day == 1)

##save flight info from New Years Day
jan1 <- filter(flights, month == 1, day == 1)
(jan1 <- filter(flights, month == 1, day == 1))

#filter flights on dec 25 and save to dec25 variable, print dec25
(dec25 <- filter(flights, month == 12, day == 25))

##error in filter, month needs to use ==
filter(flights, month = 1)

#correct version b/c it uses finite precision arithmetic
near(sqrt(2)^2, 2) 
near(1/49 *49, 1) 

##Filter w/ logical operators
filter(flights, month == 11 | month == 12)
nov_dev <- filter(flights, month %in% c(11, 12))
filter(flights, arr_delay <= 120, dep_delay <= 120)
filter(flights, !(arr_delay > 120 | dep_delay > 120))

#NA values
is.na(x)
df <- tibble(x = c(1, NA, 3))
filter(df, x > 1)
filter(df, is.na(x) | x > 1)

##Exercises
Ex1A <- filter(flights, arr_delay >= 2)
Ex1A

Ex1B <- filter(flights, dest = IAH | dest = HOU)
Ex1B <- filter(flights, dest == IAH | dest == HOU)
Ex1B <- filter(flights, dest == "IAH" | dest == "HOU")
Ex1B
view(Ex1B)

Ex1C <- filter(flights, carrier == "UA" | carrier == "American" | carrier == "Delta")
view(Ex1C)
Ex1C <- filter(flights, carrier == "United" | carrier == "American" | carrier == "Delta")
view(Ex1C)
Ex1C <- filter(flights, carrier == "United" | carrier == "Am" | carrier == "Del")
view(Ex1C)
Ex1C <- filter(flights, carrier == "UA" | carrier == "Am" | carrier == "Del")
view(Ex1C)
Ex1C <- filter(flights, carrier == "UA" | carrier == "AM" | carrier == "DEL")
view(Ex1C)
flights$carrier
Ex1C <- filter(flights, carrier == "UA" | carrier == "AA" | carrier == "DL")
Ex1C

view(flights)
Ex1D <- filter(flights, month == 7 & month == 8 & month == 9)
Ex1D
view(Ex1D)
Ex1D <- filter(flights, month == 7)
view(Ex1D)
Ex1D <- filter(flights, month == 7 | month == 8 | month == 9)
view(Ex1D)

Ex1E <- filter(flights, arr_delay >= 120 & dep_delay <= 0)
Ex1E

Ex1F <- filter(flights, dep_delay >= 60 & arr_delay - dep_delay >= 30)
Ex1F <- filter(flights, dep_delay >= 60,  arr_delay - dep_delay >= 30)

Ex1G <- filter(flights, dep_time <= 600,  dep_time == 2400 )
view(Ex1G)


#Ex2 <- filter(flights, dep_time(between (000:600)))
#Ex2 <- filter(flights, between(dep_time(000:600))
#Ex2 <- filter(flights, between(dep_time(000:600)))

#Ex2
#Between can be used as a range between numbers
summer_flights2 <- filter(flights, between(month, 7, 9))


#Ex3
missing_dep_time <- filter(flights, is.na(dep_time))
missing_arr_time <- filter(flights, is.na(arr_time))

#Ex4
#A. any number raise by 0 is 1
#B. NA | TRUE returns a TRUE value
#C. NA | FALSE returns a FALSE value
#D. NA * 0 returns an inf value, which is read as NaN










