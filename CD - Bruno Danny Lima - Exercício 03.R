# Nome: Bruno Danny Lima
# Código: 22695
# Curso: Ciências da Computação

# ------------ RESPOSTAS DO EXERCÍCIO 03 ------------

#Exercício 01
library(MASS)
#A
UScereal
#B
dim(UScereal)
#C
UScereal[1:10,]
#D
UScereal[1:10, seq(1, 5, 2)]
#E
med = mean(UScereal[,2])
med
alimentos = UScereal[, 2]
alimentos
calorias = UScereal[alimentos > med,]
calorias
write.table(calorias, file = "muitascalorias.txt")


#Exercício 02
#A
idade = c(53, 34, 26, 72, 18)
peso = c(52, 64, 68, 72, 78)
altura = c(180, 176, 161, 150, 168)
genero = c("H", "M", "M", "H", "M")
df = data.frame(idade, peso, altura, genero)
df
#B
df$idade
#C
nome = c("Bruno", "Bia", "Maria", "Alan", "Lari")
df = data.frame(nome, idade, peso, altura, genero)
df
#D
nome = toupper(nome)
df = data.frame(nome, idade, peso, altura, genero)
df
#E
write.table(df, file = "individuos.txt")
