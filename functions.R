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
create_network <- 
  
  function(matrix,
           # Correlations ====
           # Correlations of A
           corrAB,
           corrAC,
           corrAD,
           corrAE,
           # Correlations of B
           corrBC,
           corrBD,
           corrBE,
           # Correlations of C
           corrCD,
           corrCE,
           # Correlations of D
           corrDE,
           # Layout ====
           layout = 'spring',
           # Graph ====
           graph = 'pcor') {
    
    # Create matrix ====
    mat <- matrix(
      c(
             0, corrAB, corrAC, corrAD, corrAE,
        corrAB,      0, corrBC, corrBD, corrBE,
        corrAC, corrBC,      0, corrCD, corrCE,
        corrAD, corrBD, corrCD,      0, corrDE,
        corrAE, corrBE, corrCE, corrDE,      0
      ),
      ncol = 5, nrow = 5,
      byrow = TRUE)
    
    # Create network ====
    qgraph(
      mat,
      layout = layout,
      edge.labels = TRUE,
      labels = LETTERS[1:5],
      fade = FALSE
    )
    
  }
