# Nome: Network analysis
# Autor: Gabriel dos Reis Rodrigues
# June, 2021
# Last update: 2021-06-26
# ----------------------------------------

# Initial loading ====
load_libraries <- function(){
    if (!require("devtools"))
        install.packages("devtools"); library(devtools)
    if (!require("dplyr"))
        install.packages("dplyr"); library(dplyr)
    if (!require("forcats"))
        install.packages("forcats"); library(forcats)
    if (!require("ggplot2"))
        install.packages("ggplot2"); library(ggplot2)
    if (!require("GPArotation"))
        install.packages("GPArotation"); library(GPArotation)
    if(!require("igraph"))
        install.packages("igraph"); library(igraph)
    if(!require("lavaan"))
        install.packages("lavaan"); library(lavaan)
    if(!require("Matrix"))
        install.packages("Matrix"); library(Matrix)
    if(!require("psych"))
        install.packages("psych"); library(psych)
    if(!require("sna"))
        install.packages("sna"); library(sna)
    if(!require("qgraph"))
        install.packages("qgraph"); library(qgraph)
}

load_libraries()

source("functions.R", encoding = 'UTF-8')

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Network Analysis App"),

    # Sidebar ====
    sidebarLayout(
        sidebarPanel(
            
            # Correlations of A ====
            numericInput("corrAB",
                         "Correlation A & B",
                         min = -1,
                         max = 1,
                         value = 0.1,
                         step = 0.05),
            numericInput("corrAC",
                         "Correlation A & C",
                         min = -1,
                         max = 1,
                         value = 0.1,
                         step = 0.05),
            numericInput("corrAD",
                         "Correlation A & D",
                         min = -1,
                         max = 1,
                         value = 0.1,
                         step = 0.05),
            numericInput("corrAE",
                         "Correlation A & E",
                         min = -1,
                         max = 1,
                         value = 0.1,
                         step = 0.05),
        
            # Correlations of B ====
        
            numericInput("corrBC",
                         "Correlation B & C",
                         min = -1,
                         max = 1,
                         value = 0.1,
                         step = 0.05),
            numericInput("corrBD",
                         "Correlation B & D",
                         min = -1,
                         max = 1,
                         value = 0.1,
                         step = 0.05),
           
            numericInput("corrBE",
                         "Correlation B & E",
                         min = -1,
                         max = 1,
                         value = 0.1,
                         step = 0.05),
        
            # Correlations of C ====
            numericInput("corrCD",
                         "Correlation C & D",
                         min = -1,
                         max = 1,
                         value = 0.1,
                         step = 0.05),
        
            numericInput("corrCE",
                         "Correlation C & E",
                         min = -1,
                         max = 1,
                         value = 0.1,
                         step = 0.05),
       
            # Correlations of D ====
            numericInput("corrDE",
                         "Correlation D & E",
                         min = -1,
                         max = 1,
                         value = 0.1,
                         step = 0.05)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("network")
        )
    )
)

# Define server logic ====
server <- function(input, output) {

    output$network <- renderPlot({
    
        # Create network
        create_network(matrix,
                       # input$correlations ====
                       # input$correlations of A
                       input$corrAB,
                       input$corrAC,
                       input$corrAD,
                       input$corrAE,
                       # input$correlations of B
                       input$corrBC,
                       input$corrBD,
                       input$corrBE,
                       # input$correlations of C
                       input$corrCD,
                       input$corrCE,
                       # input$correlations of D
                       input$corrDE,
                       # Layout ====
                       layout = 'spring',
                       # Graph ====
                       graph = 'pcor')
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
