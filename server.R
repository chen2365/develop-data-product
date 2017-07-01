library(shiny)

shinyServer(function(input, output) {
  
  predictionModel<-lm(dist~speed, data = cars)
  
  modelPred <- reactive({
    speedinput<- input$sliderSpeed
    predict(predictionModel, newdata = data.frame(speed = speedinput))
  })
  
  output$plot1 <- renderPlot({
    speedInput <- input$sliderSpeed
    
    plot(cars$speed, cars$dist, xlab = "Miles Per Hour",
         ylab = "Stopping Distance (ft)", bty = "n", pch = 16,
         xlim = c(0,30), ylim = c(0,120))
    
    if(input$showpredictionModel){
      abline(predictionModel, col = "red", lwd = 2)
    }
    
    legend(25,250, "Model Prediction",pch = 16, col = "blue", bty = "n", cex = 1.2)
    points(speedInput, modelPred(),col = "blue", pch = 16, cex = 2)
  })
  
  output$pred_value <- renderText({modelPred()})
  
  
})
