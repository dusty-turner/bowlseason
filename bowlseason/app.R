library(shiny)
library(dplyr)
library(lubridate)
library(shinyAce)
library(ggplot2)  
library(googlesheets)
library(DT)
library(shinydashboard)
bowlsgs <- gs_title("Bowls")
winner = data.frame(Game = c("Celebration Bowl", "New Orleans Bowl", "Cure Bowl", "Las Vegas Bowl","New Mexico Bowl","Camellia Bowl", "Cheribundi Tart Cherry Boca Raton Bowl", "DXL Frisco Bowl", "Bad Boy Mowers Gasparilla Bowl", "Bahamas Bowl", "Famous Idaho Potato Bowl", "Birmingham Bowl", "Lockheed Martin Armed Forces Bowl", "Dollar General Bowl", "Hawai'i Bowl", "Zaxby's Heart of Dallas Bowl", "Quick Lane Bowl", "Cactus Bowl", "Walk-On's Independence Bowl", "New Era Pinstripe Bowl", "Foster Farm's Bowl", "Academy Sports + Outdoors Texas Bowl", "Military Bowl", "Camping World Bowl", "Alamo Bowl", "Holiday Bowl", "Belk Bowl", "Sun Bowl", "Music City Bowl","Arizona Bowl", "Cotton Bowl","TaxSlayer Bowl", "Liberty Bowl", "Fiesta Bowl", "Orange Bowl", "Outback Bowl", "Peach Bowl", "Citris Bowl","Rose Bowl", "Sugar Bowl", "National Championship"),
                    Winner = c("North Carolina A&T", "Troy", "Georgia State", "Boise State", "Marshall", "Middle Tennessee", "Florida Atlantic","Louisiana Tech","Temple", "Ohio", "Wyoming", "Southern Florida", "Army", "Appalachain State", "Fresno State", "Utah", "Duke", "Kansas State", "Florida State", "Iowa", "Purdue", "Texas","Navy","Oklahoma State", "TCU", "Michigan State", "Wake Forrest", "NC State", "Northwestern", "Utah State", "Ohio State", "Mississippi State", "Iowa State", "Penn State", "Wisconsin", "South Carolina", "UCF", "Notre Dame","Georgia","Alabama","Alabama"),
                    Away = c("Grambling", "Troy", "Western Kentucky", "Boise State", "Marshall", "Middle Tennessee", "Akron", "Louisiana Tech", "Temple", "UAB", "Central Michigan", "Texas Tech", "San Diego State", "Appalachian State", "Fresno State", "Utah","Duke", "Kansas State","Southern Miss", "Iowa", "Arizona", "Texas", "Virginia", "Virginia Tech", "Stanford", "Washington State", "Wake Forest", "NC State", "Kentucky", "Utah State", "USC", "Louisville", "Iowa State", "Washington","Miami", "Michigan", "UCF", "Notre Dame", "Georgia", "Alabama", "Alabama"),
                    Home = c("North Carolina A&T", "North Texas", "Georgia State", "Oregon", "Colorado State", "Arkansas State", "Florida Atlantic", "SMU", "Florida International", "Ohio", "Wyoming", "South Florida", "Army","Toledo", "Houston","West Virginia", "Northern Illinios", "UCLA", "Florida State", "Boston College", "Purdue", "Missouri", "Navy", "Oklahoma State", "TCU", "Michigan State","Texas A&M", "Arizona State", "Northwestern", "New Mexico State", "Ohio State", "Mississippi State", "Memphis", "Penn State", "Wisconsin", "South Carolina", "Auburn", "LSU","Oklahoma","Clemson","Georgia")
                    )

