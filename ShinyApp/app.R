#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(bslib)
library(tidyverse)
library(shinythemes)
# library(palmerpenguins)
library(ggplot2)
library(babynames)
library(ggdark)

babynames
# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # theme = bslib::bs_theme_preview(),
    theme = bslib::bs_theme(
    bg = "#0F2D4D", fg = "#33F9D3", font_scale = NULL, 
    bootswatch = "cosmo",
        version = 4,
        base_font = font_google("Raleway"),
    # 
    ),
    thematic::thematic_shiny(),

    # Application title
    titlePanel("baby names"),
    
    textInput(
        inputId = "name",
        label = "Name",
        value = "",
        placeholder = "baby name"
    ),
    selectInput(
      inputId = "sex",
      label = "Sex:",
      choices = list(Female="F", 
                     Male= "M")
    ),
    sliderInput(inputId = "year",
                label = "Year Range:",
                min = min(babynames$year),
                max = max(babynames$year),
                value = c(min(babynames$year), 
                          max(babynames$year)),
                sep=""),
    
    submitButton(text = "Submit Button"),
   
    plotOutput(outputId = "nameplot"),

)

# Define server logic required to draw a histogram
server <- function(input, output) {
    # bslib::bs_themer()
    output$nameplot = renderPlot(
        babynames %>%
            filter(sex==input$sex,
                   year==input$name) %>%
            ggplot(aes(x= year, 
                       y= n))+
            geom_point(color="white")+
            scale_x_continuous(limits = input$year)
    )
   
    
}#function

# Run the application 
shinyApp(ui = ui, server = server)
