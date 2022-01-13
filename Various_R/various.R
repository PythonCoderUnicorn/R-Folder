
library(tidyverse)

# ---------------
library(beepr)
beep(sound = 8)
beep(3)
# --------------
# crayon::bgMagenta(white('hey'))



# Program for International Student Assessment (PISA) 
# 8347 rows 32 columns
GGally::australia_PISA2012  
GGally::flea # data on flee beetles
GGally::happy # General Social Survey, 1972-2006.
GGally::nasa  # 6 years of monthly data from Central America
GGally::pigs  # UK pigs 1967-1978
GGally::psychademic # 600 rows of a UCLA psychological study
GGally::twitter_spambots


# -- moDel Agnostic Language for Exploration and eXplanation
DALEX::apartments
DALEX::dragons
DALEX::fifa
DALEX::HR
DALEX::titanic



dplyr::band_instruments # Beatles 3x2 
dplyr::band_members

x = 1:10
y = 10:1
dplyr::nth(x,3)
dplyr::nth(y,3)
x[3]
y[3]


# emoji to unicode
emojifont::emoji('smile')
emojifont::emoji('love_letter')
emojifont::fontawesome('fa-twitter')
emojifont::list.emojifonts()
emojifont::search_emoji()



fivethirtyeight::unisex_names
fivethirtyeight::bad_drivers %>% View()


flashClust::hclust()

gapminder::continent_colors
gapminder::country_codes
c = gapminder::country_colors 

c['Canada']

















