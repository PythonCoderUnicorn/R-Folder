

library(tidyverse)
library(lubridate)
library(janitor)
library(paletteer)
library(viridis)
library(ggtext)
library(showtext)


font_add_google('Lato','Lato')
showtext_auto()

nyt_titles <- readr::read_tsv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-05-10/nyt_titles.tsv')
nyt_full <- readr::read_tsv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-05-10/nyt_full.tsv')


# nyt_full$year = lubridate::as_date(nyt_full$year)
nyt_full$week

nyt_full = nyt_full %>% 
  mutate(title = factor(title),
         author = factor(author),
         rank = factor(rank),
         title_id = factor(title_id)
         )

nyt_full %>% 
  filter( year == '1983')

nyt_full %>% 
  select(author, rank, year) %>% 
  group_by(author, rank) %>% 
  filter(rank == 1) %>% 
  count(rank, sort = T) %>% 
  arrange( desc(n)) %>% 
  filter(n > 60) %>% 
  ungroup() %>% 
  ggplot(
    aes(x= n,
        y=  fct_reorder(author,n),
        fill= rank)
  )+
  geom_col(show.legend = F)+
  scale_fill_paletteer_d(`"beyonce::X4"`)+
  labs(
    title = "New York Times #1 ranked authors by count",
    fill = '',
    x='number of times rank #1',
    y= 'NYT Author'
  )+
  theme(
    text = element_text(family = 'Lato'),
    axis.text.y = element_text(face = 'bold', size = 12)
  ) + theme(panel.background = element_rect(fill = "#8cb3d9"),
    plot.background = element_rect(fill = "#8cb3d9")) +labs(fill = NULL)
  









