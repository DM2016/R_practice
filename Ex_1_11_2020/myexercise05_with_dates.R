rm(list = ls())
library(tidyverse)
library(data.table)
library(readxl)
library(Hmisc)
library(chron)
cat("\014") 
#C:\Users\awm2\Desktop\Academic and Old Files\Diego\R-Tutorial
setwd("C:/Users/awm2/Desktop/Academic and Old Files/Diego/R-Tutorial/Rscience/Practice")

library(chron)
# dtimes = c("2002-06-09 12:45:40","2003-01-29 09:30:40",
#            "2002-09-04 16:45:40","2002-11-13 20:00:40",
#             "2002-07-07 17:30:40")
# dtparts = t(as.data.frame(strsplit(dtimes,' ')))

# # row.names(dtparts) = NULL
# dt1<-as.matrix(dtparts)
# mymonth <- format(as.Date(dt1[,1]), "%B")
# hfemet <- read.csv("HFEmet2008.csv")
# dtparts <-strsplit(hfemet,' ')
# mymonth <-format(as.Date(dt1[,1]), "%B")

library(chron)
my_HFEmet2008 <- read.csv("HFEmet2008.csv", stringsAsFactors = F)

dim(my_HFEmet2008)
names(my_HFEmet2008)
contents(my_HFEmet2008)
head(my_HFEmet2008)

#set dates
my_HFEmet2008$myDate <- t(as.data.frame(strsplit(my_HFEmet2008$DateTime,' ')))
row.names(my_HFEmet2008$myDate ) = NULL
# convert to standrad american form
my_HFEmet2008mymonth <- format(as.Date(my_HFEmet2008$myDate[,1], format="%m/%d/%Y"))
row.names(my_HFEmet2008mymonth) = NULL
# now extract the month
my_HFEmet2008mymonth1 <- format(as.Date(my_HFEmet2008mymonth), "%B")
mymonth<- mutate(my_HFEmet2008,month=my_HFEmet2008mymonth1)