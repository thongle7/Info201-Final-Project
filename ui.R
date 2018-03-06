my.ui <- fluidPage(fluidPage(navbarPage(
  "Mass Shooting in United States",
  tabPanel("Incidents Map",
           sidebarLayout(
             sidebarPanel(
               selectInput(
                 "year",
                 "Select year:",
                 c("All", "2013", "2014", "2015", "2016", "2017")
               ),
               
               sliderInput(
                 "Dead",
                 "Dead Amount",
                 min = 0,
                 max = 100,
                 value = c(0, 100)
               ),
               sliderInput(
                 "Injured",
                 "Injured Amount",
                 min = 0,
                 max = 442,
                 value = c(0, 442)
               )
               
             ),
             mainPanel(leafletOutput(outputId = "map", height = 800))
             
           )),
  tabPanel("Heat Map",
           sidebarLayout(
             sidebarPanel(
               selectInput(
                 "year",
                 "Select year:",
                 c("All", "2013", "2014", "2015", "2016", "2017")
               ),
               
               sliderInput(
                 "Dead",
                 "Dead Amount",
                 min = 0,
                 max = 100,
                 value = c(0, 100)
               ),
               sliderInput(
                 "Injured",
                 "Injured Amount",
                 min = 0,
                 max = 442,
                 value = c(0, 442)
               )
               
             ),
             mainPanel()
             
           ))
)))
shinyUI(my.ui)