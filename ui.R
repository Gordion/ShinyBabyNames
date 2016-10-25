library(shiny)
# Define UI for application that draws a histogram
fluidPage(  
  # Application title  
  titlePanel("Unique Baby Names in Scotland"),  
  # Sidebar with a slider input for the number of bins      
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot")
  )
)
