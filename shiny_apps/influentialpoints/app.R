#scatterplot app that will allow users to remove certain data points
#from a scatterplot to see how the slope of the line changes

library(shiny)

#load the crimes dataset
load("example_datasets/crimes/crimes.RData")
violent.full <- crimes$Violent

makeTable <- function(keeprows, indep, dep) {
  r.full <- cor(dep, indep)
  coefs.full <- lm(dep~indep)$coef
  r.restrict <- cor(dep[keeprows], indep[keeprows])
  coefs.restrict <- lm(dep[keeprows]~indep[keeprows])$coef
  mytab <- round(rbind(c(r.full[1],r.restrict[1]),c(coefs.full[2],coefs.restrict[2])),2)
  rownames(mytab) <- c("r","slope")
  colnames(mytab) <- c("Full","Restricted")
  if(sum(!keeprows)==0) {
    mytab[1,2] <- NA
    mytab[2,2] <- NA
  }
  return(mytab)
}

server <- function(input, output) {
  
  vals <- reactiveValues(
    keeprows = rep(TRUE, nrow(crimes))
  )
  
  output$scatterPlot <- renderPlot({
    indep.full <- crimes[,input$indep]
    indep.restrict <- indep.full[vals$keeprows]
    violent.restrict <- violent.full[vals$keeprows]
    
    #make the scatterplot
    par(mar=c(5,4,1,1))
    plot(indep.full, violent.full, pch=21, bg="white", col="grey",
         xlab=input$indep, ylab="Violent Crime Rate (per 100,000)", bty="l",
         ylim=c(0,1500))
    points(indep.restrict, violent.restrict, pch=21, bg="red", col="black")
    text(indep.full, violent.full, labels=crimes$State, pos=1, cex=0.5)
    abline(lm(violent.full~indep.full))
    if(sum(!vals$keeprows)>0) {
      abline(lm(violent.restrict~indep.restrict), col="red")
    }
  })
  
  output$table <- renderTable({
    makeTable(vals$keeprows, crimes[,input$indep], crimes$Violent)
  })
  
  observeEvent(input$plot1_click, {
    res <- nearPoints(crimes, input$plot1_click, allRows = TRUE, maxpoints=1, xvar=input$indep,
                      yvar="Violent")
    
    vals$keeprows <- xor(vals$keeprows, res$selected_)
  })
  
  observeEvent(input$exclude_reset, {
    vals$keeprows <- rep(TRUE, nrow(crimes))
  })
  
  observeEvent(input$indep, {
    vals$keeprows <- rep(TRUE, nrow(crimes))
  })
}

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
  
  # Application title
  titlePanel(h2("Outliers and Influential Points", align="center")),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("indep", label = "Select Independent Variable", 
                  choices = list("Median Age"="MedianAge",
                                 "Percent Less than HS"="PctLessHS",
                                 "Gini"="Gini"), 
                  selected = "MedianAge"),
      actionButton("exclude_reset", "Reset points"),
      helpText("Click points on the scatterplot to remove them and note how the slope",
               "and correlation coefficient change. You can experiment with this for",
               "three different independent variables. Can you find any influential points?",
               "Are these points influential for all three independent variables?")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("scatterPlot",
                 click = "plot1_click"
      ),
      tableOutput("table")
    )
  )
))

shinyApp(ui = ui, server = server)