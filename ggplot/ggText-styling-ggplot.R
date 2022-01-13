
library(tidyverse)
library(ggplot2)
library(ggdark)
library(ggtext)
library(glue)

n = runif(1000, min=100, max = 3000)

ggplot( )+
  aes(x=n)+
  geom_histogram(fill="green", color='black')+
  ggdark::dark_mode()+
  labs(title = "DominionPrime Algae Paste Sales",
       x="",
       y="Sales")+
  labs(caption = "Example posted on **stackoverflow.com**<br>(using made-up data)") +
  theme(
    axis.text.x= element_markdown(color = "green"),
    axis.text.y = element_markdown(),
    plot.caption = element_markdown(lineheight = 1.2),
    plot.title = element_textbox_simple(
      size = 14,
      color = 'green',
      # lineheight = 1,
      # padding = margin(5.5, 5.5, 5.5, 5.5),
      margin = margin(0, 0, 5.5, 0),
      # fill = "cornsilk"
    ),
  )




data <- tibble(
  bacteria = c("Staphylococcaceae", "Moraxella", "Streptococcus", "Acinetobacter"),
  location = c("L1", "L2", "L3", "L4"),
  value = c(-0.5, 0.5, 2, 3)
)

data %>% mutate(
  color = c("#66cc00", "#D55E00", "#0072B2", "#ff6699"),
  name = glue("<i style='color:{color}'>{bacteria}</i> ({location})"),
  name = fct_reorder(name, value)
)  %>%
  ggplot(aes(value, name, fill = color)) + 
  geom_col(alpha = 0.5) + 
  ggdark::dark_mode()+
  scale_fill_identity() +
  labs(
    title = "Coloring each bacteria with ggText",
    caption = "Example posted on **stackoverflow.com**<br>(using made-up data)") +
  theme(
    axis.text.y = element_markdown(),
    plot.caption = element_markdown(lineheight = 1.2),
    plot.title = element_textbox_simple(
      size = 14,
      color = 'magenta')
  )






ggplot(mtcars, aes(disp, mpg)) + 
  geom_point() +
  ggdark::dark_mode()+
  labs(
    title = "<b>Fuel economy vs. engine displacement</b><br>
    <span style = 'font-size:10pt'>Lorem ipsum *dolor sit amet,*
    consectetur adipiscing elit, **sed do eiusmod tempor incididunt** ut
    labore et dolore magna aliqua. <span style = 'color:orange;'>Ut enim
    ad minim veniam,</span> quis nostrud exercitation ullamco laboris nisi
    ut aliquip ex ea commodo consequat.</span>",
    x = "displacement (in<sup>3</sup>)",
    y = "Miles per gallon (mpg)<br><span style = 'font-size:8pt'>A measure of
    the car's fuel efficiency.</span>"
  ) +
  theme(
    plot.title.position = "plot",
    plot.title = element_textbox_simple(
      size = 13,
      lineheight = 1,
      padding = margin(5.5, 5.5, 5.5, 5.5),
      margin = margin(0, 0, 5.5, 0),
      fill = "grey20"
    ),
    axis.title.x = element_textbox_simple(
      width = NULL,
      padding = margin(4, 4, 4, 4),
      margin = margin(4, 0, 0, 0),
      linetype = 1,
      r = grid::unit(8, "pt"),
      fill = "grey20"
    ),
    axis.title.y = element_textbox_simple(
      hjust = 0,
      orientation = "left-rotated",
      minwidth = unit(1, "in"),
      maxwidth = unit(2, "in"),
      padding = margin(4, 4, 2, 4),
      margin = margin(0, 0, 2, 0),
      fill = "grey30"
    )
  )








library(cowplot)

