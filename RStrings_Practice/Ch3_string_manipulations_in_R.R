#Ch3 String Manipulation
#work with the paste function
PI = paste("The Life of", pi)
PI

#use a different separator
IloveR = paste("I", "love", "R", sep = "-")
IloveR

#paste w/ objects of different lengths
paste("X", 1:5, sep = ".")

#paste with collapsing
paste(1:3, c("!", "?", "+"), sep = "", collapse = "")
paste(seq(40, 55, by = 5), c("wifi", "access", "code"), sep = "", collapse = "")
#paste without collapsing
paste(1:3, c("!", "?", "+"), sep = "")

#with missing values NA
evalue = paste("the value of 'e' is", exp(1), NA)
evalue

# collapsing with paste0
paste0("let's", "collapse", "all", "these", "words")


#Printing characters
#text string
my_string = "Programming with data is fun"

#print strings
print(my_string)

#print without quotes
print(my_string, quote = FALSE)

#Unquoted characters with noquote()
# noquote
noquote(my_string)

#class noquote
no_quotes = noquote(c("some", "quoted", "text", "!%^(&="))
no_quotes
class(no_quotes)
is.character(no_quotes)
no_quotes[2:3]

#concatenate and print with cat
#print with cat
cat(my_string)
cat(my_string, "with R")

#especifying 'sep'
cat(my_string, "with R", sep = " = )")
cat(1:10, sep = "-")
cat(month.name[1:4], sep = " ")

#cat with fill
cat("Loooooooooong strings", "can be displayed", "in a nice format",
    "by using the 'fill' argument", fill = 30)

#use cat to save to a given file
cat(my_string, "with R", file = "my_cat_output.txt")

#encoding strings with format
format(13.7)
format(13.12345678)
format(13.12345678, digits = 4)
format(13.12345678, scientific = TRUE)
format(c(6, 13.1), digits = 2)
format(c(6, 13.1), digits = 2, nsmall = 1)

# big.mark
format(c("A", "BB", "CCC"), width = 5, justify = "centre")
format(c("A", "BB", "CCC"), width = 5, justify = "right")
format(c("A", "BB", "CCC"), width = 5, justify = "left")
#make separators in a large number
format(123456789, big.mark = ",")

#sprintf() is a wrapper for the C function sprint ()
#this returns a formatted string containing text and variable values

# %f indicates fixed point decimal notation
sprintf("%f", pi)
sprintf("%f.3", pi)
sprintf("%f1.0", pi)
sprintf("%f+", pi)
sprintf("% f", pi)

#convert objects to strings with toString
toString(17.04)
toString(c(17.04, 1978))
toString(c("Bonjour", 123, TRUE, NA, log(exp(1))))

#use of width
toString(c("one", "two", "3333333333"), width = 8)

#how many characters
nchar(c("How", "many", "characters?"))
nchar("How many characters?")

#nchar vs length
#nchar gives number of characters
#length gives number of elements in a vector

#capitalization
#tolower
tolower(c("aLL cHARACters in loWer cASe"))
#toupper
toupper(c("aLL cHARACters in uPPer cASe"))
#casefold
casefold("aLL cHARACters in loWer cASe", upper = F)
casefold("aLL cHARACters in uPPer cASe", upper = T)

#chartr()
#chartr(old, new, x)
#old and new must have the same # of characters

# replace 'a' by 'A'
chartr("a", "A", "This is a boring string")
chartr("i", "I", "This is a more interesting string")

#more complicated example, multiple replacements
crazy = c("Here's to the crazy one", "The misfits", "The rebels")
chartr("aei", "#!?", crazy)

#more abbreviation method
# abbreviate(names.org, minlength = 4, dot = FALSE, strict = FALSE,
#             method = c("left.keep", "both.sides"))

some_colors = colors()[1:4]
some_colors

colors1 = abbreviate(some_colors)
colors1

colors2 = abbreviate(some_colors, minlength = 5)
colors2

colors3 = abbreviate(some_colors, minlength = 5, method = "both.sides")
colors3

#extracting substrings, b through d
substr("abcdef", 2, 4)

#replace 2nd letter with hash symbol
#substr(x, start, stop)
x = c("may", "the", "force", "be", "with", "you")
substr(x, 2, 2) <- '#'
x

y = c("may", "the", "force", "be", "with", "you")
substr(y, 2, 3) <- ':)'
y

#replace by recyling
z = c("may", "the", "force", "be", "with", "you")
substr(z, 2, 3) <- c("#", "@")
z

#Replace substrings with substring()
#substring(text, first, last = 1000000L)
substring("ABCDEF", 2, 4)
substr("ABCDEF", 2, 4)
substring("ABCDEF", 1:6, 1:6)

text = c("more", "emotions", "are", "better", "than", "less")
substring(text, 1:3) <- c(" ", "zzz")
text

#set union with union
#two character vectors
set1 = c("some", "random", "words", "some")
set2 = c("some", "many", "none", "few")

union(set1, set2)

#two character vectors
set3 = c("some", "random", "few", "words")
set4 = c("some", "many", "none", "few")

#finds elements that 2 sets have in common
intersect(set3, set4)

#Set difference with set difference
#finds differences between 2 sets
# two character vectors
set5 = c("some", "random", "few", "words")
set6 = c("some", "random", "none", "few")
setdiff(set5, set6)

#set equality with setequal: tells you whether the same elements are present in 2 sets
set7 = c("some", "random", "strings")
set8 = c("some", "many", "none", "few")
set9 = c("strings", "random", "some")

#is set 7 equal to set 8?
setequal(set7, set8)
setequal(set7, set9)

#exact equality with identical
#finds if two sets have same elements in same order
identical(set7, set7)
identical(set7, set9)

#element contained is.element
#test if an element is in a set of character strings
set10 = c("some", "stuff", "to", "play", "with")
elem1 = "play"
elem2 = "crazy"

is.element(elem1, set10)
is.element(elem2, set10)

#can use this code too, especially in dplyr
elem1 %in% set10
elem2 %in% set10

#use sort to sort an order in a list or data frame, default is increasing order
set11 = c("today", "produced", "example", "beautiful", "a", "nicely")
sort(set11)
sort(set11, decreasing = T)

##with alphanumeric elements
set12 = c("today", "produced", "2", "example", "1", "beautiful", "a", "nicely")
sort(set12)
sort(set12, decreasing = T)


#repetition with rep()
#repeat x 4 times
paste(rep("x", 4), collapse = "")



