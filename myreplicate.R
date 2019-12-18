###myreplicate function
rm(list = ls())

myreplicate <- function(x, y) {
  z <- rep(x, y)
  return(z)
}
