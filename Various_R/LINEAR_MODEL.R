
# LINEAR MODELS

library(broom)
library(tidyverse)
library(AER)


cars = mtcars

summary(cars)

cars <- cars %>%
  mutate(across(.cols = c("cyl", "vs", "am", "gear"), .fns = factor))

# --- Linear Regression
#   ~ . means all other columns
LinReg = lm(mpg ~ ., data = cars )
LinReg
summary(LinReg)


# another method
columns = "mpg ~ cyl + sqrt(disp) + hp + drat + wt + qsec + hp:wt"
LinReg = lm(columns, data = cars)
summary(LinReg)


# get the summary stats of Linear Regression
tidy(LinReg)

glance(LinReg)

augmentedcars = augment(LinReg, data= cars)
augmentedcars