# http://fontawesome.io/icons/
# Define UI for slider demo app ----
ui <- dashboardPage(skin = "yellow",
  
  # App title ----
  dashboardHeader(title = "D Math Pick'em"),
  
  # Sidebar layout with input and output definitions ----
    # Sidebar to demonstrate various slider options ----
    dashboardSidebar(
      sidebarMenu(
        menuItem("Instructions", tabName = "instructions", icon = icon("newspaper-o")),
        menuItem("Information", tabName = "information", icon = icon("dashboard"), startExpanded = TRUE, 
                 textInput("first", label = "First Name", value = "dusty"),
                 textInput("last", label = "Last Name", value = "turner")),
        menuItem("Selections", tabName = "selections", icon = icon("edit")),
        menuItem("Picks", tabName = "picks", icon = icon("database")),
        menuItem("Standings", tabName = "standings", icon = icon("sort-numeric-asc"))
      )
    ),
    
    dashboardBody(
      tabItems(
        tabItem(tabName = "selections",
                # actionButton("uploader", "Submit Picks"),
                tags$hr(),
                box(title = "Champianship: 8 January 2018", status = "success", solidHeader = TRUE, collapsible = TRUE, width = 4,
                    box(title = winner$Game[41], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 12,
                        uiOutput("addsliderbar41")
                    )
                    
                ),
                box(title = "Playoffs: 1 January 2018", status = "success", solidHeader = TRUE, collapsible = TRUE, width = 8,
                    box(title = winner$Game[39], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 6,
                        uiOutput("addsliderbar39")
                    ),
                    box(title = winner$Game[40], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 6,
                        uiOutput("addsliderbar40")
                    )
                ),
                box(title = "1 January 2018", status = "success", solidHeader = TRUE, collapsible = TRUE, width = 12,
                    box(title = winner$Game[36], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 4,
                        uiOutput("addsliderbar36")
                    ),
                    box(title = winner$Game[37], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 4,
                        uiOutput("addsliderbar37")
                    ),
                    box(title = winner$Game[38], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 4,
                        uiOutput("addsliderbar38")
                    )
                ),
                box(title = "16 December 2017", status = "success", solidHeader = TRUE, collapsible = TRUE, width = 12,
                    box(title = winner$Game[1], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 4,
                        uiOutput("addsliderbar1")
                    ),
                    box(title = winner$Game[2], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 4,
                        uiOutput("addsliderbar2")
                    ),
                    box(title = winner$Game[3], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 4,
                        uiOutput("addsliderbar3")
                    ),
                    box(title = winner$Game[4], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 4,
                        uiOutput("addsliderbar4")
                    ),
                    box(title = winner$Game[5], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 4,
                        uiOutput("addsliderbar5")
                    ),
                    box(title = winner$Game[6], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 4,
                        uiOutput("addsliderbar6")
                    )
                ),
                box(title = "19 December 2017", status = "success", solidHeader = TRUE, collapsible = TRUE, width = 4,
                    box(title = winner$Game[7], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 12,
                        uiOutput("addsliderbar7")
                    )
                ),
                box(title = "20 December 2017", status = "success", solidHeader = TRUE, collapsible = TRUE, width = 4,
                    box(title = winner$Game[8], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 12,
                        uiOutput("addsliderbar8")
                    )
                ),
                box(title = "21 December 2017", status = "success", solidHeader = TRUE, collapsible = TRUE, width = 4,
                    box(title = winner$Game[9], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 12,
                        uiOutput("addsliderbar9")
                    )
                ),
                box(title = "22 December 2017", status = "success", solidHeader = TRUE, collapsible = TRUE, width = 12,
                    box(title = winner$Game[10], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 6,
                        uiOutput("addsliderbar10")
                    ),
                    box(title = winner$Game[11], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 6,
                        uiOutput("addsliderbar11")
                    )
                ),
                box(title = "23 December 2017", status = "success", solidHeader = TRUE, collapsible = TRUE, width = 12,
                    box(title = winner$Game[12], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 4,
                        uiOutput("addsliderbar12")
                    ),
                    box(title = winner$Game[13], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 4,
                        uiOutput("addsliderbar13")
                    ),
                    box(title = winner$Game[14], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 4,
                        uiOutput("addsliderbar14")
                    )
                ),
                box(title = "24 December 2017", status = "success", solidHeader = TRUE, collapsible = TRUE, width = 4,
                    box(title = winner$Game[15], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 12,
                        uiOutput("addsliderbar15")
                    )
                ),
                box(title = "26 December 2017", status = "success", solidHeader = TRUE, collapsible = TRUE, width = 8,
                    box(title = winner$Game[16], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 4,
                        uiOutput("addsliderbar16")
                    ),
                    box(title = winner$Game[17], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 4,
                        uiOutput("addsliderbar17")
                    ),
                    box(title = winner$Game[18], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 4,
                        uiOutput("addsliderbar18")
                    )
                ),
                box(title = "27 December 2017", status = "success", solidHeader = TRUE, collapsible = TRUE, width = 12,
                    box(title = winner$Game[19], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 3,
                        uiOutput("addsliderbar19")
                    ),
                    box(title = winner$Game[20], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 3,
                        uiOutput("addsliderbar20")
                    ),
                    box(title = winner$Game[21], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 3,
                        uiOutput("addsliderbar21")
                    ),
                    box(title = winner$Game[22], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 3,
                        uiOutput("addsliderbar22")
                    )
                ),
                box(title = "28 December 2017", status = "success", solidHeader = TRUE, collapsible = TRUE, width = 12,
                    box(title = winner$Game[23], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 3,
                        uiOutput("addsliderbar23")
                    ),
                    box(title = winner$Game[24], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 3,
                        uiOutput("addsliderbar24")
                    ),
                    box(title = winner$Game[25], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 3,
                        uiOutput("addsliderbar25")
                    ),
                    box(title = winner$Game[26], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 3,
                        uiOutput("addsliderbar26")
                    )
                ),
                box(title = "29 December 2017", status = "success", solidHeader = TRUE, collapsible = TRUE, width = 12,
                    box(title = winner$Game[27], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 3,
                        uiOutput("addsliderbar27")
                    ),
                    box(title = winner$Game[28], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 3,
                        uiOutput("addsliderbar28")
                    ),
                    box(title = winner$Game[29], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 2,
                        uiOutput("addsliderbar29")
                    ),
                    box(title = winner$Game[30], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 2,
                        uiOutput("addsliderbar30")
                    ),
                    box(title = winner$Game[31], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 2,
                        uiOutput("addsliderbar31")
                    )
                ),
                box(title = "30 December 2017", status = "success", solidHeader = TRUE, collapsible = TRUE, width = 12,
                    box(title = winner$Game[32], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 3,
                        uiOutput("addsliderbar32")
                    ),
                    box(title = winner$Game[33], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 3,
                        uiOutput("addsliderbar33")
                    ),
                    box(title = winner$Game[34], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 3,
                        uiOutput("addsliderbar34")
                    ),
                    box(title = winner$Game[35], status = "danger", solidHeader = TRUE, collapsible = TRUE, width = 3,
                        uiOutput("addsliderbar35")
                    )
                )
        ),
        tabItem(tabName = "picks",
                tabPanel("All Selections", dataTableOutput("fromgoogledatatable"))),
        tabItem(tabName = "instructions", tabPanel("Instructions", htmlOutput("instructions"), plotOutput("translation"))),
        tabItem(tabName = "standings",  tabPanel("Standings", dataTableOutput("standings"), plotOutput("outlook")))
                  # tabPanel("All Selections", tableOutput("fromgoogle"))
      )
    )
  )



