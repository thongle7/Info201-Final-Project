my.ui <- fluidPage(
  # Title of the page
  titlePanel("Mass Shooting in United States"),
  fluidPage(
    sidebarLayout(
      sidebarPanel(
        selectInput("year", "Select year:", c( "All","2013", "2014", "2015", "2016", "2017")),
        
        sliderInput("Dead", "Dead Amount", min = 0, 
                    max = 100, value = c(0,100)),
        sliderInput("Injured", "Injured Amount", min = 0, 
                    
                    max = 442, value = c(0,442))
        
      ),
      mainPanel(
        leafletOutput(
          outputId = "map"
        )
      )
      
    )
    
  )
)
shinyUI(my.ui)