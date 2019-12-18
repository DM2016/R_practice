# dir.input <- file.path("Users", "Diego", "Documents", "Rstudio_practice", "Data_Science", "chr3", "R_practice_data_sets", "Ex2")
# in.data1 <- file.path(dir.input, "Data1.csv")
# in.data2 <- file.path(dir.input, "Data2.csv")
# dir.out <- file.path("Users", "Diego", "Documents", "Rstudio_practice", "Data_Science", "chr3", "R_practice_data_sets", "Ex2", "out")
rm(list =ls())

setwd("C:/Users/Diego/Documents/Rstudio_practice/Data_Science/chr3")
#z2 <- data_binder("Data1.csv", "Data2.csv")

#write.csv(z2, file="my_results_z.csv")

file_maker("Data1.csv", "Data2.csv", "A1.csv")
