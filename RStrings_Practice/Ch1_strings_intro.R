#text and string manipulation exercises
USArrests
head(USArrests)

#Abbreviating names of the states
states = rownames(USArrests)

#use substring
substr(x = states, start = 1, stop = 4)

#use abbreviate
states2 <- abbreviate(states)

#remove vector names and try w/ states2
names(states2) = NULL
states2
abbreviate(states, minlength = 5)

#size in characters of each name
state_chars = nchar(states)

#which state has the longest name?
states[which(state_chars == max(state_chars))]

#get states names with k
grep(pattern = "k", x = states, value = TRUE)

#get states names with 'w' or 'W', controls for capitalization
grep(pattern = "[wW]", x = states, value = TRUE)

#get states names with W, by converting the string to all upper-case
grep(pattern = "W", x = toupper(states), value = TRUE)

#get states names with w/
grep(pattern = "w", x = states, value = TRUE, ignore.case = TRUE)

#make histogram
hist(nchar(states), main = "Histogram",
     xlab = "number of characters in US State names")

#use regexpr to get number of times 
#that a searched pattern is found in a character vector
#get the occurance and position of the letter a in each state
positions_a = gregexpr(pattern = "a", text = states, ignore.case = TRUE)

#how many a's?
num_a = sapply(positions_a, function(x) ifelse(x[1] > 0, length(x), 0))
num_a

#get same result with stringr
library(stringr)
str_count(states, "a")

#total number of a's
str_count(tolower(states), "a")

#vector of vowels
vowels = c("a", "e", "i", "o", "u")

#vector for storing results
num_vowels = vector(mode = "integer", length = 5)

# calculate number of vowels in each name
for (j in seq_along(vowels)) {
  num_aux = str_count(tolower(states), vowels[j])
  num_vowels[j] = sum(num_aux)
}

#add vowel names
names(num_vowels) = vowels

# total number of vowels
num_vowels

#barplot
barplot(num_vowels, main = "Number of vowels in USA States names", 
        border = NA, ylim = c(0, 80))
