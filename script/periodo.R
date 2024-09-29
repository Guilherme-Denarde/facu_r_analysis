# Boxplot para 'periodo'
ggplot(dados, aes(y = periodo)) + 
  geom_boxplot(fill = "lightblue") +
  labs(title = "Boxplot do periodo Acadêmico dos Estudantes", y = "periodo Acadêmico")

