#Shiny app to show off example datasets and the variables in them

library(shiny)

#load the datasets
load("example_datasets/movies/movies.RData")
load("example_datasets/crimes/crimes.RData")
load("example_datasets/sex/sex.RData")
load("example_datasets/politics/politics.RData")
load("example_datasets/titanic/titanic.RData")

description <- c("A dataset of movies produced between 2000 and 2013, compiled from iMDB and Rotten Tomatoes.",
                  "Violent and property crime rates (per 100,000) by state for 2010 (compiled by the FBI) with accompanying socio-demographic data.",
                  "General Social Survey data from 2004 on sexual frequency of US adults.",
                  "National Election Studies data from 2016 on the political attitudes and affiliations of the US voting age population.",
                  "Compiled data on the characteristics of Titanic passengers, including whether they survived or not.")

names(description) <- c("movies", "crimes","sex","politics","titanic")

server <- function(input, output) {
  
  # Return the requested dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "movies" = movies,
           "titanic" = titanic,
           "politics" = politics,
           "sex" = sex,
           "crimes" = crimes)
  })

  # Show 20 random observations
  output$view <- renderTable({
    datasetInput()[sample(1:nrow(datasetInput()),8,replace=FALSE),]
  }, include.rownames=FALSE)
  
  output$desc <- renderText(paste("<b>Description:</b>", description[input$dataset], "<br><br>8 randomly selected observations are shown."))
  
  #This is not working yet - I dont think it works with save
  #output$downloadData <- downloadHandler(
  #  filename = function() { 
  #    paste(input$dataset, '.RData', sep='') 
  #  },
  #  content = function(file) {
  #    save(datasetInput(), file)
  #  }
  #)
}

ui <- shinyUI(fluidPage(
  
  # Title
  titlePanel(h2("Explore Datasets")),
  
  
  fluidRow(
    
    column(4,wellPanel(selectInput("dataset", label = "Select Dataset", 
                         choices = list("Titanic"="titanic",
                                        "Crime"="crimes",
                                        "Sex"="sex",
                                        "Politics"="politics",
                                        "Movies"="movies"
                         ), 
                         selected = "titanic"))
    ),
    column(8, htmlOutput("desc")
    )
  ),
  tableOutput("view"))
)


shinyApp(ui = ui, server = server)