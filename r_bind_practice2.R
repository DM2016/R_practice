#write a function that takes 3 inputs: 2 inputs are the data files, 
#1 input is the name of the file to which the output will be saved

setwd("C:/Users/Diego/Documents/Rstudio_practice/Data_Science/chr3")

file_maker <- function(x, y, z) {
  x1 <- read.csv(x, header=T,sep=",")
  y1 <- read.csv(y, header=T,sep=",")
  z1 <- rbind(x1, y1)
  a <- write(z1, file = z)
  return(a)
}
