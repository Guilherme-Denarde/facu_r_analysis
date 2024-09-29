# Carregar o arquivo CSV
dados <- read.csv("data/Pesquisa de satisfação com a universidade.csv", stringsAsFactors = FALSE, fileEncoding = "UTF-8")

# Verificar se a coluna 'Idade' existe e calcular estatísticas
if("idade" %in% colnames(dados)) {
  print(summary(dados$`idade`))
  variancia_idade <- var(dados$`idade`)
  desvio_padrao_idade <- sd(dados$`idade`)
  print(paste("Variância da Idade:", variancia_idade))
  print(paste("Desvio padrão da Idade:", desvio_padrao_idade))
} else {
  print("A coluna 'idade' não foi encontrada.")
}


# Histograma da idade
hist(dados$`idade`, 
     main = "Histograma da Idade dos Respondentes", 
     xlab = "Idade", 
     col = "skyblue", 
     breaks = 10)  # Ajuste o número de 'breaks' conforme necessário para melhor visualização

# Boxplot da idade
boxplot(dados$`idade`, 
        horizontal = TRUE, 
        main = "Boxplot das Idades", 
        xlab = "Idade", 
        col = "lightgreen")
