# VISUALIZAÇÃO GRÁFICA DE DADOS

# A função plot permite criar gráficos de dispersão

x = seq(0.2, 2, 0.01)
f = function(x) (log(x)^2 - x * exp(-x^3))
plot(x, f(x))

# type = tipo do gráfico (linhas = l / pontos = p)
# main = titulo do grafico
# xlab, ylab = legendas dos eixos x, y
# col = cor(es) dos pontos ou linhas
# cex = tamanho dos pontos
# pch = catactere do ponto

# Caso queira desenhar um linha, em vez de representar pontos individuais
plot(x, f(x), type = "l")

# Usando o data frame iris, em que se utiliza o argumento pch
plot(iris$Petal.Length, iris$Petal.Width, pch = 19)

# Definindo as cores dos pontos, juntamente com seu respectivo tamanho
plot(iris$Sepal.Length, iris$Sepal.Width, 
     col = iris$Species,
     pch = 19,
     cex = iris$Sepal.Length * iris$Sepal.Width * 0.1)

# A função curve pode ser usada para representar gráficos de funções de forma simples
curve(cos(x)/sin(x), -2, 2)

# A função pairs permite representar gráficos de dispersão múltiplos entre todos 
# os campos de um data frame, permitindo visualizar as relações entre as variáveis
pairs(iris)

# O R possui alguns packages que permitem a representação de três variáveis, uma
# das hipóteses é o uso do gráfico e dispersão 3D, provenientes do package scatterplod3d
scatterplot3d(iris$Petal.Width,
              iris$Sepal.Length,
              iris$Sepal.Width,
              pch = 19,
              color = as.integer(iris$Species))

install.packages("scatterplot3d")
library("scatterplot3d")

# Levelplots permite representar 3 variáveis num gráfico de duas dimensões, 
# no qual a cor dos pontos pe usada como forma de representar a 3° variável
library(lattice)
levelplot(Petal.Width ~ Sepal.Length * Sepal.Width, iris)

# O uso de outros tipos de gráficos que representam conjuntos de pontos
# com densidade de cores
x <- rnorm(100000)
y = rnorm(100000)
smoothScatter(x, y)
 
# Boxplot da variáveis Magnitude do data frame eData
arquivo = "http://darwin.di.uminho.pt/cursoAnaliseDados/earthquakeData.csv"
download.file(arquivo, destfile = "earthquakes.csv")

eData = read.csv("earthquakes.csv")
boxplot(eData$Magnitude, col = "red")

# Os cálculos abaixo, contemplam o gráfico anterior, permitindo uma melhor
# leitura e interpretação
range(eData$Magnitude)

mean(eData$Magnitude)

mean(eData$Magnitude, trim = 0.1)

median(eData$Magnitude)

quantile(eData$Magnitude, c(0.25, 0.75))

quantile(eData$Magnitude, 0.75) + IQR(eData$Magnitude) * 1.5

quantile(eData$Magnitude, 0.25) - IQR(eData$Magnitude) * 1.5

# Comparando a distribuição do comprimento das pétalas em 3 tipos de flores
boxplot(iris$Petal.Length ~ iris$Species,
        col = "darkgray")

# Aplicando o mesmo conceito, porém, fazendo o USO de um outro conjunto de dados
# nativo do R, o qual se trata da utilização de inseticidas
boxplot(count ~ spray, data = InsectSprays,
        xlab = "Tipo de Insetsida",
        main = "Dados de Inseticidas",
        col = "darkgray")

# Entre mostrar outras aplicações podemos usar boxplots para ilustrar os 
# resultados de uma padronização de valores para um conjunto de variáveis de um df
iris.st = scale(iris[,1:4])
boxplot(iris[,1:4], col = "gray", main = "Antes")
boxplot(iris.st[,1:4], col = "gray", main = "Depois")

# Construindo dois histogramas com um dos campos do data frame iris
data(iris)
hist(iris$Petal.Length, breaks = 30, col = "gray", main = "")
hist(iris$Petal.Length, breaks = 0:7, col = "gray", main = "")

