library(shiny)
library(dplyr)
library(ggplot2)
library(ggmap)
library(leaflet)

# Read data
data2013 <-
  read.csv(file = "newdata/2013ms.csv", stringsAsFactors = FALSE)
data2014 <-
  read.csv(file = "newdata/2014ms.csv", stringsAsFactors = FALSE)
data2015 <-
  read.csv(file = "newdata/2015ms.csv", stringsAsFactors = FALSE)
data2016 <-
  read.csv(file = "newdata/2016ms.csv", stringsAsFactors = FALSE)
data2017 <-
  read.csv(file = "newdata/2017ms.csv", stringsAsFactors = FALSE)
all_data <- rbind(data2013, data2014, data2015, data2016, data2017)


my.server <- function(input, output) {
  ## Functions for incidents map
  select_year <- function(year) {
    data <- eval(parse(text = paste("data", year, sep = "")))
    return(data)
  }
  filter_dead <- function(data, input) {
    data <- filter(data, X..Killed >= input[1]) %>%
      filter(X..Killed <= input[2])
    return(data)
  }
  filter_injured <- function(data, input) {
    data <- filter(data, X..Injured >= input[1]) %>%
      filter(X..Injured <= input[2])
    return(data)
  }
  map_year <- function(data) {
    data %>%
      leaflet() %>%
      addTiles() %>%
      addMarkers(
        popup = paste0(
          "<b>Full address:</b> ",
          data$fullad,
          "<br/><b>",
          "Incident Date: </b>",
          data$Incident.Date,
          "<br/><b>",
          "Dead: </b>",
          data$X..Killed,
          "</br><b>",
          "Injured: </b>",
          data$X..Injured
        ),
        clusterOptions = markerClusterOptions()
      )
  }
  ## incidents map
  output$map <- renderLeaflet({
    if (input$year == "All") {
      data <- all_data
      data <- filter_dead(data, input$Dead)
      data <- filter_injured(data, input$Injured)
      map_year(data)
    } else{
      data <- select_year(input$year)
      data <- filter_dead(data, input$Dead)
      data <- filter_injured(data, input$Injured)
      map_year(data)
    }
  })
  
  ################################
  # Histogram
  output$histogram2 <- renderPlot({
    if (input$year3 == "All") {
      data <- all_data
      data <- filter_dead(data, input$Dead3)
      data <- filter_injured(data, input$Injured3)
      
      ggplot(
        data,
        aes(x = State, y = X..Injured),
        group = State
        ,
        fill = State,
        environment = environment()
      ) +
        geom_bar(stat = "identity") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
        labs(title = "Amount of Injured in states", x = "State", y = "Injured in State")
    }else{
      data <- select_year(input$year3)
      data <- filter_dead(data, input$Dead3)
      data <- filter_injured(data, input$Injured3) 
      ggplot(
        data,
        aes(x = State, y = X..Injured),
        group = State
        ,
        fill = State,
        environment = environment()
      ) +
        geom_bar(stat = "identity") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
        labs(title = "Amount of Injured in states", x = "State", y = "Injured in State")
    }
  })
  output$histogram <- renderPlot({
    if (input$year3 == "All") {
      data <- all_data
      data <- filter_dead(data, input$Dead3)
      data <- filter_injured(data, input$Injured3)
      
      
      ggplot(
        data,
        aes(x = State, y = X..Killed),
        group = State
        ,
        fill = State,
        environment = environment()
      ) +
        geom_bar(stat = "identity") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
        labs(title = "Amount of deaths in states", x = "State", y = "Deaths in State")
      
    } else{
      data <- select_year(input$year3)
      data <- filter_dead(data, input$Dead3)
      data <- filter_injured(data, input$Injured3)
      
      
      ggplot(
        data,
        aes(x = State, y = X..Killed),
        group = State
        ,
        fill = State,
        environment = environment()
      ) +
        geom_bar(stat = "identity") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
        labs(title = "Amount of deaths in states", x = "State", y = "Deaths in State")
      
      
      
    }
    
  })
  output$histogram3 <- renderPlot({
    if (input$year4 == "All") {
      data <- all_data
      data <- filter_dead(data, input$Dead4)
      data <- filter_injured(data, input$Injured4)
      
      ggplot(data, aes(x = State))+ 
        geom_bar(aes(col=State)) +
        theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
        labs(title = "Incidents Frequency",  x = "State", y = "Frequency")

      
    } else{
      data <- select_year(input$year4)
      data <- filter_dead(data, input$Dead4)
      data <- filter_injured(data, input$Injured4)
      
      ggplot(data, aes(x = State))+ 
        geom_bar(aes(col=State)) +
        theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
        labs(title = "Incidents Frequency",  x = "State", y = "Frequency")
      
      
      
    }
    
  })
  
}
shinyServer(my.server)