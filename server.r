library(shiny)
shinyServer(function(input, output) {
  model <- lm(Sepal.Width ~ Sepal.Length, data = iris)
  
  modelpred <- reactive({
    LengthInput <- input$Sepal.Length
    predict(model, newdata = data.frame(Sepal.Length = LengthInput))
  })
  
  output$plot <- renderPlot({
    LengthInput <- input$Sepal.Length
    
    plot(iris$Sepal.Length, iris$Sepal.Width, xlab = "Length",
         ylab = "Width", bty = "n", pch = 16,
         xlim = c(0, 20), ylim = c(0, 10))
    if(input$showModel){
      abline(model, col = "green", lwd = 2)
    }
    
    legend(25, 250, c("Model Prediction"), pch = 16,
           col = "red", bty = "n", cex = 1.2)
    points(LengthInput, modelpred(), col = "blue", pch = 16, cex = 2)
  })
  output$pred <- renderText({
    modelpred()
  })
})
