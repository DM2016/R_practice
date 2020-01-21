#Practice problems Using Factors

#1. Write a R program to find the 
# levels of factor of a given vector. 

d = c(3, 9, NA, 8, 24, 3, NA, 21, 5, 4, 3, NA)
print("Original vector:")
print(d)
print("Levels of factor of the said vector:")
print(levels(factor(d))) #levels attribute of a variable: in factor variables, a vector of character strings with length at least the number of levels of x


# 2. Write a R program to change the first level 
# of a factor with another level of a given factor. 

g = c("m", "n", "m", "o", "n")
print("Original vector:")
print(g)
w = factor(g)
print("Factor of the said vector:")
print(w)
levels(w)[1] = "e"
print(w)

# 3. Write a R program to create an ordered factor 
# from data consisting of the names of months. 

mons_v = c("March","April","March","November","March",
           "September","October","December","November","August","February",
           "January","January","November","February","May","August","February",
           "July","June","August","December","December","November","September",
           "February","April")
print("Original vector:")
print(mons_v)
f = factor(mons_v)
print("Ordered factors of the said vector:")
print(f)
print(sort(table(f), decreasing = T))

# 4. Write a R program to concatenate 
# two given factor in a single factor.

my_factor1 <- factor(sample(LETTERS, size=8, replace=TRUE)) #create random sample of 8 letters
my_factor2 <- factor(sample(LETTERS, size=5, replace=TRUE))
print("Original factors:")
print(my_factor1)
print(my_factor2)
my_factor3 = factor(c(levels(my_factor1)[my_factor1], levels(my_factor2)[my_factor2]))
print("After concatenate factor becomes:")
print(my_factor3)

# 5. Write a R program to convert a given 
# pH levels of soil to an ordered factor. 

ph = c(9,3,12,7,5,14,3,7,8,7,6,3,7,10,7)
print("Original data:")
print(ph)
ph_f = factor(ph,levels=c(3,7,10),ordered=TRUE)
print("pH levels of soil to an ordered factor:")
print(ph_f)

# 6. Write a R program to extract the five of the 
# levels of factor created from a random sample 
# from the LETTERS (Part of the base R distribution.) 

my_letters = sample(LETTERS,size=100,replace=TRUE) #create random sample of 100 letters
print("Original data:")
print(my_letters)
my_factor = factor(my_letters)
print("Original factors:")
print(my_factor)
print("Only five of the levels")
print(table(my_letters[1:5]))

 
# 7. Write a R program to create a factor 
# corresponding to height of women data set, 
# which contains height and weights for a sample of women. 

women_data = women
print("Women data set of height and weights:")
head(women_data)
dim(women_data)
height_f = cut(women_data$height,3)
print("Factor corresponding to height:")
print(table(height_f))

