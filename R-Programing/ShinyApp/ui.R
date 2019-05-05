#
# This is a shiny app (ui.R) for looking at the correlation between house value
# and the potential factors from Boston dataset.


library(shiny)
library(MASS) ### to call in Boston housing data

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Boston Housing Data correlations"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
       selectInput('xcol', 'X Variable', choices=colnames(Boston)),

       # Select whether to overlay smooth trend line
       checkboxInput(inputId = "smoother", label = strong("Overlay smooth trend line"),
                     value = FALSE),

       # Display only if the smoother is checked. get a side bar for controlling smoothness
       ## this line code was copied from:https://shiny.rstudio.com/, Google Trend Index example
       conditionalPanel(condition = "input.smoother == true",
                        sliderInput(inputId = "f", label = "Smoother span:",
                                    min = 0.01, max = 1, value = 0.67, step = 0.01,
                                    animate = animationOptions(interval = 100)),
                        HTML("Higher values give more smoothness."))

    ),

    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