# Calculando a densidade
dens = density(iris$Petal.Length)
hist(iris$Petal.Length, breaks = 10,
     xlim = range(dens$x),
     ylim = c(0, 0.6),
     probability = T,
     col = "gray",
     main = "")
lines(dens, lw = 2)



# Exemplos com conjuntos de dados já explorados
barplot(table(iris$Species), col = "gray")
barplot(tapply(InsectSprays$count, InsectSprays$spray,
               mean),
        col = "darkgray",
        horiz = T)

# Os gráficos do tipo pie chart permitem representar frequências de ocorrência 
# de valores distintos de uma variável nominal
pie(table(iris$Species), col = gray(seq(0.4, 1.0, lenght = 3)))

# Sobreposição de linhas sobre um gráfico
plot(iris$Petal.Length, iris$Petal.Width,
     pch = as.numeric(iris$Species) + 1)
abline(v = median(iris$Petal.Length), lwd = 2)
abline(h = median(iris$Petal.Width), lwd = 2)

# Gráfico com sobreposição de uma legenda
plot(iris$Petal.Length, iris$Petal.Width,
     pch = as.numeric(iris$Species) + 19,
     main = "Largura vs. Comprimento de Petalas",
     ylab = "Largura",
     xlab = "Comprimento")
legend(1.5, 2.2, legend = levels(iris$Species),
       pch = c(20, 21, 22))

# Utilizando os recursos de sobreposição para sobrepor informação sobre mapas
install.packages("maps")
library("maps")
map("world")
points(eData$Lon, eData$Lat, pch = 19)

# FORMANÇÃO E EXPORTAÇÃO DE GRÁFICOS
# Esta definição é efetuada antes de se constuírem os gráficos, determinando
# a sua organização

# A função mtext é utilizada para colocar algum texto acima de cada um dos gráficos individuais
par(mfrow = c(1, 2))

hist(iris$Petal.Length,
     breaks = 10,
     col = "darkgray",
     xlab = "comprimento Petalas",
     main = "")

mtext(text = "a)", side = 3, line = 1)

plot(iris$Petal.Length,
     iris$Petal.Width,
     col = "darkgray",
     pch = 19,
     xlab = "Comprimento",
     ylab = "Largura",
     main = "")
mtext(text = "b)", side = 3, line = 1)

#--------------------
getwd()
setwd('c:/temp')
pdf(file = 'grafico.pdf',
    height = 4,
    width = 8)
par(mfrow = c(1,2))
hist(iris$Petal.Length,
     breaks = 10,
     col = 'darkgray',
     xlab = 'Comprimento Pétalas',
     main = '')
mtext(text = 'a)', side = 3, line = 1)

plot(iris$Petal.Length,
     iris$Petal.Width,
     col = "darkgray",
     pch = 19,
     xlab = "Comprimento",
     ylab = "Largura",
     main = "")
mtext(text = "b)", side = 3, line = 1)
dev.off()
#--------------------

install.packages("ggplot2")
library(ggplot2)
data("mpg")
str(mpg)
qplot(displ, hwy, data = mpg)
qplot(displ, hwy, data = mpg, shape = drv)

qplot(displ, hwy,
      data = mpg,
      geom = c("point", "smooth"))

qplot(hwy, data = mpg)

qplot(hwy,
      data = mpg,
      fill = drv)

qplot(displ, hwy,
      data = mpg,
      facets = . ~ drv)

qplot(hwy,
      data = mpg,
      facets = drv ~.,
      binwidth = 2)

g = ggplot(data = mpg)
g = g + aes(displ, hwy)
g = g + geom_point()
print(g)

g = g + geom_smooth(method = "lm", se = F)
g = g + theme_bw(base_family = "Times")
g = g + labs(x = "Displacement") + labs(y = "Hwy") = labs(title = "MPG")
print(g)
