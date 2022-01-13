
# stringr 
library(stringr)
library(tidyverse)


s1 = "this is a string"
s2 = "this is a 'quote' here "
s3 = 'this is a "quote" here '
s4 = "hey look over there!"

nums = c('one','two')
str(nums)

# joins 2 vectors
str_c(s1, s4, sep=" ", collapse = ", ")

#  length of string
str_length(s2)


str_sub(s4, 3, 9) # slice 3:9
str_sub(s4, -4, -1)

str_to_upper(s4)

# replace
str_replace(s4, pattern = "hey", replacement = "Love")

# -- sort 
vectorSort = c("Wed","Fri","Sun")
str_sort(vectorSort)


# - view, opens viewer of search find of word with 'e'
str_view(s2, ".e")
str_view(s2, "e.")
str_view(s2, "er")

#  detect
str_detect(s4, "^e")


# -- count char
str_count(s4, "e")



# -- regular expressions




df = tibble(
  word = words
)

df %>% 
  mutate(
    vowels = str_count(word, "[aeiou]"),
    consonants = str_count(word, "[^aeiou]"), # not 'aeiou'
    a_or_c = str_count(word, "[a|c]")
  )





df %>% 
  dplyr::filter(str_detect(word, "^y")) # starts with y

#  words with no vowels 
df2 = df %>% 
  dplyr::filter(!str_detect(word, "[aeiou]"))


# duplicate a string
str_dup(s4, 3)

# grab the "there" from string
str_extract(s4, "there")

str_flatten(s4, collapse = "")

str_locate(s4, "hey") # returns position locations

str_order(s4, decreasing = T, numeric = F)

str_pad(s4, width = 5, side = "left", pad = '-')

str_replace_all(s4, pattern = 'e', '%')

str_split(s4, "look", n=3) # splits string apart

str_sub(s4, 2, 5) # subtract from a string

str_to_sentence(s4)

str_to_title(s1) # capitalizes each word


# --------{Base R}
# %a  weekday       |  %A full weekday name
# %b  month         |  %B full month
# %c  date & time   |  %C  century  0-99
# %d  day integer
# %D  date format
# %e  day of month integer
# %F  YMD format
# %H  hours integer 24H |  %I  hours as integer
# %j  day of year as integer
# %m  month
# %M  minute
# %p  | %r   AM/PM
# %T  == %H:%M:%S
# %U  | %V  week of the year integer
# %w  | %W  weekday as integer 

# %a %b %e %H:%M:%S
# strftime()



