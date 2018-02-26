library(shiny)
library(dplyr)
library(lubridate)
library(shinyAce)
library(ggplot2)  # for the diamonds dataset
library(googlesheets)
library(DT)
library(shinydashboard)
bowlsgs <- gs_title("Bowls")

# Define UI for slider demo app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Make Your Selections"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar to demonstrate various slider options ----
    sidebarPanel(
      helpText("Step1: Input your selections"),
      actionButton("uploader", "Upload Your Picks"),
      actionButton("downloader", "Update Pick Viewer"),
      # Text input of unique name
      textInput("first", label = "First Name", value = "dusty"),
      textInput("last", label = "Last Name", value = "turner"),
      textInput("submission", label = "Submission Number", value = "1"),
      
      # Input: Simple integer interval ----
      sliderInput("neworleansbowl", "Troy ------------- Southern Mississippi",
                  min = 0, max = 100,
                  value = 50),
      sliderInput("curebowl", "Western Kentucky -------- Georgia State",
                  min = 0, max = 100,
                  value = 50),
      sliderInput("lasvegas", "Boise State -------- Oregon",
                  min = 0, max = 100,
                  value = 50)
      
      , width = 2),
    
    # Main panel for displaying outputs ----
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("All Selections", dataTableOutput("fromgoogledatatable"))
                  # tabPanel("All Selections", tableOutput("fromgoogle"))
      )
    ), position = "left", fluid = FALSE
  )
)


server <- function(input, output) {
  
  # Reactive expression to create data frame of all input values ----
  sliderValues <- reactive({
    
    gamedf = data.frame(
      Game = c("New Orleans Bowl",
               "Cure Bowl",
               "Las Vegas Bowl"
      ),
      Away = c("Southern Mississippi",
               "Western Kentucky",
               "Boise State"),
      Home = c("Troy",
               "Georgia",
               "Oregon"),
      Certainty = c(input$neworleansbowl, input$curebowl, input$lasvegas),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(Selection = ifelse(Certainty>50,Home,ifelse(Certainty<50,Away,"No Selection"))) %>%
      mutate(PointsIfCorrect = ifelse(Certainty>50,((((100-Certainty)-100)^2/1000)-2.5)*(25/7.5),
                                      ((((Certainty)-100)^2/1000)-2.5)*(25/7.5))) %>%
      mutate(PointsIfWrong = ifelse(Certainty>50,((((Certainty)-100)^2/1000)-2.5)*(75/2.5),
                                    ((((Certainty))^2/1000)-2.5)*(75/2.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  
  sliderValues2 <- reactive({
    sliderValues() %>%
      select(Game, Away, Home, Selection, PointsIfCorrect, PointsIfWrong)
  })
  
  # Show the values in an HTML table ----
  output$values2 <- renderTable({
    sliderValues2()
  })
  
  output$values <- renderTable({
    sliderValues()
  })
  
  
  google <- eventReactive(input$downloader==FALSE | input$uploader==TRUE,{
    helper = gs_read(bowlsgs)
    helper =
      helper %>% select(Game, Away, Home, Selection, PointsIfCorrect, PointsIfWrong, Name, Time) %>%
      arrange(Time) %>%
      select(Game, Away, Home, Selection, PointsIfCorrect, PointsIfWrong, Name)
  })
  # google <- reactive({
  #   helper = gs_read(bowlsgs)
  #   helper =
  #   helper %>% select(Game, Away, Home, Selection, PointsIfCorrect, PointsIfWrong, Name, Time) %>%
  #     arrange(Time) %>%
  #     select(Game, Away, Home, Selection, PointsIfCorrect, PointsIfWrong, Name)
  # })
  
  # output$fromgoogle <- renderTable({
  #   google()
  # })
  # test <- reactive({
  #   test = paste0(input$first,".",input$last)
  # })
  
  
  output$fromgoogledatatable = DT::renderDataTable(
    google(), options = list(pageLength = 1000, search = list(regex = TRUE, caseInsensitive = FALSE, search = 'dusty.turner'))
  )
  
  observeEvent(input$uploader, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues())
  })
  
  
}

shinyApp(ui, server)