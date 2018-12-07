#manually adjust slope and intercept to calculate RSS

load("example_datasets/crimes/crimes.RData")

x <- crimes$Unemployment
y <- crimes$Property
bestRSS <- sum(lm(Property~Unemployment, data=crimes)$residuals^2)
rss <- NULL

server <- function(input, output, session) {
  
  values <- reactiveValues()

  #obsB <- observe({
  #  rss <- c(rss, values$rss)
  #  print(rss)
  #})
  
 # session$onFlush(once=FALSE, function(){
#    rss <<- c(rss, isolate({ values$rss }))
 #   print(rss)
#  })
  
  output$plot <- renderPlot({
    values$yfit <- input$intercept+input$slope*x
    values$rss <- sum((values$yfit-y)^2)
    rss <<- c(rss, values$rss)
    par(mfrow=c(1,2))
    plot(x, y, xlim=c(0, max(x)*1.1), ylim=c(1000, max(y)*1.05),
         xlab="Unemployment Rate", ylab="Property crimes (per 100,000",
         main="Scatterplot", pch=21, bg="grey", col="black")
    abline(input$intercept, input$slope, lwd=2)
    segments(x,values$yfit,x,y,col="red")
    plot(1:length(rss), rss, type="b", ylim=c(bestRSS*0.9, rss[1]*1.5),
         pch=21, bg="red", col="red",
         xlim=c(1, max(10, length(rss))),
         xlab="attempt", ylab="Residual sum of squares (RSS)",
         main="Residual sum of squares")
    abline(h=bestRSS, lty=2)
  })
  
}

ui <- shinyUI(fluidPage(
  
  # Title
  titlePanel(h2("Guess the Slope and Intercept")),
  
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("intercept",
                  "Intercept",
                  min = 1000,
                  max = 3500,
                  value = 2894),
      sliderInput("slope",
                  "Slope",
                  min = -50,
                  max = 200,
                  value = 0),
      helpText("Try to guess the best fitting line to this scatterplot by adjusting the slope",
               "and intercept.",
               "Notice how the residual sum of squares changes. The dotted line indicates the",
               "smallest possible value that you can get. How close can you get to this line?")
    ),
    mainPanel(plotOutput("plot"))
  )
))


shinyApp(ui = ui, server = server)