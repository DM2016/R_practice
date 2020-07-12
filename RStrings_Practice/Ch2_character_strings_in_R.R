#character strings in R
#empty string
empty_str = ""
empty_str
class(empty_str)

# empty chacter vector
empty_chr = character(0)

# display
empty_chr

#class
class(empty_chr)
length(empty_str)

#character
#character vector w/ 5 empty strings
char_vector = character(5)

#display
char_vector

#another example
example = character(0)
example

length(example)
example[1] = "first"
example

length(example)

example[4] = "fourth"
example

# define two object 'a' and 'b'
a = "test me"
b = 8 + 9

#are 'a' and 'b' characters?
is.character(a)
is.character(b)
class(a)
class(b)

#convert b as character
b = as.character(b)
b

# vector with numbers and characters
c(1:5, pi, "text")
c(1:5, TRUE, pi, FALSE, "text")

#matrix with numbers and characters
rbind(1:5, letters[1:5])

#data frame with numbers and characters
df1 = data.frame(numbers = 1:5, letters = letters[1:5])
df1
str(df1)

#get a data frame with numbers and characters
df2 = data.frame(numbers = 1:5, letters = letters[1:5], stringsAsFactors = FALSE)
df2
str(df2)
list(1:5, letters[1:5], rnorm(5))

#Reading tables
#use ABC radio data
#ABC radio stations data URL
abc = "http://www.abc.net.au/local/data/public/stations/abc-local-radio.csv"
radio = read.table(abc, header = TRUE, sep = ",", stringsAsFactors = FALSE)
dim(radio)
str(radio, vec.len = 1)

# read 'ktop100.txt' file
top105 = readLines("http://www.textfiles.com/music/ktop100.txt")
length(top105)
head(top105)

#top 5 songs
top105[11:15]
tail(top105, n = 10)
