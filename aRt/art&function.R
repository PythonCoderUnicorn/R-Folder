
# RLadies ggplot

library(ggforce)
library(ggfx)
library(tidyverse)
library(viridis)
library(paletteer)

df = tibble(
  x= runif(1000, min=3, max = 40),
  y= runif(1000, 3, 40),
  z= runif(1000, 3, 40)
)

df %>% 
  ggplot(
    aes(x= x,
        y= y,
        fill= z
        )
  )+
  # geom_point()+
  # geom_count()+
  # geom_bin2d()+
  # geom_crossbar(aes(ymin=4, ymax=80)) +
  # geom_density_2d(col='pink') +
  # geom_density_2d_filled()+
  # geom_diagonal(aes(xend=5, yend=90))+
  # geom_ellipse(aes(x0 = 0, y0 = 0, a = 10, b = 3, angle = -4) )+ # ggforce
  # geom_hex()+
  # geom_jitter()+
  # geom_line()+
  # geom_mark_ellipse()+
  # geom_point()+
  # geom_polygon()+
  # geom_rug()+
  # geom_spiro(aes(R = 5, r = 1, d = 3), col='#5d118a')+
  # geom_shape()+
  # geom_violin()+
  # geom_sina(aes(color= z, x= x))+
  geom_spoke( aes(angle= 77, radius= 108), color='pink')+
  geom_spoke( aes(angle= 7, radius= 88), color='#4bf542')+ # green
  geom_spoke( aes(angle= 377, radius= 118), color='#6342f5')+ # blue
  geom_spoke( aes(angle= -97, radius= 11), color='#fa600e')+ # orange
  geom_spoke( aes(angle= -78, radius= -29), color='#f54242')+ # red
  geom_spoke( aes(angle= 9, radius= 55), color='#1500ff')+ # blue
  geom_spoke( aes(angle= -13, radius= 38), color='#f5e642')+ # yellow
  geom_spoke( aes(angle= 90, radius= 64), color='#bf42f5')+ # purple
  geom_spoke( aes(angle= -40, radius= 64), color='#fc1ef1')+ # pink
  
  
  # scale_fill_paletteer_c("grDevices::PuRd") +
  theme_void()+
  theme(
    legend.position = 'none',
    panel.background = element_rect(fill = 'black')
  )




# geom_spiro(aes(R = 10, r = 3, d = 5), col='#5d118a')+ # ggforce
# geom_spiro(aes(R = 15, r = 6, d = 7), col='#5d118a')+
# geom_spiro(aes(R = 20, r = 9, d = 9), col='#5d118a')+
# geom_spiro(aes(R = 25, r = 11, d = 12), col='#5d118a')+
# # geom_spiro(aes(R = 30, r = 13, d = 15))+

# ============== dotplot
df %>% 
  ggplot(
    aes(x= x
        # y= y,
        # col= x
    )
  )+
  geom_dotplot(binwidth = 1.5, fill='yellow')+
  theme_void()+
  theme(
    legend.position = 'none',
    panel.background = element_rect(fill = 'black')
  )



ggplot(mtcars, aes(x = mpg)) +
  geom_dotplot(binwidth = 1.5, stackdir = "center", fill='green')+
  theme_void()+
  theme(
    legend.position = 'none',
    panel.background = element_rect(fill = 'black')
  )




ggplot(mtcars, aes(x = mpg)) +
  geom_freqpoly(bins=40, col='yellow')+
  theme_void()+
  theme(
    legend.position = 'none',
    panel.background = element_rect(fill = 'black')
  )




















# Unimodal
a <- rnorm(500, 6, 1)
b <- rnorm(400, 5, 1.5)

# Bimodal
c <- c(rnorm(200, 3, .7), rnorm(50, 7, 0.4))

# Trimodal
d <- c(rnorm(200, 2, 0.7), rnorm(300, 5.5, 0.4), rnorm(100, 8, 0.4))

