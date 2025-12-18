# ----------------------------
# PROCESSAMENTO DE TEXTO (NLP)
# ----------------------------

library(tidytext)
library(dplyr)

# Caminho do arquivo contendo o texto pré-processado da LGPD.
# O arquivo é armazenado em data/processed para manter separação
# clara entre dados originais e dados processados.
texto <- read.csv("data/processed/processed_text.csv")


# Gera a distribuição de frequência dos tokens, etapa fundamental
# para análise exploratória e construção de vocabulário em NLP.
frequencia <- texto %>%
  count(palavra, sort = TRUE)


# Aplica TF-IDF para ponderar a importância dos termos,
# reduzindo o peso de palavras comuns e enfatizando termos distintivos.
texto_tfidf <- texto %>%
  count(id, palavra) %>%
  bind_tf_idf(palavra, id, n) %>%
  arrange(desc(tf_idf))
