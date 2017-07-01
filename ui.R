library(shiny)

shinyUI(fluidPage(
  titlePanel("Predict Stopping Distance (ft) from car speed (mph"),
  sidebarLayout(
    sidebarPanel(
      h5("This app is built on top of the cars dataset in R by running linear regression
         to predict the stopping distance based on the speed. You can move the Slider to
         adjust the speed as input!"),
      sliderInput("sliderSpeed", "What is the current speed of the car?", 0,30, value = 20),
      checkboxInput("showpredictionModel", "Show/Hide predictionModel", value = TRUE)
    ),
    mainPanel(
      plotOutput("plot1"),
      h5("Predicted stopping distance from the prediction model:"),
      span(textOutput("pred_value"), style="color:red")
    )
  )
))
