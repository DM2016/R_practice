rm(list = ls())
cat("\014")
movies <- c("SPYDERMAN","BATMAN","VERTIGO","CHINATOWN")
movies_lower <-lapply(movies, tolower)
str(movies_lower)

mtcars

dt <- mtcars
lmn_cars <- lapply(dt, min)
smn_cars <- sapply(dt, min)
lmn_cars
