library(shiny)
library(datasets) # 'iris' dataset
library(ggplot2)  # qplot
library(caret)    # train
library(rpart)
library(e1071)

shinyServer(function(input, output) {
  output$plot <- renderPlot({
    
    irisP <- as.data.frame(iris); irisP$Species <- rownames(iris)
    p <- ggplot(color=Species,data=iris, aes_string(x=input$x, y=input$y)) + geom_point(aes(color=Species, shape=Species))
    print(p)
  })
  
  output$prediction <- renderPrint ({
    #if (input$predict == TRUE) {
      
      if (!exists("modFit"))
      {
        modFit <- train(Species ~ ., method="rpart", data=iris)        
      }
      
      Sepal.Length = input$sl
      Sepal.Width = input$sw
      Petal.Length = input$pl
      Petal.Width = input$pw
      predict(modFit,data.frame(Sepal.Length,Sepal.Width,Petal.Length,Petal.Width))
    #}
  })
  
  
})
