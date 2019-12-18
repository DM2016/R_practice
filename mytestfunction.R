##my first function
rm(list = ls())

my_first_function <- function(x, y){
  b <- plot(x, y, main = "Parabola", xlab = "New X", ylab = "New Y", pch = 20)
  z <- cor(x, y)
  return(z)
}


x <- c(-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5)

y <- c(25, 16, 9, 4, 1, 0, 1, 4, 9, 16, 25)

mycor<-my_first_function(x, y)

rm(list = ls())

my_second_function <- function(a) {
  x1 <- sum(a)
  xn <- sum(a^2)
  xf <-c(x1, xn)
  return(xf)
}

a <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)


zz <- my_second_function(a)
zz
##my third function

rm(list = ls())

highlight <- function(x, y) {
  x <- content
  y <- wrapper
  z <- c(y, x, y)
  return(z)
}





