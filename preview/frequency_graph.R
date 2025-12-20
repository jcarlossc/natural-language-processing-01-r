# ---------------------
# GRÁFICO DE FREQUÊNCIA
# ---------------------

library(ggplot2)


# O código utiliza o pacote ggplot2 para construir um gráfico 
# de barras horizontais que representa as 20 palavras mais 
# frequentes do conjunto de dados. As palavras são ordenadas 
# de acordo com sua frequência absoluta, facilitando a comparação 
# visual entre os termos mais recorrentes.

# Inicializa o gráfico utilizando o data frame.
ggplot(frequencia[1:20, ], 
       aes(x = reorder(palavra, n), y = n)) +
  # Barras
  geom_col(
    fill = "#2C7FB8",        # cor das barras
    width = 0.7              # largura das barras
  ) +
  # Valores nas barras
  geom_text(
    aes(label = n),
    hjust = -0.1,            # posição do texto
    size = 3,                # tamanho da fonte
    color = "black"
  ) +
  
  # Inverte os eixos (barras horizontais).
  coord_flip() +
  
  # Títulos e rótulos.
  labs(
    title = "Top 20 palavras mais frequentes",
    subtitle = "Distribuição de frequência absoluta",
    x = "Palavra",
    y = "Frequência"
  ) +
  
  # Aplica um tema minimalista.
  theme_minimal(base_size = 13) +
  
  # Ajustes finos do tema.
  theme(
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(color = "gray40"),
    axis.text.y = element_text(size = 11),
    axis.text.x = element_text(size = 10)
  ) +
  
  # Garante espaço para os rótulos.
  expand_limits(y = max(frequencia$n) * 1.1)
