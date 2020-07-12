#chr 6 Regular expressions part II
#grep example
text = c("one word", "a sentence", "you and me", "three two one")

pat = "one"

#returns matching indices
grep(pat, text)
# [1] 1 4

#return contents of matches
grep(pat, text, value = TRUE)
#[1] "one word"      "three two one"

#returns non-matching indices
grep(pat, text, invert = TRUE)
#[1] 2 3

#returns contents of non-matching strings
grep(pat, text, invert = TRUE, value = TRUE)
#"a sentence" "you and me"

#grepl function
#this is grep-logical, returns values of TRUE/FALSE
text2 = c("one word", "a sentence", "you and me", "three two one")
pat2 = "one"
grepl(pat2, text2)

#Function regexpr
text3 = c("one word", "a sentence", "you and me", "three two one")
pat = "one"

#default usage
regexpr("one", text3)

#Function regexpr
text = c("one word", "a sentence", "you and me", "three two one")
pat = "one"
regexec(pat, text)

#handy function to extract matched terms
x = regexpr(pat, text)
substring(text, x, x + attr(x, "match.length") -1)

#w/ NA
regexpr(pat, c(text, NA))


##pattern replacement functions
#sub vs gsub: sub only replaces the first matching pattern element, 
#gsub replaces all the matching pattern elements
#both functions follow: gsub/sub(pattern, replacement, text)

#Replacing First occurrence with sub()
Rstring = c("The R foundation",
            "for Statistical Computing",
            "R is Free software",
            "R is a collaborative project")

sub("R", "RR", Rstring)
gsub("R", "RR", Rstring)


##6.3 Splitting Character Vectors
#strsplit(x, split)
#strsplit(text, pattern)

sentence = c("R is a collaborative project with many contributors")
strsplit(sentence, " ")

tels =  c("510-548-2238", "707-231-2440", "650-752-1300")
strsplit(tels, "-")

#Functions in stringr
#str_function(string, pattern)
#Detect patterns with str_detect()
#some objects

some_objs = c("pen", "pencil", "marker", "spray")

#detect phones
str_detect(some_objs, "pen")

#select detected matches
some_objs[str_detect(some_objs, "pen")]

#some strings
strings = c("12 Jun 2002", " 8 September 2004 ", "22-July-2009 ",
            "01 01 2001", "date", "02.06.2000",
            "xxx-yyy-zzzz", "$2,600")

#date pattern (month as text) #does not match the text
dates = "([0-9]{1,2})[-.]([a-zA-Z]+)[-.]([0-9]{4})"
str_detect(strings, dates)

#6.4.2 extract first match with str_extract()
#tweets about 'Paris'

paris_tweets = c(
  "#Paris is chock-full of cultural and culinary attractions",
  "Some time in #Paris along Canal St.-Martin famous by #Amelie",
  "While you're in #Paris, stop at cafe: http://goo.gl/yaCbW",
  "Paris, the city of light"
)

#hastag pattern
hash = "#[a-zA-Z]{1,}"

str_extract(paris_tweets, hash)

#6.4.3 Extract all matches with str_extract.all
#extract all hashtags
str_extract_all(paris_tweets, "#[a-zA-Z]{1,}")

#6.4.4 Extract first match group with str_match()
strings = c("12 Jun 2002", " 8 September 2004 ", "22-July-2009 ",
            "01 01 2001", "date", "02.06.2000",
            "xxx-yyy-zzzz", "$2,600")

dates = "([0-9]{1,2})[-.]([a-zA-Z]+)[-.]([0-9]{4})"
str_match(strings, dates)

#6.4.5 Extract all matched groups with str_match_all()

# tweet about 'Paris'
paris_tweets = c(
  "#Paris is chock-full of cultural and culinary attractions",
  "Some time in #Paris along Canal St.-Martin famous by #Amelie",
  "While you're in #Paris, stop at cafe: http://goo.gl/yaCbW",
  "Paris, the city of light"
)

#match (all) hastags in 'paris_tweets'
str_match_all(paris_tweets, "#[a-zA-Z]{1,}")

#6.4.6 Locate first match with str_locate()
# locate first match with str_locate()
str_locate(paris_tweets, "#[a-zA-Z]{1,}")

#6.4.7. Locate all the matches with str_locate.all()
#locate (all) hastags in 'paris_tweets'
str_locate_all(paris_tweets, "#[a-zA-Z]{1,}")

#6.4.8 Replace first match with str_replace()
#str_replace(string, pattern, replacement)
# city names
cities = c("San Francisco", "Barcelona", "Naples", "Paris")

#replace first matched vowel
str_replace(cities, "[aeiou]", ";")

#replace first matched consonant
str_replace(cities, "[^aeiou]", ";")

#String splitting w/ str_split()
#str_split(string, pattern, n = Inf)

# a sentence
sentence = c("R is a collaborative project with many contributors")
str_split(sentence, " ")

tels = c("510-548-2238", "707-231-2440", "650-752-1300")
str_split(tels, "-")

#string
flavors = c("chocolate", "vanilla", "cinnamon", "mint", "lemon")
str_split(flavors, "[aeiou]")

#split by first vowel
str_split(flavors, "[aeiou]", n = 2)

#6.4.11 string splitting with str_split_fixed
#syntax:  str_split_fixed(string, pattern, n)

#string
#split in 2 pieces (option n = 2)
flavors = c("chocolate", "vanilla", "cinnamon", "mint", "lemon")
str_split_fixed(flavors, "n", 2)
#split in 3 pieces
str_split_fixed(flavors, "n", 3)








































