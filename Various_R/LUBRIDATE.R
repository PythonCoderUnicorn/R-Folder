
# lubridate

library(tidyverse)
library(nycflights13)
library(lubridate)

day = today()
day
str(day)

datetime.now = now()
datetime.now

# convert string dates to date class
s = "2021-08-08"
class(s)
date1 = as.Date(s)
class(date1)

date2 = as_datetime(s)

# lubridate handles various date formats
date.1 = "20200808"
ymd_ = ymd(date.1)
ymd_

date.2 = "09-05-2021"
mdy_ = mdy(date.2)
mdy_

date.3 = "3/1/2021"
dmy_ = dmy(date.3)
dmy_

date.4 = "04-20-2020 14:20:00"
mdy.hms = mdy_hms(date.4)
mdy.hms


s2 = "June 3 2021"
stringy.date = mdy(s2)
stringy.date

s3 = "3rd of May, 2020"
str.date = dmy(s3)
str.date



# component functions
todayDate = "2021-06-5 18:20"
year(todayDate)
month(todayDate)
month(todayDate)
mday(todayDate)
hour(todayDate)
minute(todayDate)
second(todayDate)
yday(todayDate) # numbered day of the year
wday(todayDate) # day of the week, Sunday = 1

#  durations = exact number of seconds between instances
#  periods = measure of change in clock time between 2 instances
#  intervals = timespans start:end

# start.date = as_datetime("2021-06-05 12:01:00")
end.date = as_datetime("2021-08-08")

difftime = end.date - datetime.now
difftime

duration.date = as.duration(difftime) # in seconds
duration.date

duration.period = as.period(difftime) # duration breakdown 
duration.period

Today.start = today()
Today.start
end.date = as_datetime("2021-08-08")

delta = end.date - Today.start
delta.period = as.period(delta)
delta.period





# -----------------------------------
#  flight date times
df = flights %>% 
  dplyr::select(flight, 
                carrier,
                time_hour)
df

# --- mutate a new column
# bar chart of flights count by month
df %>% 
  mutate( month = month(time_hour,
                        label = T)) %>% 
  ggplot() +
  geom_bar( aes(x= month), 
            fill= "magenta",
            color= "purple")



# -- line plot of flights by hour of day
df %>% 
  mutate(hour = hour(time_hour)) %>% 
  group_by(hour) %>% 
  tally() %>% 
  ggplot() +
  geom_line( aes(x= hour,
                 y= n)) +
  scale_x_continuous(breaks =  seq(0,24,4))



# ----------------------














duration.interval = as.interval(start.date, end.date)
duration.interval




#  add to start date
start.date + dhours(5)
start.date + dminutes(23)

# daylight savings datetimes is sensitive










