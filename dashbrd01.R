

library(dashboardthemes)
library(shiny)
library(shinydashboard)
library(ggplot2)

ui <- dashboardPage(
  
  dashboardHeader(title = "Basic Dashboard"),
  
  dashboardSidebar(
    ## Sidebar content
    dashboardSidebar(
      sidebarMenu(
        menuItem("Dashboard", 
                 tabName = "dashboard", 
                 icon = icon("dashboard")),
        
        menuItem("Widgets", 
                 tabName = "widgets", 
                 icon = icon("th"))
      )
    )
  ),
  
  dashboardBody(
    # tab items
    tabItem(tabName = "dashboard",
            #boxes in row or columns
            fluidRow(
              box(plotOutput("plot1", height = 250)),
              box(
                title = "Controls",
                sliderInput(
                  "slider",
                  "Number of rows:", 1, 100, 50
                )#slider
              )#box
            )#row
            ),#tabitem
    
    # tabitem 2
    tabItem(tabName = "widgets",
            h2("Widgets tab content") )
    

  ),#body
  
  #======== theme
  shinyDashboardThemes(
    theme = "purple_gradient" #"grey_dark"
  ),
  thematic::thematic_shiny()
  
)


# ======
server <- function(input, output) { 
  
  set.seed(122)
  histdata = rnorm(500)
  
  output$plot1 = renderPlot({
    data = histdata[seq_len(input$slider)]
    hist(data,
         col = NULL,
         border = "white")
    

  })
  
  
}

shinyApp(ui, server)



















