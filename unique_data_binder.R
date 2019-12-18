###Create a function that binds any two data sets in csv files and write an output file also given as input
###Inputs:  any two data sets in csv format
###the bind the two first input variables 
###convert the bind variable into a matrix
###Use apply in the matrix to find the average
###Use the bind variable to write a csv file given in the third variable of your function


unique_data_binder <- function(x, y, z) {
  x1 <- read.csv(x, header=T,sep=",")
  y1 <- read.csv(y, header=T,sep=",")
  z1 <- rbind(x1, y1)
  z2 <- as.matrix(z1)
  z3 <- apply(z2, 2, mean)
  write.csv(z1, file = z, row.names = FALSE)
  return(z3)
}

