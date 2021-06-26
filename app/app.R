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

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Network Analysis App"),

    # Sidebar ====
    sidebarLayout(
        sidebarPanel(
            
            # Correlations of A ====
            sliderInput("corrAB",
                        "Correlation A & B",
                        min = -1,
                        max = 1,
                        value = 0.1,
                        step = 0.05),
            sliderInput("corrAC",
                        "Correlation A & C",
                        min = -1,
                        max = 1,
                        value = 0.1,
                        step = 0.05),
            sliderInput("corrAD",
                        "Correlation A & D",
                        min = -1,
                        max = 1,
                        value = 0.1,
                        step = 0.05),
            sliderInput("corrAE",
                        "Correlation A & E",
                        min = -1,
                        max = 1,
                        value = 0.1,
                        step = 0.05),
        
            # Correlations of B ====
        
            sliderInput("corrBC",
                        "Correlation B & C",
                        min = -1,
                        max = 1,
                        value = 0.1,
                        step = 0.05),
            sliderInput("corrBD",
                        "Correlation B & D",
                        min = -1,
                        max = 1,
                        value = 0.1,
                        step = 0.05),
           
            sliderInput("corrBE",
                        "Correlation B & E",
                        min = -1,
                        max = 1,
                        value = 0.1,
                        step = 0.05),
        
            # Correlations of C ====
            sliderInput("corrCD",
                        "Correlation C & D",
                        min = -1,
                        max = 1,
                        value = 0.1,
                        step = 0.05),
        
            sliderInput("corrCE",
                        "Correlation C & E",
                        min = -1,
                        max = 1,
                        value = 0.1,
                        step = 0.05),
       
            # Correlations of D ====
            sliderInput("corrDE",
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

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$network <- renderPlot({
    
        # Create matrix
        mat <- matrix(
            c(
                0, input$corrAB, input$corrAC, input$corrAD, input$corrAE,
                input$corrAB,      0, input$corrBC, input$corrBD, input$corrBE,
                input$corrAC, input$corrBC,      0, input$corrCD, input$corrCE,
                input$corrAD, input$corrBD, input$corrCD,      0, input$corrDE,
                input$corrAE, input$corrBE, input$corrCE, input$corrDE,      0
            ),
            ncol = 5, nrow = 5,
            byrow = TRUE)
        
        # Create network
        network(
            # Correlations ====
            # Correlations of A
            corrAB = input$corrAB,
            corrAC = input$corrAC,
            corrAD = input$corrAD,
            corrAE = input$corrAE,
            
            # Correlations of B
            corrBC = input$corrBC,
            corrBD = input$corrBD,
            corrBE = input$corrBE,
            
            # Correlations of C
            corrCD = input$corrCD,
            corrCE = input$corrCE,
            
            # Correlations of D
            corrDE = input$corrDE,
            
            # Layout ====
            layout = 'spring'
        )
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
