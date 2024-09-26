# Hypothesis 2 - About university satisfaction 
# Carregar os dados (substitua pelo caminho correto do arquivo CSV)
dados <- read.csv("data/Pesquisa de satisfação com a universidade.csv")

# Verificar as colunas disponíveis
colnames(dados)

# Remover valores ausentes nas colunas relevantes (usando os nomes corretos das colunas)
dados_limpos <- na.omit(dados[, c("Quão.satisfeito.você.está.com.a.sua.experiência.acadêmica.na.faculdade..de.forma.geral...",
                                  "A.metodologia.de.estudo.vendida..correspondeu.com.suas.expectativas..")])

# Criar a tabela cruzada entre a satisfação e a qualidade da metodologia
tabela_satisfacao <- table(dados_limpos$Quão.satisfeito.você.está.com.a.sua.experiência.acadêmica.na.faculdade..de.forma.geral..., 
                           dados_limpos$A.metodologia.de.estudo.vendida..correspondeu.com.suas.expectativas..)

# Visualizar a tabela cruzada
print(tabela_satisfacao)

# Realizar o teste qui-quadrado
teste_chi2 <- chisq.test(tabela_satisfacao)

# Exibir o resultado do teste
print(teste_chi2)

# Verificar se o p-valor é significativo (< 0.05 indica que há associação)
if(teste_chi2$p.value < 0.05) {
  print("Há uma associação significativa entre a satisfação e a qualidade de ensino percebida após a adoção do modelo Descomplica.")
} else {
  print("Não há uma associação significativa entre a satisfação e a qualidade de ensino percebida após a adoção do modelo Descomplica.")
}


# Carregar os dados (substitua pelo caminho correto do arquivo CSV)
dados <- read.csv("Pesquisa de satisfação com a universidade.csv")

# Verificar as colunas disponíveis
colnames(dados)

# Contar os níveis de satisfação
satisfaction_counts <- table(dados$Quão.satisfeito.você.está.com.a.sua.experiência.acadêmica.na.faculdade..de.forma.geral...)

# Gerar o gráfico de barras
barplot(satisfaction_counts, 
        main = "Níveis de Satisfação dos Estudantes com a Experiência Acadêmica",
        xlab = "Nível de Satisfação", 
        ylab = "Número de Estudantes",
        col = "skyblue", 
        las = 2)
