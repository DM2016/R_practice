##function merge datasets

data_binder <- function(x, y){
  x1 <- read.csv(x, header=T,sep=",")
  y1 <- read.csv(y, header=T,sep=",")
  z <- rbind(x1, y1)
  
  return(z)
}


