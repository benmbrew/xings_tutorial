library(shiny)
library(shinydashboard)
library(DT)


source('global.R')

ui <- dashboardPage(skin = 'red',
                    
                    
                    dashboardHeader(
                      title = "YWCA data dashboard",
                      titleWidth = 300
                    ),
                    
                    dashboardSidebar(disable = TRUE),
                    
                    
                    dashboardBody(
                      tags$head(
                        tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
                      ),
                      
                      fluidRow(column(12,
                                      align = 'center',
                                      selectInput('var_category',
                                                  'Choose a variable',
                                                  choices = unique(time_data$variable),
                                                  selected = unique(time_data$variable)[1:5],
                                                  multiple = TRUE))),
                      fluidRow(column(6,
                                      plotOutput('plot_cat')),
                               column(6,
                                      DT::dataTableOutput('table_cat')))
                     
           
                   ))




# Define server 
server <- function(input, output) {
  # gender filteru

  output$plot_cat <- renderPlot({
    
    var_category <- input$var_category
    
    # subset data 
    sub_data <- time_data %>% filter(variable %in% var_category)
    
    # ggplot line 
    ggplot(sub_data, aes(year, value, color = variable)) +
      geom_line()
    
  })
  
  output$table_cat <- renderDataTable({
    
    var_category <- input$var_category
    
    # subset data 
    sub_data <- time_data %>% filter(variable %in% var_category)
    
    datatable(sub_data)
    
    
  })
  
  
}




# Run the application 
shinyApp(ui = ui,
         server)

