#Chr 5 RegEx part I
#Regular expressions are special text strings used
#to describe a certain amount of text
#This certain amount of text is called a pattern
#Regular Expressions are patterns that describe a set of strings
#Reg Ex is pattern matching
#4 basic operators: concatentation, Logical OR, Replication, Grouping


#There are 2 important issues we need to consider about regex in R
#functions designed for regex pattern matching
#the method in which regex patterns are expressed in R

#metacharacters: special characters w/ reserved status: $.\|()[{}]*+?
#How to replace special characters
#use double backslashes to get rid of them
money = "$money"
sub(pattern = "\\$", replacement = "", x = money)

sub("\\[", "", "Peace[Love]")
sub("\\\\", "", "Peace\\Love")

#Anchor Sequences in R
#several different kinds of anchors sequences in R
#\\d match a digit character
#\\D match a non-digit character
#\\s match a string character
#\\S match a non-string character
#\\w match a word character
#\\W match a non-word character
#\\b match a word boundary
#\\B match a non-word boundary
#\\h match a horizontal space
#\\H match a non-horizontal space
#\\v match a vertical space
#\\V match a non-vertical space

#how to do replacement operations
#sub replaces the first match
#gsub replaces all the matches

#replace digit with '_'
sub("\\d", "_", "the dandelion war 2010")
gsub("\\d", "_", "the dandelion war 2010")

# replace non-digit with '_'
sub("\\D", "_", "the dandelion war 2010")
gsub("\\D", "_", "the dandelion war 2010")

# replace space with '_'
sub("\\s", "_", "the dandelion war 2010")
gsub("\\s", "_", "the dandelion war 2010")

# replace non-space with '_'
sub("\\S", "_", "the dandelion war 2010")
gsub("\\S", "_", "the dandelion war 2010")

# replace word boundary with '_'
sub("\\b", "_", "the dandelion war 2010")
gsub("\\b", "_", "the dandelion war 2010")

# replace non-word boundary with '_'
sub("\\B", "_", "the dandelion war 2010")
#puts a _ after every 1st character in a word, and after the 3rd, 5th, 7th, etc 
gsub("\\B", "_", "the dandelion war 2010")

# replace word character with '_'
sub("\\w", "_", "the dandelion war 2010")
gsub("\\w", "_", "the dandelion war 2010")

# replace non-word character with '_'
sub("\\W", "_", "the dandelion war 2010")
gsub("\\W", "_", "the dandelion war 2010")

#A character class or character set is a list of characters 
#enclosed by square brackets []
#Character sets are used to match only one of several character
#example of a character class: [aA], matches any lower case a, or upper case A
#regex [0123456789], matches any digit
#class negation [^xyz] matches anything except the characters x, y or z

#Some regex character classes
#[aeiou] match any one lower case vowel
#[AEIOU] match any one upper case vowel
#[0123456789] match any digit
#[0-9] match any digit (same as previous class)
#[a-z] match any lower case ASCII letter
#[A-Z] match any Upper case ASCII letter
#[a-zA-Z0-9] match any class above
#[^aeiou] match anything other than a lowercase vowel
#[^0-9] #match anything other than a digit

#Regex examples
transport = c("car", "bike", "plane", "boat")
grep(pattern = "[ei]", transport, value = TRUE)

numerics = c("123", "17-April", "I-II-III", "R 3.0.1")
#match strings w/ 0 or 1
grep(pattern = "[01]", numerics, value = TRUE)
#match any digit
grep(pattern = "[0-9]", numerics, value = TRUE)
#negate any digit
grep(pattern = "[^0-9]", numerics, value = TRUE)

###POSIX Character classes
#represented w/ expressions inside double brackets
#[[:lower:]]  Lower-case letters
#[[:upper:]]  Upper-case letters
#[[:alpha:]]  Alphabetic characters ([[:lower:]] and [[:upper:]])
#[[:digit:]]  Digit: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
#[[:alnum:]]  Alphanumeric characters ([[:alpha:]] and [[:digit:]])
#[[:blank:]]  Blank characters: space and tab
#[[:cntrl:]]  Control Characters
#[[:punct:]]  Punctuation characters !"#%&'()*+,-./:;
#[[:space:]]  Space characters: tab, newline, vertical tab, form feed, carriage return, space
#[[:xdigits:]] Hexadecimal digits: 0-9, ABC, abc
#[[:print:]] Printable characters ([[:alpha:]], [[:punct:]] and space)
#[[:graph:]] Graphical Characters ([[:alpha:]] and [[:punct:]])

#la view
la_vie = "La vie en #FFC0CB (rose); \nCes't la vie! \ttres jolie"
print(la_vie)
cat(la_vie)

#remove space characters
gsub(pattern = "[[:blank:]]", replacement = "", la_vie)

#remove digits
gsub(pattern = "[[:punct:]]", replacement = "", la_vie)

#remove digits
gsub(pattern = "[[:xdigit:]]", replacement = "", la_vie)

#remove printable characters
gsub(pattern = "[[:print:]]", replacement = "", la_vie)

#remove non-printable characters
gsub(pattern = "[^[:print:]]", replacement = "", la_vie)

#remove graphical characters
gsub(pattern = "[[:graph:]]", replacement = "", la_vie)

#remove non-graphical characters
gsub(pattern = "[^[:graph:]]", replacement = "", la_vie)

#quantifyiers
#Match a certain number of characters that meet specific criteria
#specify how many instances of a character, group, or character class must be
#present in the input for a match to be found

#Quantifiers
#?: the preceding item is optional and with be matched at most once
#*: the preceding item will be matched 0 or more times
#+: the preceding item will be matched 1 or more times
#{n}: The preceding item is matched exactly n times
#{n, }: The preceding item is matched n or more times
#{n, m}: The preceding item is matched at least n times, maximum of m times

#names
people = c("jason", "zach", "billy", "trini", "kimberly", "tommy")

#match 'm' at most once
grep(pattern = "m?", people, value = TRUE, perl = FALSE)
#match 'm' exactly once
grep(pattern = "m{1}", people, value = TRUE, perl = FALSE)
#match 'm' zero or more times and t
grep(pattern = "m*t", people, value = TRUE, perl = FALSE)
#match 'm' one or more times
grep(pattern = "m+", people, value = TRUE)
#match 'm' one or more times, and t
grep(pattern = "m+.t", people, value = TRUE)

#match 't' exactly twice
grep(pattern = "t{2}", people, value = TRUE)

####Functions for Regular Expressions in R
#grep
#grepl: matches all instances of a match
#regexpr
#gregexpr
#regexec
#sub
#gsub
#strsplit: split vector according to matches


####Regex Functions in stringr
#str_detect: detect presence or absence of a pattern in a string
#str_extract: extract first piece of a string that matches a pattern
#str_extract_all: extract all piece of a string that match a pattern
#str_match: extract first matched group from a string
#str_match_all: extract all matched groups from a string
#str_locate: locate the position of the 1st occurence of a pattern in a string
#str_locate_all: locate the position of all occurences of a pattern in a string
#str_replace: Replace first occurences of a matched pattern in a string
#str_replace_all: Replace all occurences of a matched pattern in a string
#str_split: split up a string into a variable number of pieces
#str_split_fixed: Split up a string into a fixed number of pieces

#regmatches can also be used to extract or replace matches
#use w/ data from regexpr, gregexpr, or regexec

#accessory functions accepting regex patterns
#list.files: list files in a directory
#list.files
#list.dirs(R.home("doc"), full.names = FALSE), file names are returned with false, 
#if true, directory path is prepended to the file names to give a relative file path





