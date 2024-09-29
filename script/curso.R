# Gráfico de barras para 'curso'
ggplot(dados, aes(x = curso, fill = curso)) + 
  geom_bar() +
  labs(title = "Distribuição de Estudantes por Curso", x = "Curso", y = "Contagem de Estudantes") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Ajustar os textos do eixo X para melhor visualização

