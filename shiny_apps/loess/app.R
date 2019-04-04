#scatterplot app that will allow users to remove certain data points
#from a scatterplot to see how the slope of the line changes

library(shiny)
library(ggplot2)

#load the crimes dataset
load("example_datasets/movies/movies.RData")

makeTable <- function(indep, dep) {
  r <- cor(dep, indep)
  coefs <- lm(dep~indep)$coef
  mytab <- cbind(c(r,r^2,coefs))
  rownames(mytab) <- c("r","r-squared","Intercept","Slope")
  colnames(mytab) <- c("Statistics")
  return(mytab)
}

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$scatterPlot <- renderPlot({
  
    #make the scatterplot
    ggplot(movies, aes(x=TomatoRating, y=BoxOffice))+
      geom_point(alpha=0.1)+
      geom_smooth(se=FALSE, method="loess", span=input$span, size=1.3)+
      scale_y_continuous(labels = scales::dollar)+
      labs(x="Rotten Tomatoes Rating", y="Box Office Returns (millions)")+
      theme_bw()
  })
}

#define UI
ui <- shinyUI(fluidPage(
  
  # Title
  titlePanel(h2("LOESS Smoother", align="center")),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("span","Span for smoothing:", min=0.1, max=1, value=0.75, step=0.05),
      helpText("Adjust the span width to see how it effects the LOESS smoothed line for the scatterplot.")
    ),
    mainPanel(plotOutput("scatterPlot"))
              )
              ))
shinyApp(ui = ui, server = server)