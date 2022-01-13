
# SANKEY PLOT FOR TREK ENERGY FLOW FUNCTIONS

# sankey diagram is a visualization used to depict a flow from one set of values to another.

library(tidyverse)
# install.packages("devtools")
# devtools::install_github("davidsjoberg/ggsankey")
library(ggsankey)
library(ggplot2)

df <- mtcars %>%
  make_long(cyl, vs, am, gear, carb)

ggplot(df, aes(x = x, 
               next_x = next_x, 
               node = node, 
               next_node = next_node,
               fill = factor(node))) +
  geom_sankey()+
  ggdark::dark_mode()


# -
ggplot(df, aes(x = x, next_x = next_x, node = node, next_node = next_node, fill = factor(node), label = node)) +
  geom_sankey(flow.alpha = .6,
              node.color = "gray20") +
  geom_sankey_label(size = 3, 
                    color = "white", 
                    fill = "gray20") +
  scale_fill_viridis_d() +
  theme_sankey(base_size = 18) +
  ggdark::dark_mode()+
  labs(x = NULL) +
  theme(legend.position = "none",
        plot.title = element_text(hjust = .5)) +
  ggtitle("Car features")



# Alluvial plots are very similar to sankey plots but have no spaces between nodes and start at y = 0 instead being centered around the x-axis.
ggplot(df, aes(x = x, 
               next_x = next_x, 
               node = node, 
               next_node = next_node, 
               fill = factor(node), 
               label = node)) +
  geom_alluvial(flow.alpha = .6) +
  geom_alluvial_text(size = 3, color = "white") +
  scale_fill_viridis_d() +
  theme_alluvial(base_size = 18) +
  labs(x = NULL) +
  theme(legend.position = "none",
        plot.title = element_text(hjust = .5)) +
  ggtitle("Car features")+
  ggdark::dark_mode()







#==========  geom_sankey_bump
# Sankey bump plots is mix between bump plots and sankey and mostly useful for time series.
# install.packages("gapminder")
library(gapminder)

df <- gapminder %>%
  group_by(continent, year) %>%
  summarise(gdp = (sum(pop * gdpPercap)/1e9) %>% round(0), .groups = "keep") %>%
  ungroup()

ggplot(df, aes(x = year,
               node = continent,
               fill = continent,
               value = gdp)) +
  geom_sankey_bump(space = 0, 
                   alpha= 0.5,
                   type = "alluvial", 
                   color = "transparent", 
                   smooth = 6) +
  scale_fill_viridis_d(option = "A", alpha = .8) +
  theme_sankey_bump(base_size = 16) +
  labs(x = NULL,
       y = "GDP ($ bn)",
       fill = NULL,
       color = NULL) +
  theme(legend.position = "bottom") +
  labs(title = "GDP development per continent")+
  ggdark::dark_mode()








