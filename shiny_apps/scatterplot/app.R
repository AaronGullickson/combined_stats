#scatterplot app that will allow users to remove certain data points
#from a scatterplot to see how the slope of the line changes

library(shiny)

#load the crimes dataset
load("example_datasets/crimes/crimes.RData")

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
  
  indep <- reactive({
    crimes[,input$indep]
  })
  
  dep <- reactive({
    crimes[,input$dep]
  })
  
  output$scatterPlot <- renderPlot({
    indep <- crimes[,input$indep]
    dep <- crimes[,input$dep]
    
    #make the scatterplot
    plot(indep(), dep(), pch=21, bg="red", col="black",
         xlab=input$indep, ylab="Crime Rate (per 100,000)", bty="l",
         ylim=c(0,max(dep())))
    text(indep(), dep(), labels=crimes$State, pos=1, cex=0.5)
    abline(lm(dep()~indep()))
  })
  
  output$table <- renderTable({
    makeTable(indep(),dep())
  })
}

ui <- shinyUI(fluidPage(
  
  # Application title
  titlePanel(h2("Exploring Scatterplots", align="center")),
  
  # Sidebar with a slider input for the number of bins
  fluidRow(
      column(4, wellPanel(
        selectInput("indep", label = "Select Independent Variable", 
                   choices = list("Median Age"="MedianAge",
                                   "Percent Male"="PctMale",
                                   "Percent Less than HS"="PctLessHS",
                                   "Median Income"="MedianIncomeHH",
                                   "Unemployment Rate"="Unemployment",
                                   "Poverty"="Poverty",
                                  "Gini"="Gini"), 
                    selected = "MedianAge"),
        selectInput("dep", label = "Select Dependent Variable", 
                    choices = list("Violent Crimes"="Violent", "Property Crimes"="Property"), 
                    selected = "Violent"),
        helpText("Try out different combinations of independent variables and",
                 "dependent variables to explore what state level characteristics",
                 "can predict crime. Which relationship is the strongest? Which is the",
                 "weakest. Does the direction of the relationship surprise you for any",
                 "of the variables? Are there outliers? Do any of the relationships look",
                 "non-linear?")
      )
    ),
    
    # Show a plot of the generated distribution
    column(5,
      plotOutput("scatterPlot")),
    column(1,
      tableOutput("table"))
    )
  )
)

shinyApp(ui = ui, server = server)