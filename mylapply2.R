#create a list with 2 elements 
rm(list = ls())
cat("\014") 
# Construct a 5x6 matrix
X<- c(rnorm(30), nrow=5, ncol=6)
X

# Sum the values of each column with `apply()`
apply(x, 2, sum)