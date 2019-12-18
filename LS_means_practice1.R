rm(list = ls())
library(psych)
library(lsmeans)
library(FSA)
library(car)
library(tidyverse)

Input =("
 Classroom  Sex    Height
        A          Male    151
        A          Male    150
        A          Male    152
        A          Male    149
        A          Female  155
        A          Female  156
        A          Female  157
        A          Female  158
        B          Male    151
        B          Male    150
        B          Female  155
        B          Female  156
        B          Female  157
        B          Female  158
        B          Female  156
        B          Female  157
        ")
Data = read.table(textConnection(Input),header=TRUE)

head(Data)
str(Data)
summary(Data)

### Remove unnecessary objects

rm(Input)

##Arithmetic means
Summarize(Height ~ Classroom,
          data=Data,
          digits=3)

##Least square means
model = lm(Height ~ Classroom + Sex + Classroom:Sex,
           data = Data)

lsmeans(model,
        pairwise ~ Classroom,
        adjust="tukey")

Anova(model)
