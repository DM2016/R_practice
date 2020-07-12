#chr 4 String manipulations with stringr
#nchar and paste cant remove zero length arguments
#that's one reason to use stringr
#efficient dealing with NA and zero length instances
#ensures consistency w/ fxn and argument names
library(stringr)

#stringr operations
#str_c: concatenating strings

str_c("May", "the", "Force", "be", "with", "you")
#zero length elements removed
str_c("May", "the", "Force", NULL,  "be", "with", "you", character(0))

#change separator
str_c("May", "the", "Force", "be", "with", "you", sep = "-")
#str_join("May", "the", "Force", "be", "with", "you", sep = "-")

#some text w/ NA
some_text = c("one", "two", "three", NA, "five")
nchar(some_text)

#with str_length
str_length(some_text)

#str_length can convert factors to characters
#some factor
some_factor = factor(c(1,1,1,2,2,2), labels = c("good", "bad"))
some_factor

#doesn't work
nchar(some_factor)
str_length(some_factor)

#substring with str_sub
lorem = "Lorem Ipsum"

#apply 'str_sub'
str_sub(lorem, start = 1, end = 5)

#eq to substring
substring(lorem, first = 1, last = 5)

#another example
str_sub("adios", 1:3)
resto = c("brasserie", "bistrot", "creperie", "bouchon")
str_sub(resto, start = -4, end = -1)
substring(resto, first = -4, last = -1)

#extract sequentially
str_sub(lorem, seq_len(nchar(lorem)))
substring(lorem, seq_len(nchar(lorem)))

#reverse substrings with negative positions
str_sub(lorem, -seq_len(nchar(lorem)))
substring(lorem, -seq_len(nchar(lorem)))

#replace Lorem with Nullam
lorem = "Lorem Ipsum"
str_sub(lorem, 1, 5) <- "Nullum"
lorem

#replace w/ neg positions
lorem = "Lorem Ipsum"
str_sub(lorem, -1) <- "Nullum"
lorem

#multiple replacements
lorem = "Lorem Ipsum"
str_sub(lorem, c(1, 7), c(5, 8)) <- c("Nullum", "Enim")
lorem

#duplication w/ str_dup
#base R does not have a specific fxn for creating duplicates
#str_dup does this
#str_dup(string, times)

str_dup("hola", 3)
str_dup("sam", 1:3)

words = c("lorem", "ipsum", "dolor", "sit", "amet")
str_dup(words, 2)
str(words, 1:5)

#str_pad pads a string, makes spaces
#str_pad(strin, width, side = "left", pad = " ") #default settings

str_pad("hola", width = 7)
str_pad("hola", width = 7, side = "both")

str_pad("hashtag", width = 8, pad = "#")
str_pad("hashtag", width = 9, side = "both", pad = "-")


#wrapping strings with str_wrap
#split long strings into sections, according to given width
#str_wrap(string, width = 80, indent = 0, exdent = 0) #usage

some_quote = c(
  "I may not have gone",
  "where I intended to go",
  "but I think I have ended up",
  "where I needed to be"
)

some_quote = paste(some_quote, collapse = " ")

#display paragraph with width=30
cat(str_wrap(some_quote, width = 30))

cat(str_wrap(some_quote, width = 30, indent = 2), "\n")
cat(str_wrap(some_quote, width = 30, exdent = 3), "\n")

#trimming with str_trim
#get rid of extra whitespaces
#str_trim(string, side = "both") #default usage

bad_text = c("This", " example ", "has several  ", "  whitespaces  ")
str_trim(bad_text, side = "left")
str_trim(bad_text, side = "right")
str_trim(bad_text, side = "both")


#word extraction w/ word
#extract words from a sentence
#word(string, start = 1L, end = start, sep = fixed(" "))
#pass a string to word w/ a start position of the 1st word to extract,
#and an end position of the last word to extract
#single space is default separator

change = c("Be the change", "you want to be")
word(change, 1)
word(change, 2)
word(change, -1)
word(change, 2, -1)