ggplot(mpg, aes(cty, hwy)) + 
  geom_point(color='orange', size=4, alpha= 0.2) +
  ggdark::dark_mode()+
  facet_wrap(~class, nrow = 2) +
  labs(title = "MPG dataset w/ cowplot")+
  # theme_half_open(12) +
  # background_grid() +
  theme(
    plot.title = element_textbox_simple(
      size = 14,
      padding = margin(4, 4, 2, 4),
      margin = margin(0, 0, 2, 0),
      color = 'magenta'),
    # strip.background = element_blank(),
    strip.text = element_textbox(
      size = 12,
      color = "#00ff00", 
      fill = "grey20", 
      box.color = "#9966ff",
      halign = 0.5, 
      linetype = 1, 
      r = unit(5, "pt"), 
      width = unit(1, "npc"),
      padding = margin(2, 0, 1, 0), 
      margin = margin(3, 3, 3, 3)
    )
  )






df <- tibble(
  label = c(
    "Some text **in bold.**",
    "Linebreaks<br>Linebreaks<br>Linebreaks",
    "*x*<sup>2</sup> + 5*x* + *C*<sub>*i*</sub>",
    "Some <span style='color:blue'>blue text **in bold.**</span><br>And *italics text.*<br>
    And some <span style='font-size:18pt; color:black'>large</span> text."
  ),
  x = c(.2, .1, .5, .9),
  y = c(.8, .4, .1, .5),
  hjust = c(0.5, 0, 0, 1),
  vjust = c(0.5, 1, 0, 0.5),
  angle = c(0, 0, 45, -45),
  color = c("purple", "blue", "orange", "red"),
  fill = c("grey10", "grey10", "grey30", "grey10")
)

ggplot(df) +
  aes(
    x, y, label = label, angle = angle, color = color, fill = fill,
    hjust = hjust, vjust = vjust
  ) +
  geom_richtext() +
  geom_point(color = "magenta", size = 2) +
  labs(title = "ggText text on the plot")+
  scale_color_identity() +
  scale_fill_identity() +
  xlim(0, 1) + ylim(0, 1)+
  ggdark::dark_mode()+
  theme(plot.title = element_textbox_simple(
    color = 'green',
    padding = margin(2, 2, 5, 2),
    margin = margin(0, 0, 2, 0) ))








ggplot(df) +
  aes(
    x, y, label = label, angle = angle, color = color,
    hjust = hjust, vjust = vjust
  ) +
  geom_richtext(
    fill = NA, label.color = NA, # remove background and outline
    label.padding = grid::unit(rep(0, 4), "pt") # remove padding
  ) +
  geom_point(color = "yellow", size = 2) +
  scale_color_identity() +
  xlim(0, 1) + ylim(0, 1)+
  labs(title = "ggText text w/ no borders")+
  ggdark::dark_mode()+
  theme(plot.title = element_textbox_simple(
    color = 'green',
    padding = margin(2, 2, 5, 2),
    margin = margin(0, 0, 2, 0) ))











# ======= doesnt work

# df <- tibble(
#   label = rep("Lorem ipsum dolor **sit amet,** consectetur adipiscing elit,
#     sed do *eiusmod tempor incididunt* ut labore et dolore magna
#     aliqua.", 2),
#   x = c(0, .6),
#   y = c(1, .6),
#   hjust = c(0, 0),
#   vjust = c(1, 0),
#   orientation = c("upright", "right-rotated"),
#   color = 'green',
#   fill = c("cornsilk","white")
# # )
# ggplot(df) +
#   aes(
#     x, y, label = label, color = color, fill = fill,
#     hjust = hjust, vjust = vjust,
#     orientation = orientation
#   ) +
#   geom_textbox(width = unit(0.4, "npc")) +
#   geom_point(color = "black", size = 2) +
#   scale_discrete_identity(aesthetics = c("color", "fill", "orientation")) +
#   xlim(0, 1) + ylim(0, 1)
# 
# 



















# =====================
library(lubridate)

today = today() # get today's date

mday(today)

wday(today)
wday(today, week_start = getOption("lubridate.week.start", 1))

# === day of week from integer date
wday(ymd(20200929), label = TRUE)


day(today) # day of month


strptime(today, format = "%Y-%m-%d")












