

library(tidyverse)
library(ggplot2)

starwars = starwars

ggplot(
  starwars,
  aes(x= mass, y= eye_color, color= homeworld)
) +
  geom_col(show.legend = F, size= 3, alpha= .5) +
  ggdark::dark_mode()



library(tigris)

GACounties = tigris::counties(state = "GA", 
                              class='sf', 
                              year = 2017)

library(sf)
library(ggthemes)

ggplot() +
  geom_sf(data = GACounties
        ) +
  theme_map()+
  scale_fill_viridis_d()



#=====  packages for disabilities ===

# makes sound to describe plot
# install.packages('sonify')
library(sonify)


sonify( starwars$height )
sonify( iris$Petal.Width )

sonify( x= starwars$height, 
        y= starwars$height )


# =====
# text description of visual plot
# install.packages('BrailleR')
library(BrailleR)



library(showtext)
library(systemfonts)
library(ggtext)


# fonts: Poppins, Oswald, Raleway, Quicksand, Bebas Neue
#     Anton, Teko, Staatliches, Righteous, Fredoka One
font_add_google(family='Russo One','Russo One')
showtext_auto()

starwars$name = as_factor(starwars$name)
starwars %>% 
  filter(height > 150,
         mass < 500 & mass > 80) %>% 
  ggplot(aes(y= fct_reorder(name, mass) ,
             x = mass )) +
  geom_col(fill='gold')+
  labs(title = "Star Wars dataset",
       subtitle = "Characters by Mass (kg) over 80",
       y="")+
  ggdark::dark_mode()+
  # theme_solarized(light = F) +
  theme(
    text = element_text(family = 'Russo One'),
    plot.title = element_markdown(face = 'bold',
                                  size = 16),
    axis.title.x = element_text(color = 'gold', 
                                face = 'bold',
                                size=12),
    axis.title.y = element_text(color = 'gold', 
                                face = 'bold',
                                size=12),
    axis.text.x = element_markdown(size = 12, 
                                   color = 'gold'),
    axis.text.y = element_markdown(size = 12,
                                   color = 'gold')
                            
  )



BrailleR::VI(sw) 

# This is an untitled chart with no subtitle or caption.
# It has x-axis 'height' with labels 160, 180, 200 and 220.
# It has y-axis 'mass' with labels 0, 500, 1000 and 1500.
# The chart is a bar chart with 51 vertical bars.


diamonds = diamonds

library(scales)
library(paletteer)

font_add_google(family='Arima Madurai','Arima Madurai')
showtext_auto()

diamonds %>% 
  ggplot(
    aes(x= price,
        y= carat)
  )+
  aes(color= carat)+
  geom_point(alpha= 0.2, size= 2.5)+
  geom_jitter()+
  scale_x_continuous(labels = dollar_format() )+
  ggdark::dark_mode()+
  scale_color_paletteer_c("pals::ocean.oxy", 
                          direction = -1) +
  labs(title = "Diamonds Price by Carat")+
  theme(
    text = element_text(family = 'Arima Madurai'),
    plot.title = element_markdown(size = 14, 
                                  face = 'bold'),
    axis.text.x = element_markdown(size = 12),
    axis.title.x = element_markdown(size = 14),
    axis.text.y = element_markdown(size = 12),
    axis.title.y = element_markdown(size = 14)
  )



