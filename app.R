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
                                       menuItem('Raw data',
                                                icon = icon('table'),
                                                tabName = 'raw_data'),
                                       menuItem('Summary stats',
                                                icon = icon('bar-chart-o'),
                                                tabName = 'ywca_stats'))),
                    dashboardBody(
                      tags$head(
                        tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
                      ),
                      tabItems(
                        tabItem(
                          tabName = "raw_data",
                                h2('Download clinical data'),
                                helpText(''),
                                fluidRow(column(12,
                                                DT::dataTableOutput('clin_table'))),
                          tabsetPanel(
                            tabPanel('HR data',
                                     fluidRow(
                                       column(12,
                                              DT::dataTableOutput('hr_table'))
                                     )
                                     
                            ),
                            
                            tabPanel('Program stats',
                                     fluidRow(
                                       column(12,
                                              DT::dataTableOutput('program_table'))
                                     )
                                     
                            ),
                            tabPanel('Stats over time',
                                     fluidRow(
                                       column(12,
                                              DT::dataTableOutput('over_time_table'))
                                     )
                            )

                          )
                                
                        ),
                        tabItem(
                          tabName = "ywca_stats",
                                h2('Explore YWCA data and stats'),
                                helpText(''),
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
                                                           textOutput('xing_text'),
                                                           DT::dataTableOutput('xing_table')
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

