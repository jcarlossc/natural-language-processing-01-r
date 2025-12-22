# ============================================================
# Projeto: Pré-processamento e Processamento de Texto em R
# Script: main.R
# Descrição:
#   Script principal responsável por executar todas as etapas
#   do pipeline de NLP, desde o carregamento dos dados até a
#   geração de imagens e execução do dashboard Shiny.
# ============================================================

# ------------------------------------------------------------
# Configuração inicial do ambiente
# ------------------------------------------------------------

# Limpa o ambiente para evitar interferência de objetos antigos
rm(list = ls())

# Define opções globais
options(stringsAsFactors = FALSE)


# ------------------------------------------------------------
# Definição de caminhos do projeto
# ------------------------------------------------------------

paths <- list(
  scripts_R      = "scripts_R",
  data_raw       = "data/raw",
  data_processed = "data/processed",
  shiny          = "app",
  preview        = "preview"
)

# ------------------------------------------------------------
# Execução do pipeline de NLP
# ------------------------------------------------------------

message("▶ Iniciando execução do projeto NLP...")

# -------------------------
# 1. Carregamento dos dados
# -------------------------
message("▶ Etapa 1: Carregamento dos dados")
source(file.path(paths$scripts_R, "load_data.R"))

# -------------------------
# 2. Pré-processamento
# -------------------------
message("▶ Etapa 2: Pré-processamento de texto")
source(file.path(paths$scripts_R, "preprocessing.R"))

# -------------------------
# 3. Processamento de texto
# -------------------------
message("▶ Etapa 3: Processamento de texto")
source(file.path(paths$scripts_R, "processing.R"))

# -------------------------
# 4. Modelagem de tópicos
# -------------------------
message("▶ Etapa 4: Modelagem de tópicos")
source(file.path(paths$scripts_R, "modeling_topics.R"))

# ------------------------------------------------------------
# Geração de gráficos
# ------------------------------------------------------------

# message("▶ Gerando gráficos em ggplot2")
# source(file.path(paths$preview, "frequency_graph.R"))
# source(file.path(paths$preview, "topic_graph.R"))
# source(file.path(paths$preview, "graph_relevant_terms.R"))

# ------------------------------------------------------------
# Execução opcional do Shiny
# ------------------------------------------------------------

executar_shiny <- TRUE  # altere para TRUE se desejar iniciar o dashboard

if (executar_shiny) {
  message("▶ Iniciando aplicação Shiny")
  shiny::runApp(paths$shiny)
}

# ------------------------------------------------------------
# Finalização
# ------------------------------------------------------------

message("✔ Projeto executado com sucesso.")