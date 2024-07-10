library(shiny)
library(plotly)
source("charts.R")

shinyServer(function(input, output) {
  output$plotly_american <- renderPlotly({
    plotly_american
  })
  
  
  output$plotly_ORcrime <- renderPlotly({
    plotly_ORcrime
  })
  
  output$plotly_ORpsilocybin <- renderPlotly({
    plotly_ORpsilocybin
  })

  
  output$plotly_COcrime <- renderPlotly({
    plotly_COcrime
  })
  
  output$plotly_COhallucinogens <- renderPlotly({
    plotly_COhallucinogens
  })
  
  output$plotly_CAhallucinogen <- renderPlotly({
    plotly_CAhallucinogen
  })
  
  output$plotly_MAhallucinogen <- renderPlotly({
    plotly_MAhallucinogen
  })
  
  output$plotly_COinterview <- renderPlotly({
    plotly_COinterview
  })
  
})
