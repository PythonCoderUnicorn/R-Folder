
library(tidyverse)

df = tribble(
  ~race, ~sex, ~gender, ~LGBT,
  1124, 354, 354, 1294,
  115,1165,1153,36,
  2,0,10,141,
  167,0,10,141,
  2, 0,2,11,
  81, 0, 0, 0,
  28, 0, 0,0 )


df %>% 
  mutate(gender = as.factor(1:7),
         gender = c("Male","Female",
                    "Non-Binary","Trans-Female",
                    "Trans-Male",'Agender',"Prefer Not to Say"))





library(rvest)
library(dplyr)

get_cast = function(movie_link) {
  movie_page = read_html(movie_link)
  movie_cast = movie_page %>% html_nodes(".primary_photo+ td a") %>%
    html_text() %>% paste(collapse = ",")
  return(movie_cast)
}

movies = data.frame()

for (page_result in seq(from = 1, to = 51, by = 50)) {
  link = paste0("https://www.imdb.com/search/title/?title_type=feature&num_votes=25000,&genres=adventure&sort=user_rating,desc&start=", 
                page_result, "&ref_=adv_nxt")
  page = read_html(link)
  
  name = page %>% html_nodes(".lister-item-header a") %>% html_text()
  movie_links = page %>% html_nodes(".lister-item-header a") %>%
    html_attr("href") %>% paste("https://www.imdb.com", ., sep="")
  year = page %>% html_nodes(".text-muted.unbold") %>% html_text()
  rating = page %>% html_nodes(".ratings-imdb-rating strong") %>% html_text()
  synopsis = page %>% html_nodes(".ratings-bar+ .text-muted") %>% html_text()
  cast = sapply(movie_links, FUN = get_cast, USE.NAMES = FALSE)
  
  
  movies = rbind(movies, data.frame(name, year, rating, synopsis, cast, stringsAsFactors = FALSE))
  
  print(paste("Page:", page_result))  
}










col_link = "https://www.patriotsoftware.com/blog/accounting/average-cost-living-by-state/"
col_page = read_html(col_link)

col_table = col_page %>% html_nodes("table#featuresGrid") %>%
  html_table() %>% .[[1]]


wiki_link = "https://en.wikipedia.org/wiki/List_of_apple_cultivars"
wiki_page = read_html(wiki_link)

apple_table = wiki_page %>% html_nodes("table") %>% .[2] %>% 
  html_table(fill = TRUE) %>% .[[1]]
















