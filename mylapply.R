rm(list = ls())
cat("\014")
l <- list(a=1:10, b=11:20)  # the mean of the value in each element
xmean<- lapply(l, mean)
xsum<-lapply(l, sum)

#class(lapply(l, mean))
# the sum of the values in each element

x<-c(1:10)
xmean1<-mean(x)
xsum2<-sum(x)