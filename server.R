#Get the data - this will be replaced with a proper database eventually
library(RCurl)
library(shiny)
library(ggplot2)
#data <- read.csv(textConnection(getURL(
#  "https://s3-eu-west-1.amazonaws.com/gbbuckettest/BabyNamesAll.csv"
#  )), header=TRUE)
  
# Define server logic required to draw a line graph

# Expression that generates a graph. The expression is  
# wrapped in a call to renderPlot to indicate that:  
#  
#  1) It is "reactive" and therefore should be automatically  
#     re-executed when inputs change  
#  2) Its output type is a plot

function(input, output) {  
  output$distPlot <- renderPlot({
    read.csv(textConnection(getURL(  
      "https://s3-eu-west-1.amazonaws.com/gbbuckettest/BabyNamesAll.csv"
      )), header=TRUE) %>%     
    distinct(Name,Year, Sex) %>%
    count(Year, Sex) %>%
    ggplot(aes(x = factor(Year), y = n, color = Sex)) +
    expand_limits(y=0) +
    geom_line(aes(group = Sex)) +
    geom_point() +
    theme_bw() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
    labs(x = "Year",y = "Unique names")
  })
}
