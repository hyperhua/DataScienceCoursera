
library(shiny)
library(tidytext)
library(dplyr)
library(stringr)

bigrams_dt <- readRDS("bigrams_dt.rds")
trigrams_dt <- readRDS("trigrams_dt.rds") 
source("getnexttext.R")

shinyUI(navbarPage("Next word prediction",
                   tabPanel("Main app",
                            fluidPage(
                                fluidRow(
                                   column(4,
                                          h2("Please Type in at least Two Words"),
                                          p("Right column is the prediction"),
                                          textInput("input.text", label = "Your Typing:",
                                          value = "")
                                                    ),
                                   column(4,
                                          h2("Next Word may be"),
                                          p("Based on Three-gram model using 0.1% Corpus samples"),
                                          textOutput("output.text", h2)
                                             )
                                    
                                    ))
                   
                                  )
                            ))

