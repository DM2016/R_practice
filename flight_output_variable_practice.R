a <- seq(1,10)
sprintf("name_%02d", a)
sprintf("flights_%02d", a)


write.csv(d[i], file.path(path.out, file=sprintf("flights_%02d", names(d)[i], ".csv")), row.names = F)
