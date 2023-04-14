# Criando e exibindo os elementos de uma matriz qualquer

mat = matrix(1:20, 4, 5)
mat

# CBIND e RBIND = permitem definir matrizes de outras formas
# CBIND = junta colunas
# RBIND = junta linhas

x = 1:10
m1 <- cbind(x, x^2, x^3)
m1
#Usando RBIND para definir a matriz

rbind(m1, c(20, 40, 60))

# A indexação de elementos na matriz faz-se d uma forma semelhante a dos vetores,
# informando entre colchetes o valor da linha e da coluna, separados por uma vírgula

mat[2,3] #linha 2 / coluna 3

mat[1:2, 4:5] # linha 1 e 2 / coluna 4 e 5

mat[2,] # toda a linha 2

mat [,1] # toda a coluna 1

mat [2:3,] # Todos os elementos das linhas 2 e 3

# IS.MAX = determinar se o objeto é uma matriz
# NROW = numero se linha
# NCOL = numero de colunas
# DIM = retorna um vetor com os dois valores anteriores

dim(mat)

nrow(mat)

ncol(mat)

mat1 = matrix(8:1, 4, 2)
mat1
dim(mat1) = c(2,4)
mat1

#---------------

mean(mat)

sqrt(mat[2:3, 3:4])

cos(pi * mat)

# Definindo um vetor com a soma das linhas de uma matriz

mat
apply(mat, 1, sum) # 1 para linha e 2 para coluna
 
# %*% = Multiplicação de matrizes
A = matrix(1:4, 2, 2)
A
B = matrix(4:1, 2, 2)
B
C = A%*%B
C
A * 3

# T = calcula a matriz transposta de uma matriz
# DET = calcula o determinante de uma matriz
# EIGEN = calcula valores e vetores próprios de uma matriz (o resultado é uma list)
# SOLVE = resolve sistemas de equações lineares, recebendo como argumento a matriz 
# de coeficientes das variáveis de termos independentes

t(C)

det(C)

A = matrix(1:4, 2, 2)
b = c(1,3)
solve(A, b)

#---------------

a = array(1:24, c(4,3,2))
a

#---------------

a[3,2,2] # elemento da linha 2 coluna 2 da segunda dimensao

a[3,2, ] # elemento da linha 3 coluna 2, mostrando das duas dimensoes

a[,,1] # todos os elementos da primeira dimensao

sum(a)

mean(a[1,,]) # media aritmetica dos elementos da linha 1

cos(pi*a[1,,]) # calculos nos elementos do array

# LISTAS
# Objetos tipo LIST constituem estruturas de dados alternativas quando pretendemos
# agrupar variáveis de tipos diferentes num mesmo objeto

auto = list(marca = "ford", modelo = "focus", nportas = 5, velocMax = 210, consumos = c(6, 7.1, 9.3))
auto

# Uma list pode ser indexada de diversas formas
# Usando o [] resulta em uma nova list com campos selecionados
# Indexação com $ seguida do nome do campo permite obter a variável correspondente 
# a esse campo, o qual seria equivalente à indexação com [[ ]] utilizando um índice numérico

auto[2:3]

is.list(auto)

auto[[1]]

auto$marca

auto$consumos[1]

# DATA FRAME
# Constituem tipos especiais de lists em que os componentes são vetores numéricos
# ou fatores, de mesmo comprimento
# Tabelas de dados com vetores numéricos ou de fatores organizados em casa coluna
# da tabela, ou ainda como matrizes especiais

racas = c("bulldog", "rafeiro", "doberman", "rafeiro", "bulldog",
          "rafeiro", "rafeiro", "doberman")
pesos = c(12, 15, 35, 10, 20, 8, 13, 25)
tamanhos = c("medio", "medio", "grande", "pequeno", "grande",
             "pequeno", "medio", "grande")
df = data.frame(racas, tamanhos, pesos)
df

# Podemos realizar o mesmo acesso usando $

df$tamanhos

df$pesos[1:4]

df[2,2]

df[1:3,] # 3 primeiras linhas

df[,2] # elementos da coluna 2

# Selecioando as linhas onde os valores da coluna "racas" sejam igual a "bulldog"

