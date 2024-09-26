# Carregar os dados (substitua pelo caminho correto do arquivo CSV)
dados <- read.csv("data/Pesquisa de satisfação com a universidade.csv")

# Criar a tabela cruzada entre o curso e a satisfação
tabela_curso_satisfacao <- table(dados$Qual.é.o.seu.curso.atual.., 
                                 dados$Quão.satisfeito.você.está.com.a.sua.experiência.acadêmica.na.faculdade..de.forma.geral...)

# Visualizar a tabela
print(tabela_curso_satisfacao)

# Gerar o heatmap
library(ggplot2)
library(reshape2)

# Converter a tabela para um formato adequado ao ggplot
df_curso_satisfacao_melt <- melt(tabela_curso_satisfacao)

# Verificar os nomes das colunas
colnames(df_curso_satisfacao_melt)  # Normalmente serão Var1, Var2 e value

# Criar o heatmap com os nomes corretos
ggplot(data = df_curso_satisfacao_melt, aes(x = Var1, y = Var2, fill = value)) + 
  geom_tile() + 
  scale_fill_gradient(low = "white", high = "blue") + 
  labs(x = "Curso Atual", y = "Nível de Satisfação", title = "\nSatisfação por Curso") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
