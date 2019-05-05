
#
# This is a shiny app (server.R) for looking at the correlation between house value
# and the potential factors from Boston dataset.


library(shiny)
library(MASS)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    x <- Boston[,input$xcol]
    y <- Boston$medv ### see median value of the homes

    # scatter plot for correlations with medv
    par(mar=c(4,4,1,1))

    plot(x, y, pch = 19, col = 'black',
         xlab = input$xcol,
         ylab = "medv")
    text(quantile(x, probs = 0.8, na.rm=T), quantile(y, probs = 0.95, na.rm=T),
         paste("Corr = ", round(cor(x,y),2), sep=""), font = 4, col = "firebrick",
         cex=1.4, pos = 4)
    # Display only if smoother is checked ###
    ## the line code mimic from R studio example
    if(input$smoother){
            smooth_curve <- lowess(x = x, y = y, f = input$f)
            lines(smooth_curve, col = "#E6553A", lwd = 3)
    } ### end if smoother

  })

})
