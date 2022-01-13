
# forcats 
#  forcats = factors

library(tidyverse) 
library(forcats)

# factors gave levels
f1 = c(letters[1:5])

month_levels = month.abb


# using the factor() function
# default is alphabetical order for levels
f3 = factor(f1, levels = month_levels)
f3 

f4 = factor(f1)
f4

f5 = c(1:10)
uf = factor(f5, levels = unique(f5))
uf 


# --------
counts = rnorm(4, 50, 10)

orderedData = data.frame(
  Month= month_levels,
  Count = counts
  ) 
  ggplot( orderedData) +
  geom_bar( aes(x= Month, y= Count),
            stat = "identity")

# --------------

  

  
  
  
df = gss_cat
head(df)

df %>% count(marital)

df = df %>% 
  add_count(marital, name = "MaritalCount")

# - simple barchart
df %>% 
  ggplot() +
  geom_bar( aes(x= fct_rev(marital)))
  
# organize columns
df.organized = df %>% 
  ggplot() +
  geom_bar( aes(x= marital))


  
df %>% 
  mutate(marital = marital %>% 
           fct_infreq() %>%  fct_rev()) %>% 
  ggplot() +
  geom_bar( aes(x= marital)) 



religiousity = df %>% 
  group_by(relig) %>% 
  summarise(
    age = mean(age, na.rm=T),
    tvhours = mean(tvhours, na.rm=T),
    n = n()
  )
religiousity

# scatterplot
ggplot( religiousity,
        aes(tvhours, relig)) +
  geom_point()


# - reorder the levels of religion
# arranged based on tv hours
ggplot(religiousity,
       aes(x= tvhours,
           fct_reorder(relig, tvhours))) +
  geom_point()


# -- change the order of levels
# 'no answer' will come first in levels
religiousity = religiousity %>% 
  mutate(relig = fct_reorder(relig, tvhours)) %>% 
  mutate(relig = fct_relevel(relig, "No answer"))
ggplot( religiousity,
        aes(tvhours, relig)) +
  geom_point()



# - look @ part id
df.party = df %>% 
  count(partyid)
df.party

# -- clean up the level names
df.party2 = df %>% 
  mutate(partyid = fct_recode(partyid,
                              "Republican, strong" = "Strong republican",
                              "Republican, weak" = "Not str republican",
                              "Independent, near Republican" = "Ind,near rep",
                              "Independent, near Democrat" = "Ind,near dem",
                              "Democrat, weak" = "Not str democrat",
                              "Democrat, strong" = "Strong democrat"
                              ))

df.party2 

df.party2 = df.party %>% 
  mutate(partyid = fct_collapse(partyid,
                                "other" = c("Don't know", "Other party"),
                                "Republican" = c("Strong republican",
                                                 "Not str republican"),
                                "Independent" = c("Ind,near rep",
                                                  "Ind,near dem",
                                                  "Independent"),
                                "Democrat" = c("Not str democrat",
                                               "Strong democrat") ))
df.party %>% count(partyid)




# - fct_lump() to lump count the top 3 levels everything else is in 'other'
df %>% 
  mutate(marital = fct_lump_n(marital, n= 3)) %>% 
  count(marital)



