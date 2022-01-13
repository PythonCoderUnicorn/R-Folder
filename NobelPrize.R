

library(tidyverse)
library(ggplot2)
library(ggdark)
library(lubridate)
library(systemfonts)
library(scales)
library(janitor)
library(viridis)
library(ggtext)

theme_set(theme_bw(base_family = "Raleway"))

nobels = read_csv("Nobel_Laureates_1901-2016.csv")

nobels = nobels %>% clean_names()

glimpse(nobels)


nobels %>% 
  select(year, category,  sex) %>% 
  drop_na() %>% 
  group_by(category) %>% 
  count(sex, sort = T) %>% 
  ggplot( aes(x= n, y= fct_reorder(category, n) , fill= sex))+
  geom_col( )+
  ggdark::dark_mode()+
  scale_fill_manual(values = c("#53f5b4", "#8653f5")) +
  labs(title = "**Nobel Peace Prize Laureates** (1901 - 2016)",
       subtitle = "Count by Category by Sex",
       x= "Count",
       y= "Nobel Category",
       caption = "@StarTrek_Lt | Oct 10, 2021"
       )+
  theme(
    plot.title = element_markdown(size = 14, vjust = 0.5, hjust = 0.5),
    plot.subtitle = element_markdown(size = 12, hjust = 0.5, vjust = 0.5),
    axis.title = element_text(color = "white", size = 11 ),
    axis.title.x = element_markdown(color = "white", size = 11),
    axis.title.y = element_markdown(size = 11, color = 'white' ),
    axis.text.y  = element_markdown(size = 12),
    plot.caption = element_markdown(size = 10)
  )


nobels %>% 
  select(year, sex, full_name, category) %>% 
  filter(sex =="Female") %>%
  # count(category, sort = T) %>% 
  ggplot( aes(x= year, y= category, color=year))+
  geom_point( size= 5, alpha= 0.3, color='#43f7af')+
  ggdark::dark_mode()+
  # geom_text( aes(label= full_name, size=3, hjust=2))+
  labs(title = "**Female Nobel Peace Prize Laureates** (1901 - 2016)",
       subtitle = "Category by Year",
       x= "Year",
       y= "Nobel Category",
       caption = "@StarTrek_Lt | Oct 10, 2021"
  )+
  theme(
    plot.title = element_markdown(size = 14, vjust = 0.5, hjust = 0.5),
    plot.subtitle = element_markdown(size = 12, hjust = 0.5, vjust = 0.5),
    axis.title = element_text(color = "white", size = 11 ),
    axis.title.x = element_markdown(color = "white", size = 11),
    axis.title.y = element_markdown(size = 11, color = 'white' ),
    axis.text.y  = element_markdown(size = 12),
    plot.caption = element_markdown(size = 10)
  )

#   ggplot( aes(x= n, y= fct_reorder(category, n) ))+
# geom_col(fill= '#57ff52')+ # 
#   geom_text(aes(label= n,  hjust= 2, vjust= 2), size= 4, color='black')+
#   ggdark::dark_mode()+
#   labs(title = "**Female Nobel Peace Prize Laureates** (1901 - 2016)",
#        subtitle = "Count by Category",
#        x= "Count",
#        y= "Nobel Category",
#        caption = "@StarTrek_Lt | Oct 10, 2021"
#   )+
#   theme(
#     plot.title = element_markdown(size = 14, vjust = 0.5, hjust = 0.5),
#     plot.subtitle = element_markdown(size = 12, hjust = 0.5, vjust = 0.5),
#     axis.title = element_text(color = "white", size = 11 ),
#     axis.title.x = element_markdown(color = "white", size = 11),
#     axis.title.y = element_markdown(size = 11, color = 'white' ),
#     axis.text.y  = element_markdown(size = 12),
#     plot.caption = element_markdown(size = 10)
#   )






















