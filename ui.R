library(shiny)
shinyUI(pageWithSidebar(
  headerPanel('Developing Data Products - Course Project - Predicting MPG'),
  sidebarPanel(
    h3('Instructions'),
    p('Enter the horsepower and weight of your car below. This application will predict the MPG. Default
      values are set to the approximate mean of the data set.'),
    h3('Please enter data below.'),
    numericInput('hp', 'Horsepower:', 147, min = 50, max = 500, step = 5), #default set to mean of data set
    numericInput('wt', 'Weight (tons):', 3, min = 0.25, max = 10, step = 0.25) #default set to mean of data set
  ),
  mainPanel(
    h6('Project by J Karlovic'),
    h3('Predicted MPG'),
    h4('You entered:'),
    verbatimTextOutput("inputValues"),
    h4('Predicted MPG:'),
    verbatimTextOutput("prediction"),
    h4('Your Predicted MPG relative to cars in data set'),
    plotOutput('plots')
  )
))