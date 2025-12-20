# ------------------
# GRÁFICO DE TÓPICOS
# ------------------

library(ggplot2)

# O gráfico apresenta os 15 termos com maior valor de 
# TF-IDF (Term Frequency–Inverse Document Frequency), métrica 
# amplamente utilizada em Processamento de Linguagem Natural 
# para identificar palavras mais relevantes e discriminantes 
# em um conjunto de documentos.

# Inicializa o gráfico a partir do data frame e utiliza slice_max() para 
# selecionar os 15 termos.
ggplot(texto_tfidf |> slice_max(tf_idf, n = 15),
       
       # Define a estética do gráfico.
       aes(x = tf_idf, y = reorder(palavra, tf_idf))) +
  
  # Cria um gráfico de barras.
  geom_col(fill = "#238B45") +
  
  # Adiciona rótulos textuais às barras.
  geom_text(aes(label = round(tf_idf, 2)),
            hjust = -0.1,
            size = 4) +
  
  # Define o título do gráfico e os rótulos dos eixos.
  labs(
    title = "Termos com maior TF-IDF",
    x = "TF-IDF",
    y = "Palavra"
  ) +
  
  # Aplica um tema minimalista.
  theme_minimal(base_size = 14)

