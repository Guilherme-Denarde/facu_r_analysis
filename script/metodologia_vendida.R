library(ggplot2)

# Carregar os dados
dados <- read.csv("data/Pesquisa de satisfação com a universidade.csv")

# Criar a tabela de frequência para a coluna específica
tabela_metodologia <- table(dados[, 6])  # Substitua '6' pelo índice correto da coluna

# Converter a tabela em um dataframe
df_metodologia <- as.data.frame(tabela_metodologia)
df_metodologia$Resposta <- rownames(df_metodologia)
df_metodologia$Contagem <- df_metodologia$Freq
rownames(df_metodologia) <- NULL

# Ajustar os rótulos das respostas para "Sim" e "Não"
df_metodologia$Resposta <- ifelse(df_metodologia$Resposta == "1", "Não", "Sim")

# Criar o gráfico se houver dados
if (nrow(df_metodologia) > 0) {
  ggplot(df_metodologia, aes(x = Resposta, y = Contagem, fill = Resposta)) +
    geom_bar(stat = "identity") +
    labs(title = "A metodologia de estudo vendida, correspondeu com suas expectativas ?",
         x = "Resposta",
         y = "Número de Estudantes") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
} else {
  print("Não há dados para plotar. Verifique a coluna de origem dos dados.")
}
