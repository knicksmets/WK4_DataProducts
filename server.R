#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
  output$contents <- renderTable({
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    udf <- data.frame()
    udf <- read.csv(inFile$datapath, header = input$header)
  }) ### END OF renderTable
  output$udfd <- renderTable({
    inFile <- input$file1
    udf <- data.frame()
    udf <- read.csv(inFile$datapath, header = input$header)
    head(udf,20)
  })
  
  
  output$summ <- renderTable({
    inFile <- input$file1
    udf <- data.frame()
    udf <- read.csv(inFile$datapath, header = input$header)
    summary(udf)
  })
  
  
  output$plotss <- renderPlot({
    inFile <- input$file1
    udf <- data.frame()
    udf <- read.csv(inFile$datapath, header = input$header)
    scatter <- ggplot(udf, aes(ENROLL_CNT,GRAD_PCT))
    scatter + geom_smooth() + geom_point() + labs( x = "Number of Students Enrolled in Cohort", y = "Percentage of Students Graduated") 
    #  brushedPoints( udf, input$udf_brush, xvar = "ENROLL_CNT", yvar = "GRAD_PCT" )     
  })
  
  output$info <- renderPrint({
    inFile <- input$file1
    udf <- data.frame()
    udf <- read.csv(inFile$datapath, header = input$header)
    brushedPoints( udf, input$plot_brush, xvar = "ENROLL_CNT", yvar = "GRAD_PCT" )
  })
} ## END OF SERVER
)