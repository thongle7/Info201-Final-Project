library(leaflet)
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
             
           )),
  tabPanel("Historgrams",
           sidebarLayout(
             sidebarPanel(
               selectInput(
                 "year3",
                 "Select year:",
                 c("All", "2013", "2014", "2015", "2016", "2017")
               ),
               
               sliderInput(
                 "Dead3",
                 "Dead Amount",
                 min = 0,
                 max = 100,
                 value = c(0, 100)
               ),
               sliderInput(
                 "Injured3",
                 "Injured Amount",
                 min = 0,
                 max = 442,
                 value = c(0, 442)
               )
               
             ),
             mainPanel(
               plotOutput("histogram"),
               plotOutput("histogram2")
               )
             
           )),
  tabPanel("Frequency",
           fluidRow(
             column(3,
               selectInput(
                 "year4",
                 "Select year:",
                 c("All", "2013", "2014", "2015", "2016", "2017")
               )),
              column(4,
               sliderInput(
                 "Dead4",
                 "Dead Amount",
                 min = 0,
                 max = 100,
                 value = c(0, 100)
               )),
             column(5,
               sliderInput(
                 "Injured4",
                 "Injured Amount",
                 min = 0,
                 max = 442,
                 value = c(0, 442)
               ))
               
             ),
            
            plotOutput("histogram3")
             
             
           ),
  tabPanel("About",
           includeMarkdown("README.md"))
)))
shinyUI(my.ui)