#install and run leaflet packages for map
#install.packages("leaflet")

library(leaflet)
my.ui <- fluidPage(fluidPage(navbarPage(
  "Mass Shooting in United States",
  
  #Tab for incidents map
  
  tabPanel("Incidents Map",
           sidebarLayout(
             sidebarPanel(
               
               # allow user to select between years 2013-2017. user can also choose all
               # the dataset. 
               
               selectInput(
                 "year",
                 "Select year:",
                 c("All", "2013", "2014", "2015", "2016", "2017")
               ),
               
               # Sliders for filtering out how many injuries or deaths occured.
               # Map will only display points that match the filter
               
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
             # output for map to be displayed
             mainPanel(leafletOutput(outputId = "map", height = 800))
             
           )),
  # tab for histograms 
  tabPanel("Histograms",
           sidebarLayout(
             sidebarPanel(
               # like the map, users can filter out the years they want to be displayed
               selectInput(
                 "year3",
                 "Select year:",
                 c("All", "2013", "2014", "2015", "2016", "2017")
               ),
               # sliders work the same way they do in the map tab
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
             # output for histograms to be displayed
             mainPanel(
               plotOutput("histogram"),
               plotOutput("histogram2")
               )
             
           )),
  # tab for frequency histogram to show hpw frequent these shooting occur in each state
  tabPanel("Frequency",
           fluidRow(
             column(3,
              # Slider functions same way as tabs above
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
            # output to display the plot
            plotOutput("histogram3")
             
             
           ),
  tabPanel("About",
           includeMarkdown("README.md"))
)))
shinyUI(my.ui)