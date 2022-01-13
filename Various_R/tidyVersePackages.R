
# R for Data Science


#================================= codeacademy R
# piping %>% 
# df %>% head()  <--> head(df)

#--------- dyplyr library

#--- selecting specific columns
# 
# selected_cols = select(df, col3, col6) 
#     _or_ 
# selected_cols = df %>% select(col3, col6)

#--- selecting the columns you don't want from df
# variable_name = df %>% 
#   select(-col2,-col4)


# --------- filter function
# filter rows of df 
# 
# >> filter rock bands with 250 million fans
# rock_groups = artists.df %>% 
#   filter(genre =='Rock', fans > 250e6)

# the or operator '|'

# not_rock_groups = artists %>%
#   filter(!(genre=='Rock'))


#--- arrange rows in df
# default: ascending
# 
# arranged_col = customers %>%
#   arrange(desc(age))















## Data Visualization

library(tidyverse)

library(crayon)
cat(yellow$cyan$bold("hello", "Crayon World!\n"))

library(cli)
cli({
  cli_h1(yellow$bold("Title"))
  cli_h2("Subtitle")
  cli_ul(c("this", "that", "end"))
})



library(hms)
#  sec, min, hr
hms(56, 34, 12)


library(pillar)
x= 2333* 3^7
pillar(x)
pillar(-x)


library(stringr)
x = c("this","cheese","stringr",'is","stringy')
str_length(x)
str_count(x)

str_c(x, " * ")

str_sort(x, decreasing = T)
str_sort(x, decreasing = F)

str_extract(x, pattern = 'y')
str_locate(x, pattern = 'y')

str_detect(x, pattern = "cheese")

str_match(x, "r")

str_replace(x, "[aeiouy]", "?")

# categorical data stored in factors
blood = c("A","B","O","AB")
#make it a factor
blood.factor = factor(blood)

str(blood.factor)

# Nominal vs Ordinal
tshirts = c('L','M','S','XL','XS')
tshirts.factor = factor(tshirts,
                        ordered = T,
                        levels =  c('XS','S',
                                    'M','L','XL'))

tshirts.factor


# =========================
starwars %>% 
  filter(!is.na(species)) %>% 
  count(species, sort = T)

starwars %>% 
  filter(!is.na(species)) %>% 
  mutate(species = fct_lump(species, n=3)) %>% 
  count(species)


starwars %>%
  mutate(eye_color = fct_infreq(eye_color)) %>%
  ggplot(aes(x = eye_color)) + 
  geom_bar() + 
  coord_flip()







# w3 R
# create a df
df = data.frame(
  LGB = c("Lesbian","Gay","Bisexual"),
  values = c(10800, 10800, 16200),
  Proportion = c(1.2, 1.2, 1.8)
)
df
summary(df)


library(ggplot2)

ggplot(df, aes(x= LGB)) +
  geom_bar()

# x-axis values
x <- c("A", "B", "C", "D")

# y-axis values
y <- c(2, 4, 6, 8)

barplot(y, names.arg = x)

x <- c("Lesbian", "Gay", "Bisexual", "D")
y <- c(10000, 10000,16000,9000)

barplot(y, names.arg = x, col = c("red",'yellow','green','blue'))










