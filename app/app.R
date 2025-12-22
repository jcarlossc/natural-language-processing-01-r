# --------------------------------------------------
# INTERFACE DO USUÁRIO
# --------------------------------------------------

library(shiny)
library(tidyverse)
library(wordcloud2)
library(htmlwidgets)


# A nuvem de palavras é utilizada como ferramenta exploratória inicial,
# oferecendo uma visão rápida da distribuição dos termos no corpus.
# A tabela complementa as visualizações gráficas ao fornecer valores
# precisos para auditoria, interpretação e reprodutibilidade da análise.


# Leitura dos dados pré-processados.
texto <- read_csv("../data/processed/processed_text.csv")

ui <- fluidPage(
  titlePanel("Análise de Texto"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Visualização de nuvem de palavras e frequência")
    ),
    
    mainPanel(
      h4("Nuvem de palavras"),
      wordcloud2Output("nuvem", height = "500px"),
      hr(),
      h4("Frequência de palavras"),
      tableOutput("tabela")
    )
  )
)

# Servidor.
server <- function(input, output, session) {
  
  # Frequência das palavras.
  frequencia <- reactive({
    texto %>%
      count(palavra, sort = TRUE)
  })
  
  # Nuvem de palavras.
  output$nuvem <- renderWordcloud2({
    wordcloud2(
      data = frequencia(),
      size = 0.8,
      color = "random-light",
      backgroundColor = "white"
    )
  })
  
  # Tabela de frequência.
  output$tabela <- renderTable({
    frequencia()
  })
}

# Executa a aplicação.
shinyApp(ui, server)


