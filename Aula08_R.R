# ANÁLISE DE DADOS

# Representação / Sumarização / Pré-Processamento dos Dados

# VARIÁVEIS QUALITATIVAS
# Medem características com um conjunto (finito) de valores
# Podem ser designadas por ordinais, se os seus valores tiverem uma ordem natural
# Um caso particular constitui as variáveis binárias, que podem tomar dois valores distintos

# VARIÁVEIS QUANTITATIVAS
# Medem características com valores numéricos, tipicamente num determinado intervalo de valores possíveis


# Carregando os dados para um data frame eData
arquivo = "http://darwin.di.uminho.pt/cursoAnaliseDados/earthquakeData.csv"
download.file(arquivo, destfile = "earthquakes.csv")

eData = read.csv("earthquakes.csv")
dim(eData)

# Verificando a dimensão com as funções dim, nrow e ncol
dim(eData)

nrow(eData) #linhas

ncol(eData) #colunas

# Verificando os nomes dos campos e algumas amostras com as funções names e rownames
names(eData)

rownames(eData)[1:5]

# Verificando os valores existentes no data set com a função head
head(eData, 3)

# As funções class e typeof pode ser aplicada a todos os campos para verificar
# se correspondem aos tipos adequados para a análise
class(eData)

unlist(lapply(eData, class))

unlist(lapply(eData, typeof))

# A correção de valores inadequados ao nível dos campos (colunas) e dos exemplos (linhas)
# pode ser facilmente realizada através das funções names e rownames

names(eData)

names(eData)[5] = "Latitude"
names(eData)[6] = "Longitude"
names(eData)

rownames(eData)[1:7]
rownames(eData) = paste("id-", rownames(eData), sep="")
rownames(eData)[1:7]


# Exemplos de sumarização com o data set eData
mean(eData$Magnitude)
median(eData$Magnitude)
sd(eData$Magnitude)
mad(eData$Magnitude)

# Exemplos de sumarização com o data set eData
quantile(eData$Magnitude)
summary(eData$Magnitude)

# Utilizando rowMeans
rowMeans(iris[,-5])

# Utilizando colMeans
colMeans(iris[,-5])

# Utilizando colSums
colSums(iris[,-5])

colMeans(iris[,-5][1:10,])

# Utilizando Unique
unique(eData$Src)

# Utilizando o table
table(eData$Src)

table(eData$Src, eData$Version)

# A linhas seguintes demonstram que não há valores em falta nos campos
# que se referem a longitude e a latitude do conjunto de dados
sum(is.na(eData$Latitude))

sum(is.na(eData$Longitude))

# Note que os NA são ignorados pela função table (tal comportamento pode ser alterado com o argumento useNA)
table(c(0, 1, 2, 3, NA, 3, 3, 2, 2, 3))

table(c(0, 1, 2, 3, NA, 3, 3, 2, 2, 3), useNA="ifany")

# Manipulando valores ausentes com o data frame cfseal do package DAAG
library(DAAG)

install.packages("DAAG")
data(cfseal)

# Manipulando valores ausentes com o data frame cfseal do package DAAG
cfseal$lung

sum(is.na(cfseal$lung))

cfseal$lung[cfseal$lung > 2000]

cfseal$lung[cfseal$lung > 2000 & !is.na(cfseal$lung)]

# media dos valores da coluna lung
mean(cfseal$lung)

mean(cfseal$lung, na.rm = T)

cfn = na.exclude(cfseal)

sum(is.na(cfn$lung))

sum(is.na(cfseal$lung))

mean(cfseal$lung)

m = mean(cfseal$lung, na.rm = T)
m

cfseal$lung[is.na(cfseal$lung)] = m

sum(is.na(cfseal$lung))

mean(cfseal$lung)

# A função complete.case permite identificar quais linhas de um data frame tem 
# valores adequados (que não sejam NA ou NaN)
data(airquality)

complete.cases(airquality)

dim(airquality)

aqn = airquality[complete.cases(airquality),]
aqn

dim(aqn)

sapply(airquality, function(x) sum(is.na(x)))

sapply(aqn, function(x) sum(is.na(x)))

# A discretização de variáveis numéricas passa pelo uso de vetores lógicos
# sobre cada um dos pontos de corte
pesos = c(12, 15, 35, 10, 20, 8, 13, 25)
pesos_nominal = (pesos >= 8) + (pesos >= 15) + (pesos >= 25)
pesos_nominal

# O vetor de magnitude do data frame eData é dividido em quatro categorias, 
# como pontos de limites os valores 0, 1.5, 2.5, 4 e 7
range(eData$Magnitude)
md = cut(eData$Magnitude, c(0, 1.5, 2.5, 4, 7),
         labels = c("VL", "L", "M", "H"))
levels(md)

# O vetor de magnitude do data frame eData é dividido em quatro categorias, 
# como pontos de limites os valores 0, 1.5, 2.5, 4 e 7
table(md)
md[1:10]

eData$MagnitudeFator = md
class(eData$MagnitudeFator)

# PADRONIZAÇÃO DE DADOS 
# Exemplo 1
# A função scale permite realizar o processo de padronização, tendo como argumento os dados a normalizar
mean(iris$Sepal.Length)
sd(iris$Sepal.Length)

iris_padronizado = as.data.frame(scale(iris[,1:4]))
mean(iris_padronizado$Sepal.Length)
sd(iris_padronizado$Sepal.Length)
