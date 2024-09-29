library(ggplot2)
library(scales)  

# Calcular percentuais
dados$recomendaria <- as.factor(dados$recomendaria)  # Garantir que é fator
dados$recomendaria <- factor(dados$recomendaria, levels = c("Sim", "Não"))  # Ajustar a ordem, se necessário

# Criar uma tabela de frequências com percentuais
tabela_freq <- table(dados$recomendaria)
df_percentuais <- as.data.frame(tabela_freq)
df_percentuais$Percentual <- df_percentuais$Freq / sum(df_percentuais$Freq)  # Converter em proporções para os rótulos

# Corrigir os nomes das colunas para garantir que estão corretos
colnames(df_percentuais) <- c("recomendaria", "Freq", "Percentual")

# Gráfico de barras com percentuais nos rótulos e contagem no eixo y
ggplot(df_percentuais, aes(x = recomendaria, y = Freq)) +
  geom_bar(stat = "identity", fill = "cornflowerblue") +  # 'identity' para usar valores de 'y' diretamente
  scale_y_continuous(labels = scales::comma,  # Formatar eixo y para mostrar contagem real
                     breaks = scales::pretty_breaks(n = 10)) +  # Usar a função pretty_breaks para ajustar as quebras
  labs(title = "Recomendação da Uniamérica Descomplica",
       x = "Recomendação",
       y = "Contagem de Estudantes") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  geom_text(aes(label = scales::percent(Percentual, accuracy = 0.1)), vjust = -0.5)  # Adicionar rótulos de texto com percentuais acima das barras
