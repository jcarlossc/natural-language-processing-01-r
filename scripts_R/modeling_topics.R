# ---------------------
# DESCOBERTA DE TÓPICOS
# ---------------------
# Etapa de descoberta de tópicos responsável por identificar temas latentes
# no conjunto de documentos, apoiando análise exploratória, interpretação
# semântica e tomada de decisão baseada em texto.


library(topicmodels)
library(tm)
library(tidytext)
library(reshape2)


# Caminho do arquivo contendo o texto pré-processado da LGPD.
# O arquivo é armazenado em data/processed para manter separação
# clara entre dados originais e dados processados.
texto <- read.csv("data/processed/processed_text.csv")


# Constrói a matriz documento-termo (DTM), representando a frequência
# de cada palavra em cada documento do corpus.
matriz_dtm <- texto %>%
  count(id, palavra) %>%
  cast_dtm(id, palavra, n)


# Ajusta um modelo LDA (Latent Dirichlet Allocation) com 5 tópicos,
# utilizando a matriz documento-termo como entrada.
lda_modelo <- LDA(matriz_dtm, k = 5, control = list(seed = 123))


# Extrai as palavras mais representativas de cada tópico,
# selecionando os termos com maior probabilidade (beta).
topicos <- tidy(lda_modelo, matrix = "beta") %>%
  group_by(topic) %>%
  slice_max(beta, n = 10)