df[df$racas == "bulldog",]

# Selecioando as linhas onde os valores da coluna "racas" sejam igual a "bulldog"
# e "tamanhos" igual a "medio"

df[df$racas == "bulldog" & df$tamanhos == "medio",]

# Gerando um vetor lógico a partir de uma condição específica

vetor = df$pesos > 12
vetor

# Realizando um filtro para listar apenas as linhas onde peso seja maior que 12

df[vetor,]

# O data frame pode ser editado com o uso da função EDIT

df1 = edit(df)
df1

# Criando um novo data frame vazio com a função EDIT

df2 = edit(data.frame())

# IRIS
# 5 componentes = 4 numéricos e 1 fator

data (iris)
dim(iris)

# Utilizando NAMES para listar os campos

names(iris)

# Listar os primeiros elementos do data frame

head(iris) #traz os 6 primeiros elementos

# Selecionando os registros onde o tamanho da sépala seja maior que 7.6

iris[iris$Sepal.Length > 7.6,]

# Utilizando a função table para obter a quantidade de cada espécie

table(iris$Species)

# Obtendo a média aritmética do tamanho da pétala de cada espécie usando TAPPLY

tapply(iris$Petal.Length, iris$Species, mean)

# Uma forma alternativa de realizar a filtragem é usando a função SUBSET
# Antes da linha = linhas / Depois da linha = colunas

subset(iris, subset = iris$Petal.Length > 6.5)

subset(iris, subset = iris$Petal.Width < 0.2, select = c(Species, Petal.Width))

# Implementando o uso da função ATTACH e DETACH
# Não é muito utilizado

attach(iris)
Species[1:3]

detach(iris)
Species

# A função with também permite omitir o símbolo $ e facilitar a notação

with(iris, mean(Petal.Length))

# Adicionando um comentário textual usando COMMENT

comment(df) = "Descrição do conjunto de dados"

# Package DPLYR
# FILTER: Permite selecionar um subconjunto de linhas de um data frame a partir
# de um conjunto de condições definidas sobre seus campos
# SLICE: permite selecionar um subconjunto de linhas de um data frame a partir dos
# seus índices numéricos
# ARRANGE: reordena linhas de acordo com determinados campos
# SELECT: seleciona colunas de um data frame
# RENAME: Renomear campos do data frame
# MUTATE: permite adicionar novos campos a um data frame
# SAMPLE_N: seleciona linhas do data frame de forma aleatória

install.packages("dplyr")

library(dplyr)
filter(df, tamanhos == "medio", pesos < 15)

# Aplicando as funções do package dplyr em um data frame

slice(df, 1:2)

# Criando um data frame

racas = c("bulldog", "rafeiro", "doberman", "rafeiro", "bulldog",
          "rafeiro", "rafeiro", "doberman")
pesos = c(12, 15, 35, 10, 20, 8, 13, 25)
tamanhos = c("medio", "medio", "grande", "pequeno", "grande",
             "pequeno", "medio", "grande")
df = data.frame(racas, tamanhos, pesos)
df

# Aplicando o package dplyr
library(dplyr)


arrange(df, desc(pesos))

#Selecionando as tuplas do data frame que eu quero utilizar
#Similar ao SELECT

select(df, racas, pesos)

# Renomear os nomes

rename(df, Pesos = pesos)

mutate(df, pesogr = pesos * 1000)

# DATA E HORA

# Obtendo uma variável através da transformação de uma string usando as.Date

dia = as.Date("2021-07-19")
dia

# Formando datas por meio da função s.Date, formato é passado como parametro

dia = as.Date('19/07/2021', format = '%d/%m/%Y')
dia

# A função Sys.time permite obter a data atual

hoje = Sys.time()
dataHoje = as.Date(hoje)
dataHoje
hoje

# A função weekdays retorna o dia da semana de uma data
# A função months retorna mês associado a uma data
weekdays(dataHoje)
months(dia)

# Função Date utilizada para cálculos numéricos

dataHoje - dia

# Convertendo as estruturas colocando AS e o que quer converter depois
# as.vector = converter em vetor
# as.numeric = converter em numericos
# as.data.frame = converter em data frame
# as.matrix = converter em matrix