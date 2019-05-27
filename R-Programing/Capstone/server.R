
library(shiny)
library(tidytext)
library(dplyr)
library(stringr)

bigrams_dt <- readRDS("bigrams_dt.rds")
trigrams_dt <- readRDS("trigrams_dt.rds") 
source("getnexttext.R")


shinyServer(function(input, output) {
   
      nextwords_reactive <- reactive({
                      get.next.text(input.text = input$input.text,
                                    trigrams_dt,bigrams_dt)
                      
              
      })
  
  output$output.text <- renderText({
          nextwords_reactive()
  })
  
})