df <- data.frame(
  'Distribution' = c(
    rep('Unimodal 1', length(a)),
    rep('Unimodal 2', length(b)),
    rep('Bimodal', length(c)),
    rep('Trimodal', length(d))
  ),
  'Value' = c(a, b, c, d)
)

# Reorder levels
df$Distribution <- factor(
  df$Distribution,
  levels(df$Distribution)[c(3, 4, 1, 2)]
)

p <- ggplot(df, aes(Distribution, Value))

p +
  geom_violin() +
  geom_sina(scale = FALSE, col='pink')+
  # scale_fill_viridis_c(option = 'C')+
  theme_void()+
  theme(
    legend.position = 'none',
    panel.background = element_rect(fill = 'black')
  )








ggplot(iris, 
       aes(x= Sepal.Length, 
           y= Sepal.Width, 
           group = -1L,
           fill = Species
           )) +
  geom_voronoi_tile() +
  geom_voronoi_segment() +
  # geom_text(aes(label = stat(nsides), 
  #               size = stat(vorarea)),
  #           stat = 'delvor_summary', 
  #           switch.centroid = TRUE
  # )+
  scale_fill_paletteer_d("beyonce::X10")+
  # scale_fill_viridis_d(option = 'C')+
  theme_void()+
  theme(
    legend.position = 'none',
    panel.background = element_rect(fill = 'black')
  )



ggplot(iris, 
       aes(Sepal.Length, 
           Sepal.Width, 
           group = -1L,
           fill = Species
           )
       ) +
  geom_voronoi_tile(
                    colour = 'black', 
                    max.radius = 0.25)+
  scale_fill_paletteer_d("beyonce::X21")+
  # scale_fill_viridis_d(option = 'C')+
  theme_void()+
  theme(
    legend.position = 'none',
    panel.background = element_rect(fill = 'black')
  )


g = ggplot(iris, aes(x= Sepal.Length, 
                     y= Sepal.Width, 
                     group = -1L,
                     fill = Species
                     )
           )
g +
  geom_voronoi_tile(colour = 'black',
                    expand = unit(-.5, 'mm'), 
                    radius = unit(2, 'mm')
                    )+
  scale_fill_paletteer_d("beyonce::X24")+
  # scale_fill_viridis_d(option = 'C')+
  theme_void()+
  theme(
    legend.position = 'none',
    panel.background = element_rect(fill = 'black')
  )



g +
  geom_delaunay_tile(alpha = 0.3, colour = 'magenta')+
  scale_fill_paletteer_d("beyonce::X24")+
  # scale_fill_viridis_d(option = 'C')+
  theme_void()+
  theme(
    legend.position = 'none',
    panel.background = element_rect(fill = 'black')
  )


g +
  geom_delaunay_segment2(aes(colour = Species, group = -1), 
                         size = 2,
                         lineend = 'round')+
  # scale_fill_paletteer_d("beyonce::X24")+
  scale_color_paletteer_d("beyonce::X27")+
  # scale_fill_viridis_d(option = 'C')+
  theme_void()+
  theme(
    legend.position = 'none',
    panel.background = element_rect(fill = 'black')
  )







ggplot(mpg) +
  geom_point(aes(x = .panel_x, y = .panel_y)) +
  facet_matrix(vars(displ, cty, hwy))+
  # scale_fill_paletteer_d("beyonce::X24")+
  scale_color_paletteer_d("beyonce::X27")+
  # scale_fill_viridis_d(option = 'C')+
  ggdark::dark_mode()
  # theme_void()+
  # theme(
  #   legend.position = 'none',
  #   panel.background = element_rect(fill = 'black')
  # )


ggplot(mpg) +
  geom_boxplot(aes(x = .panel_x, y = .panel_y, group = .panel_x)) +
  facet_matrix(rows = vars(cty, hwy), cols = vars(drv, fl))+
  scale_color_paletteer_d("beyonce::X27")+
  # scale_fill_viridis_d(option = 'C')+
  ggdark::dark_mode()













