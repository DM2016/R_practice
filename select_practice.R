library(tidyverse)
library(nycflights13)


select(flights, year, month, day)
select(flights, year:day)
select(flights, -(year:day))

select(flights, starts_with("a"))
select(flights, ends_with("e"))
select(flights, contains("delay"))
select(flights, matche?("dep"))

data2 <- flights
colnames(data2) <- sprintf("x%d", 1:19)  #num_range refers to columns, us
select(data2, num_range("x", 8:11))

filter(flights, year == 2013, month == 1)

select(flights, time_hour, air_time, everything())

select(flights, year, y?ar)

select(flights, contains("TIME"))

select(flights, contains("TIME", ignore.case = FALSE))

