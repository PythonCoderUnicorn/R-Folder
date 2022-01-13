
# gt Tables
library(systemfonts)

theme_set(theme_bw(base_family = "Raleway"))

library(tidyverse)
library(gtsummary)
# install.packages('gtsummary')
library(gt)
library(janitor)

survey <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-05-18/survey.csv')

survey = survey %>% clean_names() %>% drop_na(gender)

head(survey)

survey$gender %>% unique()

usa_survey = survey %>%   
  filter(!gender %in% c('Other or prefer not to answer','Prefer not to answer')) %>% 
  filter(country %in% c('United States','USA','u.s.','United States of America','usa','united states','us') ) %>% 
  mutate(country = fct_collapse(country, "USA" = c('United States','USA','u.s.','United States of America','usa','united states','us')  ))



canada_survey = survey %>% 
  filter(country =='Canada')

usa_survey = survey %>% 
  filter(currency =="USD" & country %in% c('United States','USA','u.s.','United States of America','usa','united states','us') ) %>% 
  mutate(gender = fct_collapse(gender,'Other/prefer not to answer' = c('Other or prefer not to answer','Prefer not to answer')),
         gender = fct_relevel(gender, 'Woman'))

survey$gender = as.factor(survey$gender)

nonbinary_survey =survey %>% filter(gender == 'Non-binary' ) 

head(nonbinary_survey)

nonbinary_survey = nonbinary_survey %>% 
  select(country, how_old_are_you, industry) %>%
  group_by(country) %>% 
  # filter(country %in% c('United States','USA','u.s.','United States of America','usa','united states','us') ) %>%
  mutate(country = fct_collapse(country, "USA" = c('United States','USA','u.s.','United States of America','usa','united states','us')  ))



usa_gender_avg.salary = usa_survey %>% 
  group_by(gender) %>% 
  summarise(avg_salary = mean(annual_salary)) %>% 
  ungroup()


# ===== table
usa_gender_avg.salary %>% 
  gt() %>% 
  cols_label( avg_salary = md("**Average yearly salary *(USD)***"),
              gender = md("**Respondent's <br> gender**") ) %>% 
  tab_header(title = "Average annual salary",
             subtitle = md("N = 21,091 (USA)") ) %>% 
  tab_source_note("Source: TidyTuesday - Ask a Manager Survey")





usa_gender_avg.salary = usa_gender_avg.salary %>% 
  gt() %>% 
  cols_label( avg_salary = md("**Average yearly salary *(USD)***"),
              gender = md("**Respondent's <br> gender**") ) %>% 
  tab_header(title = "Average annual salary",
             subtitle = md("N = 21,091 (USA)") ) %>% 
  tab_source_note("Source: TidyTuesday - Ask a Manager Survey") %>% 
  cols_width(gender ~ px(300),
             avg_salary ~ px(200),
             everything() ~ px(250))


usa_gender_avg.salary %>% 
  data_color(
    columns = gender,
    colors = c("tomato1" ,"tomato2","tomato3","tomato4" )
  )


usa_gender_avg.salary %>% 
  data_color(
    columns = avg_salary,
    colors = scales::col_numeric(
      palette = c('white','seagreen'),
      domain = NULL ) # null = max and min values
    )

usa_gender_avg.salary %>% 
  data_color(
    columns = avg_salary,
    colors = scales::col_numeric(
      palette = c('white','seagreen'),
      domain = c(60e3, 120e3) )# makes lowest value have some color
  ) 


usa_gender_avg.salary %>% 
  summary_rows(
    columns = avg_salary,
    fns = list("overall average" = "mean"),
    use_seps = F
  ) %>% 
  cols_align( align = 'left', columns = gender)





edu_survey = usa_survey %>% 
  drop_na(highest_level_of_education_completed) %>% 
  mutate(highest_level_of_education_completed = fct_relevel(highest_level_of_education_completed, "High School", "Some college","College degree")) %>%
  group_by(gender, highest_level_of_education_completed) %>% 
  summarise(avg_salary = mean(annual_salary)) %>% 
  ungroup()

head(edu_survey)


edu_survey= edu_survey %>% 
  gt(
    groupname_col = 'highest_level_of_education_completed'
  )





