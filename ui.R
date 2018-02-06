#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)
library(ggplot2)

shinyUI(fluidPage(
  titlePanel("Four Year Graduation Rates For Brooklyn NY H.S"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file1", "Choose CSV File",
                accept = c(
                  "text/csv",
                  "text/comma-separated-values,text/plain",
                  ".csv"), placeholder = "Load csv With Headers" ), # END OF FILEINPUT
      tags$hr(),
      checkboxInput("header", "Check to Acknowledge File Has Headers", FALSE)
    ),  ### END OF SIDE BAR PANEL
    ## Main Panel 
    #   mainPanel(
    # tableOutput("contents")
    mainPanel(
      tags$style(type = "text/css",
                 ".shiny-output-error { visibility: hidden; }",
                 ".shiny-output-error:before { visibility: hidden; }"
      ),
      verbatimTextOutput("info", placeholder = TRUE),
      tabsetPanel(type = "tab",
                  # tabPanel("Summary", tableOutput("summ")),
                  tabPanel("Plot", plotOutput("plotss", brush = "plot_brush", height = 250)),
                  tabPanel("Sample of 20",tableOutput("udfd"))
                  
      ) #### END OF TABSET
      
      
    ) ### END OF MAIN PANEL
  ) #### END OF LAYOUT
) # END OF FLUID FUNCTION
)