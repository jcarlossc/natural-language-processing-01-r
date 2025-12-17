# -------------------------------------------------
# COLETA DE DADOS
# -------------------------------------------------
# Objetivo:
# Carregar o texto bruto da Lei Geral de Proteção de Dados (LGPD),
# preservando sua estrutura original para garantir rastreabilidade
# e reprodutibilidade ao longo do pipeline de NLP.
#
# Fonte:
# Lei nº 13.709/2018 – Presidência da República (Planalto)
# https://www.planalto.gov.br
# -------------------------------------------------


library(tibble)
library(readr)


# Caminho do arquivo contendo o texto bruto da LGPD.
# O arquivo é armazenado em data/raw para manter separação
# clara entre dados originais e dados processados.
arquivo <- "data/raw/lgpd.txt"


# Verificação preventiva da existência do arquivo.
# Evita falhas silenciosas e facilita depuração em 
# ambientes diferentes.
if (!file.exists(arquivo)) {
  stop("Arquivo de texto não encontrado em: ", arquivo)
}


# Leitura do texto bruto com encoding explícito (UTF-8).
# Nenhuma transformação textual é aplicada nesta etapa,
# respeitando o princípio de que coleta ≠ pré-processamento.
texto_bruto <- read_lines(
  file = arquivo,
  locale = locale(encoding = "UTF-8")
)


# Estruturação inicial dos dados em tibble
# - doc_id identifica o documento (útil para LDA/STM futuros)
# - linha_id preserva a ordem original do texto
# - texto mantém o conteúdo bruto
base_texto <- tibble(
  id = seq_along(texto_bruto),
  texto = texto_bruto
)
