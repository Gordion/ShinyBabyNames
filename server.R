library(shiny)
library(dplyr)
library(ggplot2)

output$distPlot <- renderPlot({
  data <- read.csv(textConnection(getURL(
    "https://s3-eu-west-1.amazonaws.com/gbbuckettest/BabyNamesAll.csv"
  )), header=TRUE)
  data %>%
  distinct(Name,Year, Sex) %>%
  count(Year, Sex) %>%
  ggplot(aes(x = factor(Year), y = n, color = Sex)) +
  expand_limits(y=0) +
  geom_line(aes(group = Sex)) +
  geom_point() +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(x = "Year",y = "Unique names")  })
}
