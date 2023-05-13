source("data.R")

# Define a server for the Shiny app
server <- function(input, output) {
  
  # Fill in the spot we created for a plot
  output$ChangesOverTimePlot <- renderPlot({
    
    selected_populations <- input$populations
    filtered_data <- df_cancer[df_cancer$Population %in% selected_populations,]
    
    # Create the plot for Change in number of cases
    ggplot(filtered_data, aes(x = Year, y = Change_in_number_of_cases, group = Population, color = Population)) +
      geom_line() +
      labs(title = "Change in Number of Cases Over Time by Population",
           x = "Year",
           y = "Change in Number of Cases")
  })
  
  output$ChangeDuePop <- renderPlot({
    
    selected_populations <- input$populations
    filtered_data <- df_cancer[df_cancer$Population %in% selected_populations,]
    
    # Create the plot for Change in number of cases due to population
    ggplot(filtered_data, 
           aes(x = Year, 
               y = Change_in_number_of_cases_due_to_population, 
               group = Population, 
               color = Population)) +
      geom_line() +
      labs(title = "Change in Number of Cases Over Time by Population due to population",
           x = "Year",
           y = "Change in Number of Cases Due to Population")
  })
  
  output$ChangeRatio <- renderPlot({
    
    selected_populations <- input$populations
    filtered_ratio <- df_cancer_change_ratio[df_cancer_change_ratio$Population %in% selected_populations,]
    
    # Create a plot to show the cases increase ratio by population
    ggplot(filtered_ratio, 
           aes(x=Population, y=Cases_Increase_Each_5_Years)) +
      geom_bar(stat="identity", fill = "blue") +
      labs(x = "Population", y = "Cases Increase Each 5 Years") +
      theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
      theme(axis.title.x = element_text(face="bold", size=12)) +
      theme(axis.title.y = element_text(face="bold", size=12)) +
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
      theme(panel.background = element_blank()) +
      theme(plot.title = element_text(face="bold", size=20)) +
      ggtitle("Cases Increase Each 5 Years by Population") +
      scale_y_continuous(labels = function(x) format(x, scientific = FALSE)) +
      theme(axis.text = element_text(size=12), axis.title = element_text(size=14)) +
      theme(plot.title = element_text(hjust = 0.5))
  })
    
}