server <- function(input, output) {
  
  # Reactive expression to create data frame of all input values ----
  sliderValues1 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[1],
      Away = winner$Away[1],
      Home = winner$Home[1],
      Pick = c(input$game1pick),
      Confidence = c(input$game1confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      # confidencetransformedwrong = (-.005*confidencewrong+.5)
    # pointsdeducedwrong = .5*log(2*confidencetransformedwrong)
      # mutate(PointsIfCorrect = Confidence/4) %>%
      # mutate(PointsIfWrong = Confidence*-.5) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })

  sliderValues2 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[2],
      Away = winner$Away[2],
      Home = winner$Home[2],
      Pick = c(input$game2pick),
      Confidence = c(input$game2confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues3 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[3],
      Away = winner$Away[3],
      Home = winner$Home[3],
      Pick = c(input$game3pick),
      Confidence = c(input$game3confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues4 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[4],
      Away = winner$Away[4],
      Home = winner$Home[4],
      Pick = c(input$game4pick),
      Confidence = c(input$game4confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues5 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[5],
      Away = winner$Away[5],
      Home = winner$Home[5],
      Pick = c(input$game5pick),
      Confidence = c(input$game5confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues6 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[6],
      Away = winner$Away[6],
      Home = winner$Home[6],
      Pick = c(input$game6pick),
      Confidence = c(input$game6confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues7 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[7],
      Away = winner$Away[7],
      Home = winner$Home[7],
      Pick = c(input$game7pick),
      Confidence = c(input$game7confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues8 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[8],
      Away = winner$Away[8],
      Home = winner$Home[8],
      Pick = c(input$game8pick),
      Confidence = c(input$game8confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues9 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[9],
      Away = winner$Away[9],
      Home = winner$Home[9],
      Pick = c(input$game9pick),
      Confidence = c(input$game9confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues10 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[10],
      Away = winner$Away[10],
      Home = winner$Home[10],
      Pick = c(input$game10pick),
      Confidence = c(input$game10confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues11 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[11],
      Away = winner$Away[11],
      Home = winner$Home[11],
      Pick = c(input$game11pick),
      Confidence = c(input$game11confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues12 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[12],
      Away = winner$Away[12],
      Home = winner$Home[12],
      Pick = c(input$game12pick),
      Confidence = c(input$game12confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues13 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[13],
      Away = winner$Away[13],
      Home = winner$Home[13],
      Pick = c(input$game13pick),
      Confidence = c(input$game13confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues14 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[14],
      Away = winner$Away[14],
      Home = winner$Home[14],
      Pick = c(input$game14pick),
      Confidence = c(input$game14confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues15 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[15],
      Away = winner$Away[15],
      Home = winner$Home[15],
      Pick = c(input$game15pick),
      Confidence = c(input$game15confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues16 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[16],
      Away = winner$Away[16],
      Home = winner$Home[16],
      Pick = c(input$game16pick),
      Confidence = c(input$game16confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues17 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[17],
      Away = winner$Away[17],
      Home = winner$Home[17],
      Pick = c(input$game17pick),
      Confidence = c(input$game17confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues18 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[18],
      Away = winner$Away[18],
      Home = winner$Home[18],
      Pick = c(input$game18pick),
      Confidence = c(input$game18confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues19 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[19],
      Away = winner$Away[19],
      Home = winner$Home[19],
      Pick = c(input$game19pick),
      Confidence = c(input$game19confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues20 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[20],
      Away = winner$Away[20],
      Home = winner$Home[20],
      Pick = c(input$game20pick),
      Confidence = c(input$game20confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues21 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[21],
      Away = winner$Away[21],
      Home = winner$Home[21],
      Pick = c(input$game21pick),
      Confidence = c(input$game21confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues22 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[22],
      Away = winner$Away[22],
      Home = winner$Home[22],
      Pick = c(input$game22pick),
      Confidence = c(input$game22confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues23 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[23],
      Away = winner$Away[23],
      Home = winner$Home[23],
      Pick = c(input$game23pick),
      Confidence = c(input$game23confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues24 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[24],
      Away = winner$Away[24],
      Home = winner$Home[24],
      Pick = c(input$game24pick),
      Confidence = c(input$game24confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues25 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[25],
      Away = winner$Away[25],
      Home = winner$Home[25],
      Pick = c(input$game25pick),
      Confidence = c(input$game25confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues26 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[26],
      Away = winner$Away[26],
      Home = winner$Home[26],
      Pick = c(input$game26pick),
      Confidence = c(input$game26confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues27 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[27],
      Away = winner$Away[27],
      Home = winner$Home[27],
      Pick = c(input$game27pick),
      Confidence = c(input$game27confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues28 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[28],
      Away = winner$Away[28],
      Home = winner$Home[28],
      Pick = c(input$game28pick),
      Confidence = c(input$game28confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues29 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[29],
      Away = winner$Away[29],
      Home = winner$Home[29],
      Pick = c(input$game29pick),
      Confidence = c(input$game29confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues30 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[30],
      Away = winner$Away[30],
      Home = winner$Home[30],
      Pick = c(input$game30pick),
      Confidence = c(input$game30confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues31 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[31],
      Away = winner$Away[31],
      Home = winner$Home[31],
      Pick = c(input$game31pick),
      Confidence = c(input$game31confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues32 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[32],
      Away = winner$Away[32],
      Home = winner$Home[32],
      Pick = c(input$game32pick),
      Confidence = c(input$game32confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues33 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[33],
      Away = winner$Away[33],
      Home = winner$Home[33],
      Pick = c(input$game33pick),
      Confidence = c(input$game33confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues34 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[34],
      Away = winner$Away[34],
      Home = winner$Home[34],
      Pick = c(input$game34pick),
      Confidence = c(input$game34confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues35 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[35],
      Away = winner$Away[35],
      Home = winner$Home[35],
      Pick = c(input$game35pick),
      Confidence = c(input$game35confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues36 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[36],
      Away = winner$Away[36],
      Home = winner$Home[36],
      Pick = c(input$game36pick),
      Confidence = c(input$game36confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues37 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[37],
      Away = winner$Away[37],
      Home = winner$Home[37],
      Pick = c(input$game37pick),
      Confidence = c(input$game37confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues38 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[38],
      Away = winner$Away[38],
      Home = winner$Home[38],
      Pick = c(input$game38pick),
      Confidence = c(input$game38confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues39 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[39],
      Away = winner$Away[39],
      Home = winner$Home[39],
      Pick = c(input$game39pick),
      Confidence = c(input$game39confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues40 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[40],
      Away = winner$Away[40],
      Home = winner$Home[40],
      Pick = c(input$game40pick),
      Confidence = c(input$game40confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })
  sliderValues41 <- reactive({
    gamedf = data.frame(
      Game = winner$Game[41],
      Away = winner$Away[41],
      Home = winner$Home[41],
      Pick = c(input$game41pick),
      Confidence = c(input$game41confidence),
      stringsAsFactors = FALSE)
    gamedf %>%
      mutate(PointsIfCorrect = 2*log(2*(.005*Confidence+.5))) %>%
      mutate(PointsIfWrong = .5*log(2*(-.005*Confidence+.5))) %>%
      mutate(Time = Sys.time()) %>%
      mutate(Time = as_datetime(Time)) %>%
      mutate(Name = paste0(input$first, ".",input$last))
  })

  
if(Sys.time()>as.POSIXct("2017-12-16 13:30:00 EST")){
  observeEvent(input$uploader1, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues1())
  })}
  observeEvent(input$uploader2, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues2())
  })
  observeEvent(input$uploader3, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues3())
  })
  observeEvent(input$uploader4, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues4())
  })
  observeEvent(input$uploader5, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues5())
  })
  observeEvent(input$uploader6, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues6())
  })
  observeEvent(input$uploader7, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues7())
  })
  observeEvent(input$uploader8, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues8())
  })
  observeEvent(input$uploader9, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues9())
  })
  observeEvent(input$uploader10, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues10())
  })
  observeEvent(input$uploader11, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues11())
  })
  observeEvent(input$uploader12, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues12())
  })
  observeEvent(input$uploader13, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues13())
  })
  observeEvent(input$uploader14, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues14())
  })
  observeEvent(input$uploader15, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues15())
  })
  observeEvent(input$uploader16, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues16())
  })
  observeEvent(input$uploader17, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues17())
  })
  observeEvent(input$uploader18, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues18())
  })
  observeEvent(input$uploader19, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues19())
  })
  observeEvent(input$uploader20, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues20())
  })
  observeEvent(input$uploader21, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues21())
  })
  observeEvent(input$uploader22, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues22())
  })
  observeEvent(input$uploader23, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues23())
  })
  observeEvent(input$uploader24, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues24())
  })
  observeEvent(input$uploader25, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues25())
  })
  observeEvent(input$uploader26, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues26())
  })
  observeEvent(input$uploader27, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues27())
  })
  observeEvent(input$uploader28, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues28())
  })
  observeEvent(input$uploader29, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues29())
  })
  observeEvent(input$uploader30, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues30())
  })
  observeEvent(input$uploader31, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues31())
  })
  observeEvent(input$uploader32, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues32())
  })
  observeEvent(input$uploader33, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues33())
  })
  observeEvent(input$uploader34, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues34())
  })
  observeEvent(input$uploader35, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues35())
  })
  observeEvent(input$uploader36, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues36())
  })
  observeEvent(input$uploader37, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues37())
  })
  observeEvent(input$uploader38, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues38())
  })
  observeEvent(input$uploader39, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues39())
  })
  observeEvent(input$uploader40, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues40())
  })
  observeEvent(input$uploader41, {
    bowlsgs = bowlsgs %>%
      gs_add_row(input = sliderValues41())
  })
  
  google <- eventReactive(input$uploader1==FALSE | input$uploader2==TRUE | input$uploader3==TRUE | input$uploader4==TRUE | input$uploader5==TRUE | input$uploader6==TRUE | input$uploader7==FALSE | input$uploader8==TRUE | input$uploader9==TRUE | input$uploader10==TRUE | input$uploader11==TRUE | input$uploader12==TRUE | input$uploader13==TRUE | input$uploader14==TRUE | input$uploader15==TRUE | input$uploader16==TRUE | input$uploader17==TRUE | input$uploader18| input$uploader19 | input$uploader20 | input$uploader21 | input$uploader22 | input$uploader23 | input$uploader24 | input$uploader25 | input$uploader26 | input$uploader27 | input$uploader28 | input$uploader29 | input$uploader30 | input$uploader31 | input$uploader32 | input$uploader33 | input$uploader34 | input$uploader35 | input$uploader36 | input$uploader37 | input$uploader38 | input$uploader39 | input$uploader40 | input$uploader41==TRUE,{
    helper = gs_read(bowlsgs)
    helper =
      helper %>% select(Game, Away, Home, Pick, PointsIfCorrect, PointsIfWrong, Name, Time, Confidence) %>%
      mutate(Time = as_datetime(Time)) %>%
      filter(Pick != 3) %>%
      group_by(Name, Game) %>%
      filter(Time == max(Time)) %>% 
      arrange(desc(Time)) %>%
      left_join(winner) %>%
      select(Game, Away, Home, Pick, Winner, PointsIfCorrect, PointsIfWrong, Name, Time, Confidence) %>% 
      mutate(PointsAwarded = ifelse(Winner!=" ",ifelse(Winner==Pick, PointsIfCorrect, ifelse(Winner!=Pick, PointsIfWrong, 0)),0)) %>%
      ungroup()

  })  
  
  standingdf <- reactive({
    google() %>%
      # group_by(Name) %>%
      group_by(Name, Game) %>%
      filter(Time == max(Time)) %>%
      ungroup() %>%
      group_by(Name) %>%
      summarise(TotalPoints = round(sum(PointsAwarded), digits = 4)) %>%
      arrange(desc(TotalPoints))
  })  

  sliderhelp1 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[1])
      })
  sliderhelp2 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[2])
      })
  sliderhelp3 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[3])
      })
  sliderhelp4 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[4])
      })
  sliderhelp5 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[5])
      })
  sliderhelp6 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[6])
  })
  sliderhelp7 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[7])
  })
  sliderhelp8 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[8])
      })
  sliderhelp9 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[9])
      })
  sliderhelp10 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[10])
      })
  sliderhelp11 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[11])
      })
  sliderhelp12 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[12])
      })
  sliderhelp13 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[13])
      })
  sliderhelp14 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[14])
      })
  sliderhelp15 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[15])
      })
  sliderhelp16 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[16])
      })
  sliderhelp17 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[17])
      })
  sliderhelp18 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[18])
      })
  sliderhelp19 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[19])
      })
  sliderhelp20 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[20])
      })
  sliderhelp21 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[21])
      })
  sliderhelp22 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[22])
      })
  sliderhelp23 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[23])
      })
  sliderhelp24 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[24])
      })
  sliderhelp25 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[25])
      })
  sliderhelp26 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[26])
      })
  sliderhelp27 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[27])
      })
  sliderhelp28 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[28])
      })
  sliderhelp29 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[29])
      })
  sliderhelp30 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[30])
      })
  sliderhelp31 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[31])
      })
  sliderhelp32 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[32])
      })
  sliderhelp33 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[33])
      })
  sliderhelp34 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[34])
      })
  sliderhelp35 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[35])
      })
  sliderhelp36 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[36])
      })
  sliderhelp37 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[37])
      })
  sliderhelp38 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[38])
      })
  sliderhelp39 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[39])
      })
  sliderhelp40 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[40])
      })
  sliderhelp41 <- reactive({
    google() %>%
      filter(Name == paste0(input$first,".",input$last)) %>%
      filter(Game == winner$Game[41])
      })

    
