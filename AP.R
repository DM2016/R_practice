rm(list=ls())
cat("\014")

AP <- function (a,d,n){
  x <- a
  while (length(x) < n){
    position <- length(x)
    new <- x[position] + d
    x <- c(x, new)
  }
  return(x)
}

