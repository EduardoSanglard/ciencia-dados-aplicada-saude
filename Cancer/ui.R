source("data.R")

# Use a fluid Bootstrap layout
ui <- fluidPage(    
  
  # Give the page a title
  titlePanel("Cancer cases forecast by population"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("populations", "Select population:", 
                  choices = unique(df_cancer$Population),
                  multiple = TRUE,
                  selected = unique(df_cancer$Population)),
      hr(),
      helpText("Data from OMS Cancer Tomorrow. Predictions on total number of cancer cases by population")
    ),
    
    # Create a spot for the plots
    mainPanel(
      plotOutput("ChangesOverTimePlot"),
      plotOutput("ChangeDuePop"),
      plotOutput("ChangeRatio")
    )
    
  )
)