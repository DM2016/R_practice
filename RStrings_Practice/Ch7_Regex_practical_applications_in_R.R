#Chapter 7
#Practical Applications

#1 reversing a string
#WE can reverse a string by characters,
#Use this function

reverse_chars <- function(string)
{
  #split string by characters
  string_split = strsplit(string, split = "")
  #reverse order 
  rev_order = nchar(string):1
  #reverse characters
  reversed_chars = string_split[[1]][rev_order]
  # collapse reverse characters
  paste(reversed_chars, collapse = "")
}

#try 'reverse_chars'
reverse_chars("abcdefg")

#try with non-character input
#does not accept numerical inputs
reverse_chars(12345)

#change function so that it forces inputs as character
reverse_chars2 <- function(string)
{
  #split string by characters
  string_split = strsplit(as.character(string), split = "")
  #reverse characters
  reversed_chars = string_split[[1]][nchar(string):1]
  # collapse reverse characters
  paste(reversed_chars, collapse = "")
}

reverse_chars2("atmosphere")
reverse_chars2("the big bang theory")
reverse_chars2(12345)


#use this function over multiple elements (vector)
lapply(c("the big bang theory", "atmosphere", 12345), reverse_chars2)

##reverse a string by words

#function that reverses a string by words
reverse_words <- function(string)
{
  #split string by blank spaces
  string_split = strsplit(as.character(string), split = " ")
  #how many split terms?
  string_length = length(string_split[[1]])
  # decide what to do
  if (string_length == 1) {
    #one word (do nothing)
    reversed_string = string_split[[1]]
  } else {
    # more than one word (collapse them)
    reversed_split = string_split[[1]][string_length:1]
    reversed_string = paste(reversed_split, collapse = " ")
  }
  # output
  return(reversed_string)
}

reverse_words("atmosphere")
reverse_words("the big bang theory")

#reverse vector
lapply(c("the big bang theory", "atmosphere"), reverse_words)

#matching e-mail addresses
#complete regular expression papttern in R for an email address
# "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"

# pattern
email_pat = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"

#string that matches
grepl(pattern = email_pat, x = "gaston@abc.com")

# another string that matches
grep(pattern = email_pat, x = "gaston.sanchez@research-center.fr")

#unmatched email (top level domain (TLD) too long)
grep(pattern = email_pat, x = "gaston@abc.something")

#apply the email pattern to test whether several strings match or not
#potential email addresses
emails = c(
  "simple@example.com",
  "johnsmith@email.gov",
  "marie.curie@college.edu",
  "very.common@example.com",
  "a.little.length.but.ok@dept.example.com",
  "disposable.style.email.with+symbol@example.com",
  "not_good@email.address"
)

#detect pattern
str_detect(string=emails, pattern=email_pat)

#MAtching HTML elements
#basic handling of HTML tags
# Rannounce is where major announcements about the development of R 
# and the availablity of new code
#several other mailing lists: R-packages, R-help, R-devel

#First 5 Special Interest groups (SIG) in R
#R-SIG-Mac
#R-sig-DB
#R-SIG-Debian
#R-sig-dynamic-models
#R-sig-Epi : R for epidemiological data analysis

#As a simple example, suppose we wanted to 
#get the href attributes of all the SIG links

#read html content
mail_lists = readLines("http://www.r-project.org/mail.html")

# SIG's href pattern
sig_pattern = '^.* <a href="(https.*)">.*$' #don't use td

#find SIG hreh attributes 
sig_hrefs = grep(sig_pattern, mail_lists, value = TRUE)

#let's see the first 5 elements (shorten output)
shorten_sigs = rep("", 5)
for (i in 1:5) {
  shorten_sigs[i] = toString(sig_hrefs[i], width=70)
}
shorten_sigs

sub(sig_pattern, "\\1", sig_hrefs)

# link of data set
url = "https://raw.githubusercontent.com/gastonstat/r4strings/master/data/biomedcentral.txt"

#read data (stringsAsFactors=FALSE)
biomed = read.table(url, header = TRUE, sep = " ", stringsAsFactors = FALSE)

#structure of the dataset
str(biomed, vec.len = 1)

#analyzing journal names
names(biomed)

head(biomed$Publisher, 5)

#get first 10 names
titles10 = biomed$Journal.name[1:10]
titles10

#trim extra white spaces
titles10 = str_replace_all(titles10, pattern = "\\s+", " ")
titles10

#remove all punctuation symbols
all_titles = str_replace_all(biomed$Journal.name, pattern = "[[:punct:]]", "")

# trim extra whitespaces
all_titles = str_replace_all(all_titles, pattern = "\\s+", " ")

#split titles by words
all_titles_list = str_split(all_titles, pattern = " ")

#show first 2 elements
all_titles_list[1:2]

#Summary statistics
#how many words per title
words_per_title = sapply(all_titles_list, length)

# table of frequencies
table(words_per_title)

#express distribution as percentages
#distribution
100 * round(table(words_per_title)/length(words_per_title), 4)

#summary 
summary(words_per_title)

#longest journal
all_titles[which(words_per_title == 9)]

#7.4.2 Common words
#vector of words in titles

title_words = unlist(all_titles_list)

unique_words = unique(title_words)

# get unique words
num_unique_words = length(unique(title_words))
num_unique_words

#vector to store counts
count_words = rep(0, num_unique_words)

#count number of occurrences
for (i in 1:num_unique_words) {
  count_words[i] = sum(title_words == unique_words[i])
}

#table with word frequencies
count_words_alt = table(title_words)

#table of frequencies
table(count_words)

#equivalently
table(count_words_alt)

#index values in decreasing order
top_30_order = order(count_words, decreasing = TRUE)[1:30]

#top 30 frequencies
top_30_freqs = sort(count_words, decreasing = TRUE)[1:30]

#select top 30 words
top_30_words = unique_words[top_30_order]
top_30_words

#barplot
barplot(top_30_freqs, border = NA, names.arg = top_30_words, las = 2, ylim = c(0, 100))

#wordcloud

#installing wordcloud
library(wordcloud)

#plotting a tag cloud
#wordcloud
wordcloud(unique_words, count_words, scale=c(8, .2), min.freq=6, max.words=Inf, random.order=FALSE, rot.per=.15)