############ Outputs  
  
  output$addsliderbar1 <- renderUI({
    tagList(
      radioButtons("game1pick", label = "Selection",
                   choices = list("Grambling" = winner$Away[1], "North Carolina A&T" = winner$Home[1]), selected = sliderhelp1()[,4]),
      sliderInput("game1confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp1()[,10])),
                if(Sys.time()<as.POSIXct("2017-12-16 13:30:00 EST")){
                actionButton("uploader1", "Submit Pick")}
                else{
                  helpText("Pick Locked")
                }
      # helpText(paste0("Points if Correct: ", as.numeric(sliderhelp1()[,1])))
      # helpText(paste0("Points if Correct: ", input$game1confidence))
    )})
  output$addsliderbar2 <- renderUI({
    tagList(
      radioButtons("game2pick", label = "Selection",
                   choices = list("Troy" = winner$Away[2], "North Texas" = winner$Home[2]), selected = sliderhelp2()[,4]),
      sliderInput("game2confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp2()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-16 14:30:00 EST")){
        actionButton("uploader2", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar3 <- renderUI({
    tagList(
      radioButtons("game3pick", label = "Selection",
                   choices = list("Western Kentucky" = winner$Away[3], "Georgia State" = winner$Home[3]), selected = sliderhelp3()[,4]),
      sliderInput("game3confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp3()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-16 15:30:00 EST")){
        actionButton("uploader3", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar4 <- renderUI({
    tagList(
      radioButtons("game4pick", label = "Selection",
                   choices = list("Boise State" = winner$Away[4], "Oregon" = winner$Home[4]), selected = sliderhelp4()[,4]),
      sliderInput("game4confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp4()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-16 15:30:00 EST")){
        actionButton("uploader4", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar5 <- renderUI({
    tagList(
      radioButtons("game5pick", label = "Selection",
                   choices = list("Colorado State" = winner$Away[5], "Marshall" = winner$Home[5]), selected = sliderhelp5()[,4]),
      sliderInput("game5confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp5()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-16 15:30:00 EST")){
        actionButton("uploader5", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar6 <- renderUI({
    tagList(
      radioButtons("game6pick", label = "Selection",
                   choices = list("Middle Tennessee" = winner$Away[6], "Arkansas State" = winner$Home[6]), selected = sliderhelp6()[,4]),
      sliderInput("game6confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp6()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-16 20:01:00 EST")){
        actionButton("uploader6", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar7 <- renderUI({
    tagList(
      radioButtons("game7pick", label = "Selection",
                   choices = list("Akron" = winner$Away[7], "Florida Atlantic" = winner$Home[7]), selected = sliderhelp7()[,4]),
      sliderInput("game7confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp7()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-19 19:01:00 EST")){
        actionButton("uploader7", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar8 <- renderUI({
    tagList(
      radioButtons("game8pick", label = "Selection",
                   choices = list("Louisiana Tech" = winner$Away[8], "SMU" = winner$Home[8]), selected = sliderhelp8()[,4]),
      sliderInput("game8confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp8()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-20 20:01:00 EST")){
        actionButton("uploader8", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar9 <- renderUI({
    tagList(
      radioButtons("game9pick", label = "Selection",
                   choices = list("Temple" = winner$Away[9], "Florida International" = winner$Home[9]), selected = sliderhelp9()[,4]),
      sliderInput("game9confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp9()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-21 20:01:00 EST")){
        actionButton("uploader9", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar10 <- renderUI({
    tagList(
      radioButtons("game10pick", label = "Selection",
                   choices = list("UAB" = winner$Away[10], "Ohio" = winner$Home[10]), selected = sliderhelp10()[,4]),
      sliderInput("game10confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp10()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-22 12:31:00 EST")){
        actionButton("uploader10", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar11 <- renderUI({
    tagList(
      radioButtons("game11pick", label = "Selection",
                   choices = list("Central Michigan" = winner$Away[11], "Wyoming" = winner$Home[11]), selected = sliderhelp11()[,4]),
      sliderInput("game11confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp11()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-22 16:01:00 EST")){
        actionButton("uploader11", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar12 <- renderUI({
    tagList(
      radioButtons("game12pick", label = "Selection",
                   choices = list("Texas Tech" = winner$Away[12], "South Florida" = winner$Home[12]), selected = sliderhelp12()[,4]),
      sliderInput("game12confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp12()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-23 12:01:00 EST")){
        actionButton("uploader12", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar13 <- renderUI({
    tagList(
      radioButtons("game13pick", label = "Selection",
                   choices = list("San Diego State" = winner$Away[13], "Army" = winner$Home[13]), selected = sliderhelp13()[,4]),
      sliderInput("game13confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp13()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-23 15:31:00 EST")){
        actionButton("uploader13", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar14 <- renderUI({
    tagList(
      radioButtons("game14pick", label = "Selection",
                   choices = list("Appalachain State" = winner$Away[14], "Toledo" = winner$Home[14]), selected = sliderhelp14()[,4]),
      sliderInput("game14confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp14()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-23 19:01:00 EST")){
        actionButton("uploader14", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar15 <- renderUI({
    tagList(
      radioButtons("game15pick", label = "Selection",
                   choices = list("Fresno State" = winner$Away[15], "Houston" = winner$Home[15]), selected = sliderhelp15()[,4]),
      sliderInput("game15confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp15()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-24 20:31:00 EST")){
        actionButton("uploader15", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar16 <- renderUI({
    tagList(
      radioButtons("game16pick", label = "Selection",
                   choices = list("Utah" = winner$Away[16], "West Virginia" = winner$Home[16]), selected = sliderhelp16()[,4]),
      sliderInput("game16confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp16()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-26 13:31:00 EST")){
        actionButton("uploader16", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar17 <- renderUI({
    tagList(
      radioButtons("game17pick", label = "Selection",
                   choices = list("Duke" = winner$Away[17], "Northern Illinios" = winner$Home[17]), selected = sliderhelp17()[,4]),
      sliderInput("game17confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp17()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-26 17:16:00 EST")){
        actionButton("uploader17", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar18 <- renderUI({
    tagList(
      radioButtons("game18pick", label = "Selection",
                   choices = list("Kansas State" = winner$Away[18], "UCLA" = winner$Home[18]), selected = sliderhelp18()[,4]),
      sliderInput("game18confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp18()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-26 21:01:00 EST")){
        actionButton("uploader18", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar19 <- renderUI({
    tagList(
      radioButtons("game19pick", label = "Selection",
                   choices = list("Southern Miss" = winner$Away[19], "Florida State" = winner$Home[19]), selected = sliderhelp19()[,4]),
      sliderInput("game19confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp19()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-27 13:31:00 EST")){
        actionButton("uploader19", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar20 <- renderUI({
    tagList(
      radioButtons("game20pick", label = "Selection",
                   choices = list("Iowa" = winner$Away[20], "Boston College" = winner$Home[20]), selected = sliderhelp20()[,4]),
      sliderInput("game20confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp20()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-27 17:16:00 UTC")){
        actionButton("uploader20", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar21 <- renderUI({
    tagList(
      radioButtons("game21pick", label = "Selection",
                   choices = list("Arizona" = winner$Away[21], "Purdue" = winner$Home[21]), selected = sliderhelp21()[,4]),
      sliderInput("game21confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp21()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-27 20:31:00 EST")){
        actionButton("uploader21", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar22 <- renderUI({
    tagList(
      radioButtons("game22pick", label = "Selection",
                   choices = list("Texas" = winner$Away[22], "Missouri" = winner$Home[22]), selected = sliderhelp22()[,4]),
      sliderInput("game22confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp22()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-27 21:01:00 EST")){
        actionButton("uploader22", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar23 <- renderUI({
    tagList(
      radioButtons("game23pick", label = "Selection",
                   choices = list("Virginia" = winner$Away[23], "Navy" = winner$Home[23]), selected = sliderhelp23()[,4]),
      sliderInput("game23confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp23()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-28 13:31:00 EST")){
        actionButton("uploader23", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar24 <- renderUI({
    tagList(
      radioButtons("game24pick", label = "Selection",
                   choices = list("Virginia Tech" = winner$Away[24], "Oklahoma State" = winner$Home[24]), selected = sliderhelp24()[,4]),
      sliderInput("game24confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp24()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-28 17:16:00 EST")){
        actionButton("uploader24", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar25 <- renderUI({
    tagList(
      radioButtons("game25pick", label = "Selection",
                   choices = list("Stanford" = winner$Away[25], "TCU" = winner$Home[25]), selected = sliderhelp25()[,4]),
      sliderInput("game25confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp25()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-28 21:01:00 EST")){
        actionButton("uploader25", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar26 <- renderUI({
    tagList(
      radioButtons("game26pick", label = "Selection",
                   choices = list("Washington State" = winner$Away[26], "Michigan State" = winner$Home[26]), selected = sliderhelp26()[,4]),
      sliderInput("game26confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp26()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-28 21:01:00 EST")){
        actionButton("uploader26", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar27 <- renderUI({
    tagList(
      radioButtons("game27pick", label = "Selection",
                   choices = list("Wake Forest" = winner$Away[27], "Texas A&M" = winner$Home[27]), selected = sliderhelp27()[,4]),
      sliderInput("game27confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp27()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-29 13:01:00 EST")){
        actionButton("uploader27", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar28 <- renderUI({
    tagList(
      radioButtons("game28pick", label = "Selection",
                   choices = list("NC State" = winner$Away[28], "Arizona State" = winner$Home[28]), selected = sliderhelp28()[,4]),
      sliderInput("game28confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp28()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-29 15:01:00 EST")){
        actionButton("uploader28", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar29 <- renderUI({
    tagList(
      radioButtons("game29pick", label = "Selection",
                   choices = list("Kentucky" = winner$Away[29], "Northwestern" = winner$Home[29]), selected = sliderhelp29()[,4]),
      sliderInput("game29confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp29()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-29 16:31:00 EST")){
        actionButton("uploader29", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar30 <- renderUI({
    tagList(
      radioButtons("game30pick", label = "Selection",
                   choices = list("Utah State" = winner$Away[30], "New Mexico State" = winner$Home[30]), selected = sliderhelp30()[,4]),
      sliderInput("game30confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp30()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-29 17:31:00 EST")){
        actionButton("uploader30", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar31 <- renderUI({
    tagList(
      radioButtons("game31pick", label = "Selection",
                   choices = list("USC" = winner$Away[31], "Ohio State" = winner$Home[31]), selected = sliderhelp31()[,4]),
      sliderInput("game31confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp31()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-29 20:31:00 EST")){
        actionButton("uploader31", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar32 <- renderUI({
    tagList(
      radioButtons("game32pick", label = "Selection",
                   choices = list("Louisville" = winner$Away[32], "Mississippi State" = winner$Home[32]), selected = sliderhelp32()[,4]),
      sliderInput("game32confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp32()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-30 12:01:00 EST")){
        actionButton("uploader32", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar33 <- renderUI({
    tagList(
      radioButtons("game33pick", label = "Selection",
                   choices = list("Iowa State" = winner$Away[33], "Memphis" = winner$Home[33]), selected = sliderhelp33()[,4]),
      sliderInput("game33confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp33()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-30 12:31:00 EST")){
        actionButton("uploader33", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar34 <- renderUI({
    tagList(
      radioButtons("game34pick", label = "Selection",
                   choices = list("Washington" = winner$Away[34], "Penn State" = winner$Home[34]), selected = sliderhelp34()[,4]),
      sliderInput("game34confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp34()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-30 16:01:00 EST")){
        actionButton("uploader34", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar35 <- renderUI({
    tagList(
      radioButtons("game35pick", label = "Selection",
                   choices = list("Miami" = winner$Away[35], "Wisconsin" = winner$Home[35]), selected = sliderhelp35()[,4]),
      sliderInput("game35confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp35()[,10])),
      if(Sys.time()<as.POSIXct("2017-12-30 20:01:00 EST")){
        actionButton("uploader35", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar36 <- renderUI({
    tagList(
      radioButtons("game36pick", label = "Selection",
                   choices = list("Michigan" = winner$Away[36], "South Carolina" = winner$Home[36]), selected = sliderhelp36()[,4]),
      sliderInput("game36confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp36()[,10])),
      if(Sys.time()<as.POSIXct("2018-1-1 12:01:00 EST")){
        actionButton("uploader36", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar37 <- renderUI({
    tagList(
      radioButtons("game37pick", label = "Selection",
                   choices = list("UCF" = winner$Away[37], "Auburn" = winner$Home[37]), selected = sliderhelp37()[,4]),
      sliderInput("game37confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp37()[,10])),
      if(Sys.time()<as.POSIXct("2018-1-1 12:31:00 EST")){
        actionButton("uploader37", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar38 <- renderUI({
    tagList(
      radioButtons("game38pick", label = "Selection",
                   choices = list("Notre Dame" = winner$Away[38], "LSU" = winner$Home[38]), selected = sliderhelp38()[,4]),
      sliderInput("game38confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp38()[,10])),
      if(Sys.time()<as.POSIXct("2018-1-1 13:01:00 EST")){
        actionButton("uploader38", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar39 <- renderUI({
    tagList(
      radioButtons("game39pick", label = "Selection",
                   choices = list("Georgia" = winner$Away[39], "Oklahoma" = winner$Home[39]), selected = sliderhelp39()[,4]),
      sliderInput("game39confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp39()[,10])),
      if(Sys.time()<as.POSIXct("2018-1-1 17:01:00 EST")){
        actionButton("uploader39", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar40 <- renderUI({
    tagList(
      radioButtons("game40pick", label = "Selection",
                   choices = list("Alabama" = winner$Away[40], "Clemson" = winner$Home[40]), selected = sliderhelp40()[,4]),
      sliderInput("game40confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp40()[,10])),
      if(Sys.time()<as.POSIXct("2018-1-1 20:46:00 EST")){
        actionButton("uploader40", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})
  output$addsliderbar41 <- renderUI({
    tagList(
      radioButtons("game41pick", label = "Selection",
                   choices = list("Alabama" = winner$Away[41], "Georgia" = winner$Home[41]), selected = sliderhelp41()[,4]),
      sliderInput("game41confidence",
                label = "Confidence",
                min = 0, max = 99,
                value = as.numeric(sliderhelp41()[,10])),
      if(Sys.time()<as.POSIXct("2018-1-8 20:01:00 EST")){
      actionButton("uploader41", "Submit Pick")}
      else{
        helpText("Pick Locked")
      }
    )})



  
  output$fromgoogledatatable = DT::renderDataTable(
    google(), options = list(pageLength = 1000, search = list(regex = TRUE, caseInsensitive = FALSE))
  )

  output$standings = DT::renderDataTable(
    standingdf(), options = list(pageLength = 1000, search = list(regex = TRUE, caseInsensitive = FALSE))
  )

  output$instructions <- renderUI({ 
    str1 = h3("Step1")
    str1.1 = "Type in your first and last name and submission number.<br/>"
    str1.2 = "- The program will only score your last submission.<br/>"
    str1.3 = "- The Program will remember your last submission if you leave and return later.<br/>"
    str1.4 = "- Yes, it is possible to change other people's submissions, I ask that until I figure out how to prevent this, that you only change Jim's picks...<br/>"
    str2 = h3("Step2")
    str2.1 = "Make your selections for each bowl game.  The slider bar represents your confidence in your selection"
    str2.2 = "<br/>Be sure to click submit after every selection"
    str2.3 = "For example:<br/>"
    str2.4 = "- A selection of 100 means you have 100% confidence in the team you selected to win.<br/>"
    str2.5 = "- A selection of 0 means no selection even if you have already clicked a radio button.  You will not gain or lose any points.  <br/>"
    str3 = h3("Step3")
    str3.1 = "If you wish to make no selection (after previously making a selection) set your confidence to 0.<br/>"
    str3.2 = "Click on the 'Picks' menu to see everyone's selections"
    str4 = h3("***Scoring CHANGE ***")
    str4.1 = "- Credit to COL Horton for a creative scoring mechanism I have implemented.  My desire from the start was to reward 'confidence' and harshly penalize 'overconfidence'. <br/>"
    str4.2 = "- Instead of the linear reward (or penalty) of points from 0 to 100% confidence, you will be rewarded (or penalized) at an increasing rate based on your confidence level. <br/>"
    str4.25 = "- I have essentially translated your score into a probability of victory where a 2 point confidence level is a 51% probability of vicotry.  A 50 point confidence level is a 75% confidence level and so on... <br/>"
    str4.3 = "- Because the new scoring formula takes the natural log of your confidence - and being wrong on a 100 point confidence translates into the natural log of 0 (-infinity) - I am caping confidence at 99.  Try coming back from -Infinity... good luck.  <br/>"
    str4.4 = "<br/>The confidence to points translation looks like this: <br/>"
    # str4.5 = - "If correct:  2*log(2*(.005*confidencecorrect+.5))"
    # str4.6 = - "If incorrect:  .5*log(2*(-.005*confidencewrong+.5))"

    HTML(paste(str1, str1.1, str1.2, str1.3, str1.4, str2, str2.1, str2.2, str2.3, str2.4, str2.5,str3,str3.1,str3.2, str4, str4.1,str4.2,str4.25, str4.3, str4.4, step = '<br/>'))
    })
 
output$translation = renderPlot({
  ## if correct
  confidencecorrect = seq(0,100,1)
  confidencetransformedcorrect = (.005*confidencecorrect+.5)
  pointsearnedcorrect = 2*log(2*confidencetransformedcorrect)
  correctawarded = data.frame(confidencecorrect=confidencecorrect, confidencetransformedcorrect = confidencetransformedcorrect, pointsearnedcorrect = pointsearnedcorrect)
  
  ## if wrong
  confidencewrong = seq(0,100,1)
  confidencetransformedwrong = (-.005*confidencewrong+.5)
  pointsdeducedwrong = .5*log(2*confidencetransformedwrong)
  incorrectdeduced = data.frame(confidencewrong=confidencewrong, confidencetransformedwrong = confidencetransformedwrong, pointsdeducedwrong = pointsdeducedwrong)
  
  #together
  pointsawarded = data.frame(confidencecorrect=c(confidencecorrect,confidencecorrect), 
                             pointsawarded = c(pointsearnedcorrect, pointsdeducedwrong),
                             Result = c(rep("Correct",101),rep("Incorrect",101))
  )
  plot = ggplot()+
    geom_line(data = pointsawarded, aes(x=confidencecorrect, y=pointsawarded, color = Result)) +
    xlab("Confidence Level") + ylab("Points Awarded") + ggtitle("Points Scaling") 
  return(plot)
})



# output$outlook = renderPlot({
#   google2 = google() %>%
#     group_by(Name) %>%
#     # filter(Winner==" ") %>%
#     mutate(Totalpoints = sum(PointsAwarded)) %>%
#     mutate(PointsAwarded = ifelse(Winner!=" ",maxpoints = sum(PointsIfCorrect), minpoints = sum(PointsIfWrong), interval = maxpoints-minpoints,0)) %>%
#     arrange(desc(Totalpoints))
#   
#     # factor(Name, levels = Name[order(Totalpoints)])
#   plot2 = ggplot(data=google2, aes(y = Totalpoints, x = Name, color = Name)) +
#     geom_point() +
#     geom_errorbar(aes(ymin = minpoints, ymax = maxpoints)) +
#     ggtitle("Standings along with Max Possible and Min Possible Points based on current selections")
# 
#   # x$name <- factor(x$name, levels = x$name[order(x$val)])
# 
#   return(plot2)
# })

output$outlook = renderPlot({
  google2 = google() %>%
    group_by(Name) %>%
    # filter(Winner==" ") %>%
    summarise(Totalpoints = sum(PointsAwarded)) %>%
    # mutate(maxpoints = sum(PointsIfCorrect), minpoints = sum(PointsIfWrong), interval = maxpoints-minpoints, Totalpoints = sum(PointsAwarded)) %>%
    arrange(desc(Totalpoints)) %>%
    select(Name, Totalpoints)
  google3 = google() %>%
    filter(Winner==" ") %>%
    group_by(Name) %>%
    summarise(min=sum(PointsIfWrong), max = sum(PointsIfCorrect)) 
  google4 = google2 %>%
    left_join(google3) %>%
    mutate(minpoints=Totalpoints+min, maxpoints=Totalpoints+max)
  plot2 = ggplot(data=google4, aes(y = Totalpoints, x = Name, color = Name)) +
    geom_point() +
    geom_errorbar(aes(ymin = minpoints, ymax = maxpoints)) +
    ggtitle("Standings along with Max Possible and Min Possible Points based on current selections") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
  return(plot2)
})
   
}

shinyApp(ui, server)