edu_survey.table = edu_survey %>% 
  tab_header(title = "Average annual salary",
             subtitle = "N= 17550 (USA)") %>% 
  cols_label(
    avg_salary = md("**Average yearly salary** <br> (*in USD*)"),
    gender = md("**Respondent's <br> gender**")
  ) %>% 
  tab_source_note("Source: TidyTuesday - Ask a Manager Survey") %>% 
  data_color(
    columns = avg_salary,
    colors = scales::col_numeric(
      palette = c('white','seagreen'),
      domain = NULL )# c(60e3, 120e3) makes lowest value have some color
  ) %>% 
  tab_footnote(
    footnote = "Color shows annual salary",
    locations = cells_column_labels( columns = avg_salary)
  ) %>% 
  cols_align(align = 'right', columns = gender)

gender_edu = edu_survey %>% 
  summary_rows(
    groups = T,
    columns = avg_salary,
    fns = list('group average' = 'mean'),
    use_seps = F
  )


gender_edu %>% 
  data_color(
    columns = avg_salary,
    colors = scales::col_numeric(
      palette = c('white','seagreen'),
      domain = NULL )# c(60e3, 120e3) makes lowest value have some color
  )





exp_gender = usa_survey %>% 
  group_by(gender, overall_years_of_professional_experience) %>% 
  summarise(avg_salary = mean(annual_salary)) %>% 
  ungroup() %>% 
  pivot_wider(
    names_from = gender,
    values_from = avg_salary
  )

head(exp_gender)


exp_race = usa_survey %>% 
  group_by(race) %>% 
  filter( n() > 400) %>% 
  ungroup() %>% 
  group_by(race, gender, overall_years_of_professional_experience) %>% 
  summarise(avg_salary = mean(annual_salary)) %>% 
  ungroup() %>% 
  pivot_wider(
    names_from = race,
    values_from = avg_salary
  )

head(exp_race)


exp_total =left_join(exp_gender, exp_race) %>% 
  mutate(overall_years_of_professional_experience = fct_relevel(overall_years_of_professional_experience,"1 year or less",'2 - 4 years','5-7 years','8 - 10 years','11 - 20 years','21 - 30 years','31 - 40 years'),
         overall_years_of_professional_experience = fct_recode(overall_years_of_professional_experience, "5 - 7 years" = "5-7 years")) %>% 
  arrange(overall_years_of_professional_experience)

head(exp_total)

exp_total %>% gt()

gt_exp_total = exp_total %>% 
  gt() %>% 
  tab_spanner(
    label = "Gender",
    columns = c(Woman, Man, 'Non-binary','Other/prefer not to answer')
  ) %>% 
  tab_spanner(
    label = 'Race',
    columns = c(White,'Black or African American','Asian or Asian American')
  )



gt_exp_total %>% 
  cols_label(overall_years_of_professional_experience = md("**Total years of professional experience**")
             ) %>% 
  tab_style(
    style = list(cell_text(weight = 'bold')),
    locations = list(
      cells_column_labels( everything() ),
      cells_column_spanners( everything() ) 
      )
    ) %>% 
  cols_width( overall_years_of_professional_experience ~ px(200),
              everything() ~ px(120)) %>% 
  tab_source_note("Source: TidyTuesday - Ask a Manager Survey") %>% 
  tab_header(title = "Average annual salary",
             subtitle = "N= 17550 (USA)") %>% 
  data_color(
    columns = Woman:'Other/prefer not to answer',
    colors = scales::col_numeric(
      palette = c('white','seagreen'),
      domain = c(40e3, 160e3) )# c(60e3, 120e3) makes lowest value have some color
  ) %>% 
  data_color(
    columns = "Asian or Asian American": White,
    colors = scales::col_numeric(
      palette = c('white','purple'),
      domain = c(40e3, 160e3) )# c(60e3, 120e3) makes lowest value have some color
  ) %>% 
  tab_options(
    heading.background.color = 'lightgray',
    heading.title.font.size = 24,
    heading.title.font.weight = 'bold',
    heading.subtitle.font.size = 20
  )




  
  
  
  












