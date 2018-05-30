library(shiny)
shinyUI(fluidPage(
  titlePanel("Sepal width compared to sepal length"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("Sepal.Length", "What is the Sepal Length of the species?", 0, 10, value=1),
      checkboxInput("showModel", "Show/Hide Model", value = TRUE),
      submitButton('Submit')
    ),
    mainPanel(
      plotOutput('plot'),
      h3('Predicted Sepal.Width from Model :'),
      textOutput('pred')
    )
  )
))
