
library(tidyverse)
# library(ggridges)
library(paletteer)
library(scico)
library(viridis)



# get names of palettes for continuous
palettes_c_names

# get names of palettes for discrete
palettes_d_names

penguins %>% 
  ggplot(
    aes(x= flipper_length_mm,
        y= body_mass_g)
  )+
  aes(col= body_mass_g)+
  geom_point(show.legend = F, size= 3, alpha= 0.5)+
  ggdark::dark_mode()+
  geom_smooth(show.legend = F, fill='purple', color='orange')+
  scale_color_paletteer_c("ggthemes::Purple", 
                          direction = -1) +
  labs(title = "Dominion: Jem'Hadar attacks on Federation ships",
       subtitle = "Dominion War Data",
       x= "Jem'Hadar soldiers",
       y= "Federation Casualties")+
  theme(
    plot.title = element_text(face = 'bold', 
                              size = 14, 
                              hjust = 0.5,
                              color = '#955bb3'
                              ),
    plot.subtitle = element_text(hjust = 0.5, color = '#955bb3'),
    axis.text.y =   element_text( 
                                 color = '#955bb3',
                                 size = 12),
    axis.text.x = element_text(color = '#955bb3',
                               size = 12),
    axis.title.x = element_text(colour = '#955bb3', size = 13),
    axis.title.y  = element_text(colour = '#955bb3', size = 13 )
  )


# "ggthemes::Sunset-Sunrise Diverging"
# "ggthemes::Purple",   "ggthemes::Orange",   Gold-Purple Diverging
# Sunset-Sunrise Diverging
# "grDevices::rainbow"  grDevices::heat.colors"  Harmonic
# Peach  Sunset-Sunrise Diverging


















