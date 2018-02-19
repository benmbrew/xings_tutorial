library(shiny)
library(shinydashboard)
library(DT)


ui <- dashboardPage(skin = 'red',
                    
                    
                    dashboardHeader(
                      title = "LFS database at SickKids",
                      titleWidth = 300
                    ),
                    
                    dashboardSidebar(width = 300,
                                     
                                     sidebarMenu(
                                       menuItem('Raw clinical data',
                                                icon = icon('table'),
                                                tabName = 'raw_clin'),
                                       menuItem('Summary stats',
                                                icon = icon('bar-chart-o'),
                                                tabName = 'lfs_database'))),
                    dashboardBody(
                      tags$head(
                        tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
                      ),
                      tabItems(
                        tabItem(tabName = "raw_clin",
                                h2('Download clinical data'),
                                helpText(''),
                                fluidRow(column(12,
                                                DT::dataTableOutput('clin_table')))
                                
                        ),
                        tabItem(tabName = "lfs_database",
                                h2('Explore Sickkids database'),
                                helpText('example text'),
                                fluidRow(column(12,
                                                strong('Examine by'))),
                                fluidRow(column(4, 
                                                checkboxInput('cancer_status',
                                                              'Cancer type',
                                                              value = NULL)),
                                         column(4,
                                                checkboxInput('p53_status',
                                                              'tp53 status',
                                                              value = NULL)),
                                         column(4,
                                                checkboxInput('gender',
                                                              'Gender',
                                                              value = NULL))),
                                fluidRow(column(4,
                                                uiOutput('cancer_filter')),
                                         column(4,
                                                uiOutput('p53_filter')),
                                         column(4,
                                                uiOutput('gender_filter'))),
                                
                                
                                tabsetPanel(
                                  tabPanel('Table',
                                           fluidRow(column(12,
                                                           textOutput('lfs_text'),
                                                           DT::dataTableOutput('lfs_table')
                                           ))),
                                  tabPanel('Plot', 
                                           plotOutput('bar_plot'))))
                        
                      )))




# Define server 
server <- function(input, output) {
  # gender filter

  
}




# Run the application 
shinyApp(ui = ui,
         server)

