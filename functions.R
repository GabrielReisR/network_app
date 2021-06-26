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

# Network function ====
network <- 
  function(
    # Correlations ====
    # Correlations of A
    corrAB = 0.1,
    corrAC = 0.1,
    corrAD = 0.1,
    corrAE = 0.1,
    
    # Correlations of B
    corrBC = 0.1,
    corrBD = 0.1,
    corrBE = 0.1,
    
    # Correlations of C
    corrCD = 0.1,
    corrCE = 0.1,
    
    # Correlations of D
    corrDE = 0.1,
    
    # Layout ====
    layout = 'spring'
  ){
    
    # Create network
    qgraph(mat,
           layout = 'spring',
           edge.labels = TRUE,
           labels = LETTERS[1:5],
           fade = FALSE)
    
    
  }
