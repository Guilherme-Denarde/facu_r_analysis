library(ggplot2)
library(dplyr)

# Filtrar dados para incluir apenas respostas 'Não'
dados_nao_recomendam <- dados %>% 
  filter(`recomendaria` == "Sim")

# Verificar a distribuição de cursos entre aqueles que não recomendam
tabela_cursos <- table(dados_nao_recomendam$curso)

# Converter a tabela em dataframe para plotagem
df_cursos <- as.data.frame(tabela_cursos)
colnames(df_cursos) <- c("Curso", "Contagem")

# Criar o gráfico de barras
ggplot(df_cursos, aes(x = Curso, y = Contagem, fill = Curso)) +
  geom_bar(stat = "identity") +
  labs(title = "Distribuição de Cursos entre Estudantes que Não Recomendam a Uniamérica",
       x = "Curso",
       y = "Número de Estudantes") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Ajustar o texto do eixo X para melhor visualização
