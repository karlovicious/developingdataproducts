library(shiny)
data(mtcars)

# fit straightforward multi-variate linear model with two predictors
mpgModel <- lm(mpg ~ hp + wt, data=mtcars)

# calculate mpg function using coefficients
mpg <- function(hp, wt) {
  mpgModel$coefficients[1] + mpgModel$coefficients[2] * hp + mpgModel$coefficients[3] * wt
}

shinyServer(
  function(input, output) {
    predicted.mpg <- reactive({mpg(input$hp, input$wt)})
    output$inputValues <- renderPrint({paste(input$hp, "horsepower, ",
                                             input$wt, "tons")})
    output$prediction <- renderPrint({paste(round(predicted.mpg(), 2), "miles per gallon")})
    output$plots <- renderPlot({
      par(mfrow = c(1, 2))
      # hp plot
      with(mtcars, plot(hp, mpg,
                        xlab='Horsepower',
                        ylab='MPG',
                        main='MPG vs Horsepower'))
      points(input$hp, predicted.mpg(), col='red', cex=3, pch = 17)                 
      # weight plot
      with(mtcars, plot(wt, mpg,
                        xlab='Weight (tons)',
                        ylab='MPG',
                        main='MPG vs Weight'))
      points(input$wt, predicted.mpg(), col='green', cex=3, pch = 17)  
    })
  }
)