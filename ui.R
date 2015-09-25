library(shiny)
library(datasets) # 'iris' dataset

shinyUI(pageWithSidebar(
  headerPanel('Exploring the Iris data set'),
  sidebarPanel(
    # Exploration
    tags$h3("Exploration"),
    selectInput('x', '1st Variable', names(iris)[1:4]),
    selectInput('y', '2nd Variable', names(iris)[1:4], selected=names(iris)[[2]]),
    
    # Prediction
    tags$h3("Prediction"),
    #checkboxInput("predict", "enabled", FALSE),
    sliderInput('pw', 'Petal.Width', 1.5, min = 0, max= 3, step = 0.1),
    sliderInput('pl', 'Petal.Length', 4, min = 1, max= 8, step = 0.1),
    sliderInput('sw', 'Sepal.Width', 2.5, min = 1, max= 5, step = 0.1),
    sliderInput('sl', 'Sepal.Length', 4, min = 1, max= 8, step = 0.1),
    
    #tags$h3("Documentation"),
    tags$p("Use drop down to explore the data set or the solders to predict species")
    #"Code ",
    #tags$a(href="https://github.com/", "on github")
  ),
  mainPanel(
    # fix me
    plotOutput('plot'),
    
    h3('Predicted iris\'s species:'),
    verbatimTextOutput("prediction")
  )
))

# install.packages('devtools')
# devtools::install_github('rstudio/rsconnect')
# library(rsconnect)
# deployApp()