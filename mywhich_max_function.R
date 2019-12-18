##mywhich_max_function

rm(list = ls())
cat("\014")

library(tidyverse)
library(data.table)
library(readxl)
 
mywhich_max_function <- function(x, y, z) {
  myData <- read.csv(x, header=T, sep = ",")
  myData1 <- read.csv(y, header=T, sep = ",")
  myData3 <? rbind(myData,myData1)
  myData33 <- as.matrix(myData3$Expression)
  myIndex <- which.max(myData33)
  write.csv(myData3, file = z, row.names = FALSE)
  return(myIndex)
}
