# ------------------
# GRÁFICO DE TÓPICOS
# ------------------

library(ggplot2)


# O gráfico apresenta as principais palavras associadas a cada 
# tópico identificado pelo modelo de descoberta de tópicos, 
# considerando a probabilidade (beta) de cada termo dentro do 
# respectivo tópico. O valor de beta representa a relevância 
# do termo, isto é, a probabilidade de uma palavra ocorrer em um 
# determinado tópico segundo o modelo.


# Inicializa o gráfico utilizando o data frame topicos e define a 
# estética principal.
ggplot(topicos, aes(x = beta, y = reorder(term, beta))) +
  geom_col(fill = "#41B6C4") +   
    
  # Adiciona rótulos numéricos às barras; ajusta horizontalmente e 
  # posiciona o texto levemente à direita da ; e configura o tamanho da fonte.
  geom_text(aes(label = round(beta, 3)), 
            hjust = -0.1,
            size = 3) +
  
  # Divide o gráfico em painéis independentes e permite que cada tópico tenha 
  # sua própria escala de termos.  
  facet_wrap(~ topic, scales = "free_y") +
    
  # Define título e rótulos dos eixos, descrevendo claramente o conteúdo 
  # do gráfico e o significado das variáveis apresentadas.  
  labs(
    title = "Principais palavras por tópico",
    x = "Probabilidade (beta)",
    y = "Termo"
  ) +
    
  # Aplica um tema minimalista.  
  theme_minimal(base_size = 13) +
    
  # Destaca visualmente o título principal e os rótulos das facetas (tópicos).  
  theme(
    plot.title = element_text(face = "bold"),
    strip.text = element_text(face = "bold")
  )

