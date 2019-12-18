###Create a function to read a csv file, (this is one input variable)
###save the results in two files, these are 2 new input variables in your function
###Add the rows of the input file, save the result in second variable name
###add columns, and save the result in third variable name
###concatenate the results of sum of rows and sum of columns into one variable. this is your return variable.
###test your code with the attached csv file

rm(list =ls())

row_add_function <- function(x, y, z) {
  x1 <- read.csv(x, header=T, sep = ",")
  x2 <- as.matrix(x1)
  x3 <- apply(x2, 1, sum)
  write.csv(x3, file = y, row.names = FALSE)

  z1 <- apply(x2, 2, sum)
  write.csv(z1, file = z, row.names = FALSE)
  
  total = rbind(x3, z1)
  
  return(total) 
}
