###mylist_function.R
rm(list = ls())
cat("\014") 

library(tidyverse)
library(data.table)
library(readxl)

mylist_function <- function(x, y, z) {
  myData <- read.csv(x, header=T, sep = ",")
  myData1<- read.csv(y, header=T, sep = ",")
  #head(myData)
  myData3<-rbind(myData,myData1)
  myData33<-as.matrix(myData3$Expression)
  mysum<-apply(myData33,2,mean)
  write.csv(myData3, file = z, row.names = FALSE)
  return(mysum)
}
