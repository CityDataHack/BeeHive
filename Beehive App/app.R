# import libraries
library(shiny)
library(shinydashboard)
library(tidyverse)
library(readr)
# pop <- read_csv(".\\tfl data\\Population Jobs.csv")
# head(pop)
# base2012 <- read_csv(".\\tfl data\\PTAL Data\\BaseYearFY2021FY31 PTALs.csv")
# head(base2012)

##################
# User Interface #
##################

# A. sidebar
sidebar <- dashboardSidebar(
  
              selectInput("location", label = "Choose Account:",
                          choices = c("Development 1 - Poor Plan", "Development 1 - Good Plan", 
                                      "Development 2", "Development 3", "Development 4"), 
                                      selected = "Development 1 - Poor Plan"),
              # 
              # checkboxInput("metric", label = "Choose Metric:",
              #             choices = c("Public Transport Connections", "Access to Schools", "c", "Safety"), selected = "Public Transport Connections")                       
              radioButtons("access", label = "Access Type", 
                                 choices = c("Public Transport", "Schools", "Supermarkets", "Green Space", "Safety"), 
                                 selected = "Public Transport")  
                                # selected = 1)#,
              
              
              #hr(),
              # fluidRow(column(3, verbatimTextOutput("value")))
)

# B.  body
body <- dashboardBody(
                
fluidRow( 
  tabBox(width = 12, id="tabset1",
               
         tabPanel("Index", 
                         fluidRow(
                           valueBoxOutput("PublicTransportAccessIndex"),
                           valueBoxOutput("SchoolsAccessIndex"),
                           valueBoxOutput("SupermarketsAccessIndex"),
                           valueBoxOutput("GreenSpaceIndex"),
                           valueBoxOutput("SafetyIndex"),
                           valueBoxOutput("ActiveTravelPlanIndex"),
                           valueBoxOutput("GeneralAccessibilityIndex")
                          
                           
                         )
                         
                )
         
         
   )#,
  
  #column(12,
          #imageOutput("image1") #,
          # imageOutput("image2")
  #)
# tags$img(src = "https://github.com/CityDataHack/BeeHive/blob/master/active_travel_EarlsCourt.png", width = "1200px", height = "1200px")
  
# img(src = "www//Earl's Court Education.png", width = "1200px", height = "1200px")
)
) 

# C.  Header
header <- dashboardHeader(title = HTML(paste("Beehive Travel Plan Analysis")),
                               titleWidth = 400)

# Put header, sidebar and body together on a dashboard page   
ui <- dashboardPage( 
  skin="yellow",
  header,
  sidebar,
  body
)

  
  
  
  
   
##########
# SERVER #
##########

#generic line initiating the SERVER 

server <- shinyServer(function(input, output) {
  
  
  #output$image1 <- renderImage({
     # Get width and height of image1
     # list(src=".\\www\\active-travel_EarlsCourt.png", 
    # list(src=".\active-travel_EarlsCourt.png", 
    #       width = "1200px", height = "1200px")
  #})
  
  output$accountName <- renderText({
    input$activeAccountTable
  })
  
  output$value <- renderPrint({ input$checkGroup })
  
  source("data.R", local=TRUE)
  source("filtered_data.R", local=TRUE)
  
  
  #############
  # Reactives #
  #############
  
  # define any reactive elements of the app
  ### Tabs ###
  # output$location_output <- renderUI({
  #   selectInput(inputId = "location", label = "Location:",
  #               accountChoices())
  # })
  # Tab1 - Summary
  source("ValueBox.R", local=TRUE)
  #Close the server definition
})

##############
# Launch App #
##############

#generic line that launches the app
shinyApp(ui = ui, server = server)