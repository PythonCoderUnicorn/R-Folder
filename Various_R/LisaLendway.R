
library(tidyverse)
library(palmerpenguins)

penguins

# quant variable distribution
ggplot(
  penguins,
  aes(x= bill_length_mm)
) +
  geom_histogram(bins = 35, fill='seagreen') + 
  ggdark::dark_mode()



# summary stats
penguins %>% 
  summarise(bill_mean = mean(bill_length_mm, na.rm=T),
            bill_sd = sd(bill_length_mm, na.rm=T),
            bill_median = median(bill_length_mm, na.rm=T),
            bill_IQR = IQR(bill_length_mm, na.rm=T)
            )




# density plot
ggplot(
  penguins,
  aes(x= bill_length_mm)
) +
  geom_density(bins = 35, fill='seagreen') + 
  ggdark::dark_mode()


# categorical var
penguins %>% 
  ggplot(
    aes(x= fct_infreq(island),
        fill='seagreen')
  )+
  geom_bar(show.legend = F)+
  labs(x= "Island", y="Count", title = "Penguins data by island")+
  ggdark::dark_mode() +
  coord_flip()


# multivariate 
library(ggridges)

# quant vs quant
penguins %>% 
  ggplot(
    aes(x= flipper_length_mm,
        y= body_mass_g)
  ) +
  geom_point()+
  geom_jitter(alpha= 0.5, color='seagreen')+
  geom_smooth()+
  ggdark::dark_mode()



penguins %>% 
  summarize(correlate = cor(flipper_length_mm, body_mass_g,
            use = 'pairwise.complete.obs'))


# quant vs categorical
penguins %>% 
  ggplot(
    aes(x= body_mass_g,
        y= island)
  )+
  geom_boxplot()+
  ggdark::dark_mode()


penguins %>% 
  ggplot(
    aes(x= body_mass_g,
        y= island)
  )+
  geom_density_ridges(fill="springgreen", alpha=0.5 )+
  ggdark::dark_mode()



penguins %>% 
  group_by(island) %>% 
  summarize(mean_mass = mean(body_mass_g, na.rm=T),
            sd_mass = sd(body_mass_g, na.rm=T)
            )















