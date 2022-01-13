
# =========== TidyTuesday

library(tidyverse)
library(ggplot2)
library(paletteer)
library(choroplethr)
library(lubridate)
library(showtext)
library(systemfonts)

font_add_google(family = 'Raleway','Raleway')
showtext_auto()

bees <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-01-11/colony.csv') %>% janitor::clean_names() 

bees$state = factor(bees$state)
bees$year = factor(bees$year)

bees$state

bees %>% 
  select(year, state, colony_n) %>%
  drop_na() %>% 
  group_by(state, colony_n) %>% 
  arrange( desc(colony_n)) %>% 
  ungroup() %>% 
  ggplot(
    aes(y = colony_n,
        x= fct_reorder(year,colony_n),
        col= state)
  )+
  geom_point(show.legend = F, fill='orange')+
  geom_line(show.legend = F)+
  # scale_color_paletteer_d("dichromat::GreentoMagenta_16")+
  ggdark::dark_mode()


bees %>% 
  filter(state =='Michigan')


bees %>% 
  select(state, colony_lost, colony_n, colony_lost_pct) %>% 
  filter(state == c('California','Maine','Montanta',
                    'Washington','New York','Colorado',
                    'North Dakota','Vermont','Michigan','Illinois'
                    )) %>% 
  mutate(loss = (colony_lost/ colony_n)*100) %>% 
  arrange( desc(colony_lost) ) %>% 
  ggplot(
    aes(x= loss,
        y= state)
  )+
  geom_point(color='yellow', size=2)+
  ggdark::dark_mode()









bees %>% 
  filter(state =='Maine',
         year !='6/') %>% 
  select(year, colony_n) %>% 
  arrange( desc( colony_n)) %>%
  ggplot(
    aes(x= as_factor(year),
        y= colony_n)
  )+
  geom_boxplot(color='yellow', alpha= 0.4)+
  geom_jitter(color='yellow', size=2, alpha= 0.5)+
  ggdark::dark_mode()+
  labs(title = "Bee colonies in Maine by year",
       y='Colonies',
       x='year',
       caption = "@StarTrek_Lt | #TidyTuesday Jan, 10, 2022"
       )+
  theme(
    text = element_text(family = 'Raleway', size = 13),
    plot.title = element_text(size = 15,
                              color = 'yellow',
                              hjust = 0.5,
                              face = 'bold'
                              ),
    axis.text.x = element_text(face = 'bold', size = 12),
    axis.text.y = element_text(face = 'bold', size = 12),
    plot.caption = element_text(color = 'grey50',
                                hjust = 0,
                                size = 11)
  )



































