
# tidytuesday Survivor dataset 
# tutorial by:  Jesse Mostipak

# setup
library(tidyverse)
library(lubridate)

# import data
df = readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-06-01/summary.csv')

# inspect
dim(df)

names(df)

glimpse(df)



# wrangle data
# convert char columns to factors
df %>% 
  mutate(across(where(is.character), as.factor )) %>% 
  glimpse()


# ----
# calculate time intervals for air dates and filming
df %>% 
  mutate(days_filiming = time_length(interval(filming_started, filming_ended),
                                     unit= 'days')) %>% 
  mutate(days_aired = time_length(interval(premiered, ended), 
                                  unit = "days")) %>% 
  select(-premiered: -filming_ended) 

# pivot table, combine metrics for show type
df %>% 
  pivot_longer(
    cols = viewers_premier: viewers_reunion,
    names_to = "show_type",
    names_prefix = "viewers_",
    values_to = "total_views",
    values_drop_na = TRUE
  ) %>% 
  glimpse()

# tidy df
df.tidy = df %>% 
  mutate(across(where(is.character), as.factor )) %>% 
  mutate(days_filiming = time_length(interval(filming_started, filming_ended),
                                     unit= 'days')) %>% 
  mutate(days_aired = time_length(interval(premiered, ended), 
                                  unit = "days")) %>% 
  select(-premiered: -filming_ended) %>% 
  # combine metrics
  pivot_longer(
    cols = viewers_premier: viewers_reunion,
    names_to = "show_type",
    names_prefix = "viewers_",
    values_to = "total_views",
    values_drop_na = TRUE
  ) 

# scatterplot 
df.tidy %>% 
  filter(show_type %in% c("premier", "finale")) %>% 
  ggplot( aes(x= viewers_mean, 
              y= total_views)) +
  geom_point( aes(color= show_type)) +
  ggtitle("TidyTuesday Survivor Data") +
  labs(y="Total Viewers", x = "Viewers Average")
  
















