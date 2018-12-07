#
# Shiny app to show students how the percentiles of a distribution
# work
#

library(shiny)

load("example_datasets/politics/politics.RData")
x <- na.omit(politics$age)
x <- x[x>17]

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
   
   # Application title
   titlePanel("Percentiles of a distribution"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("percentile",
                     "Percentile:",
                     min = 0,
                     max = 100,
                     value = 50, post="%"),
         helpText("You can adjust the percentile of the distribution and see graphically how",
                  "it changes location on the histogram and the boxplot. The area in red indicates",
                  "the P% of observations that are below that value. Move the slider to the",
                  "quartiles (0,25,50,75,100) of the distribution. What do the numbers",
                  "correspond to on the boxplot? Can you calculate the interquartile range?")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("plot")
      )
   )
))

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
   
  output$plot <- renderPlot({
    
    par(mfrow=c(1,2))
    #determine the bins by user-input width
    width <- 4
    bins <- seq(from=18, by=width, length.out = 1+(max(x)/width))
    
    breakpoint <- quantile(x, input$percentile/100)
    # draw the histogram with the specified bins
    h <- hist(x, breaks = bins, col="white", border="black",
         main="Histogram of age in political (NES) data",
         xlab="age, in years", xlim=c(0,100))
    #cuts <- cut(h$breaks, c(-Inf, breakpoint, Inf))
    #plot(h, col=cuts)
    
    #color in polygons below a certain level?
    for(i in 1:(length(h$breaks)-1)) {
      if(h$breaks[i+1]<=breakpoint) {
        rect(h$breaks[i],0,h$breaks[i+1],h$counts[i],col="red",border="black")
      } else {
        if(h$breaks[i]>breakpoint) {
          rect(h$breaks[i],0,h$breaks[i+1],h$counts[i],col="grey",border="black")
        } else {
          #we have a split rectangle
          rect(h$breaks[i],0,breakpoint,h$counts[i],col="red",border=NA)
          rect(breakpoint,0,h$breaks[i+1],h$counts[i],col="grey",border=NA)
          rect(h$breaks[i],0,h$breaks[i+1],h$counts[i],col=NA,border="black")
        }
      }
    }
    abline(v=breakpoint, col="red", lwd=3)
    p <- 4
    if(input$percentile>98) {
      p <- 2
    }
    text(breakpoint, max(h$count), labels=paste(input$percentile, "%=", breakpoint, " years", sep=""), 
         col="black", pos=p)
    
    b <- boxplot(x, col="grey", ylab="age, in years", main="boxplot of age in political (NES) data")
    abline(h=breakpoint, col="red", lwd=3)
    #plot rectangle
    if(breakpoint > b$stats[2,1]) {
      rect(0.8,b$stats[2,1],1.2, min(breakpoint,b$stats[4,1]) ,col="red", border=NA)
    }
    
    #draw lower tail in red
    segments(1,b$stats[1,1],1,min(breakpoint,b$stats[2,1]),lty=2, col="red", lwd=2)
    segments(0.9,b$stats[1,1],1.1,b$stats[1,1],lty=1, col="red", lwd=1)
    
    
    if(breakpoint > b$stats[4,1]) {
      segments(1,b$stats[4,1],1,min(breakpoint,b$stats[5,1]),lty=2, col="red", lwd=2)
    }
    #redraw median
    segments(0.8,b$stats[3,1],1.2,b$stats[3,1],lwd=3)
    
    text(0.6, breakpoint, labels=paste(input$percentile, "%=", breakpoint, " years", sep=""), 
         col="black", pos=3, cex=0.5)
    
    #arrows(1.22, b$stats[2,1], 1.22, b$stats[4,1], length=0.1, code=3, col="blue")
    #text(1.23, b$stats[4,1], labels="IQR", col="blue", pos=4)
    
  })
})

# Run the application 
shinyApp(ui = ui, server = server)

