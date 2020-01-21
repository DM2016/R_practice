#new exercise set with hydro
rm(list =ls())

library(tidyverse)
library(ggplot2)

setwd("C:/Users/Diego/Documents/Rstudio_practice/Data_Science/chr3/Ex_1_11_2020")

myhydro <- read.csv("Hydro.csv", stringsAsFactors = F)
dim(myhydro)
names(myhydro)
head(myhydro)

#set dates
myhydro$Date <-as.Date(myhydro$Date, "%d/%m/%y")
head(myhydro)

#make line plot
ggplot(data = myhydro, aes(x = Date, y = storage, group = 1)) +
  geom_line() +
  geom_point()

#make the line thicker
ggplot(data = myhydro, aes(x = Date, y = storage, group = 1)) +
  geom_line(colour = 'black', size = 2) +
  geom_point(colour = 'red')

# Next, make the same plot with points (not lines), 
# and change the colour of the points in the following way: 
# forestgreen if storage is over 500, 
# orange if storage is between 235 and 500, and 
# red if storage is below 235 (Hint: you may want to use cut)
ggplot(data = myhydro, aes(x = Date, y = storage, group = 1, colour = qsec)) +
  geom_point(aes(colour = cut(storage, c(-Inf, 235, 500, Inf))),
             size = 3) +
  scale_color_manual(name = "storage",
                     values = c("(-Inf,235]" = "red",
                                "(235,500]" = "orange",
                                "(500, Inf]" = "forestgreen"),
                     labels = c("storage <= 235", "235 < storage <= 500", "storage > 500"))

