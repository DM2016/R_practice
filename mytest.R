##my first function
rm(list = ls())

my_first_function <- function(x, y){
  b <- par(x, y)
  z <- cor(x, y)
  return(z)
}


x <- c(-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5)

y <- c(25, 16, 9, 4, 1, 0, 1, 4, 9, 16, 25)

mycor<-my_first_function(x, y)
