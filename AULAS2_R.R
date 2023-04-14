a = 2 + 3
a

b = 3 * 1 / 2
b

c = 5.3 - 4.2 / 2.3
c

#-----------------------

y = 3.1
z = 6.2
y / z

w = y * z + 2
w

#-----------------------
  
y = 5
y ^ 2

y %% 2

y %% 2

#-----------------------

# Função C permite juntar (concatenar) um vetor com novos elementos
v1 = c(1,5,8,10)
v1

v2 = c(3,v1)
v2

# Outra maneira é criar vetores é utilizando o ':' que gera um vetor com todos 
# os números inteiros entre o valor da esquerda e o da direira
1:10
10:2

# Ainda é possível gerar sequências usando a função 'seq'
# FROM: valor inicial / TO: valor final / BY: intervalo entre os elementos
seq(1,2,0.1)

# Podemos escrever explicitamente
seq(by = 0.1, to = 2, from = 1)

# Podemos omitir argumentos, desde que tenham um valor padrão
# O valor BY foi omitido, assumindo assim o valor 1 como padrão
seq(1,10)

# A função 'REP' permite criar vetores com repetição de elementos
# EACH = Número de vezes que o elemento foi repetido
# TIMES = Número total de repetições
x = c(2, 4, 6)
rep(x, times = 5)

rep(x, each = 5)

# Criar um vetor usando a função 'VETOR'
# mode (numeric, logical ou strings), e o tamanho (lenght)
v = vector(mode = "numeric", length = 10)
v

# Fazendo uso da função 'RUNIF'
x = runif(10)
x

y = runif(10, 5, 10)
y

# Realizando operações aritmétricas
x = 1 : 10
2 * x + 1

x / 2

x - 5

# Cada elemento do vetor 'VM' será usado duas vezes
# Cada elemento de 'VN' é utilizado apenas uma vez
vm = 1:3
vn = 1:10
vm + vn

# Consultar o nome do vetor escrevendo 'NOME DO VETOR'
# Índices entre colchetes
x
x[2]

# A indexação pode ser feita usando um vetor como índice
v1 = c(1,5,8,10) # vetor inicial
indice = 2:3     # vetor índice
v1[indice]

# Se os índices forem negativos, significa são selecionados os
# valores (sem índice)
v1[-2]
v1[-(2:3)]

# É possível atribuir um nome para cada uma das posições do vetor e depois usar 
# para acessar os valores
v1 = c(1,5,8,10)
names(v1) = c("azul", "amarelo", "verde", "vermelho")
v1

# Acessando os vetores
v1 ["verde"]

v1 [c("amarelo", "vermelho")]

# Funções que manipulam vetores numéricos
# ABS = Valor absoluto
# SQRT = raiz quadrada
# SIN = seno
# COS = cosseno
# TAN = tangente
# ROUND = Arredondar um valor para um determinado número de casas decimais
v = c(-1, 2, 3, -4)

abs(v)

sqrt(abs(v))

sin(pi / 2 * v)

#-----------------------

nr = c(1.23, 2.321, 4.07654, 3.245)
round(nr, 1)

p10 = c(10, 100, 1000, 10000)
log10(p10)

# A função MAPPLY aplica qualquer função (ou operador aritmético), ou definida
# pelo analísta, a todos os elementos de um vetor, recebendo como argumentos
# o nome da funçao e o vetor
mapply(sqrt, abs(v))

mapply("/", p10, 10)

# Índice = posição
# SORT = ordena o vetor em ordem crescente ou decrescente
# ORDER = retorna a ordem dos elementos do vetor (pelos seus índices)
# UNIQUE =  retorna um vetor apenas com os elementos únicos (sem elementos repetidos)
# REV = retorna o inverso de um vetor
# CUMSUM = retorna a soma cumulativa de um vetor
# CUMPROD = retorna o produto cumulativo de um valor
# DIFF = retorna o um vetor com as primeiras diferenças do original
v = c(2,4,7,6,3,1)

rev(v)

sort(v)

sort(v, decreasing = TRUE)

order(v)

v[order(v)]

unique(c(1,2,1,2,3))

#-----------------------

v = c(2, 4, 7, 6, 3, 1)

cumsum(v)

# 2 = 2
# 6 = 2 + 4
# 13 = 2 + 4 + 7
# 19 = 2 + 4 + 7 + 6
# 22 = 2 + 4 + 7 + 6 + 3
# 23 = 2 + 4 + 7 + 6 + 3 + 1

cumprod(v)

# 2 = 2
# 8 = 2 * 4
# 56 = 2 * 4 * 7
# 336 = 2 * 4 * 7 * 6
# 1008 = 2 * 4 * 7 * 6 * 3
# 1002 = 2 * 4 * 7 * 6 * 3 * 1

diff(v)

# 4 - 2
# 7 - 4
# 7 - 6
# 6 - 3
# 1 - 3

# Outros conjuntos de funções:
# LENGHT = número de elementos (comprimento) do vetor
# MIN = menor valor
# MAX = maior valor
# WHICH.MIN = índice do menor valor
# WHICH.MAX = índice do maior valor
# SUM = soma dos elementos do vetor
# MEAN = média dos elementos do vetor
# RANGE = menor e maior valor juntos

vs = c(3,5,7,9)

sum(vs)

mean(vs)

min(vs)

max(vs)

which.max(vs)

which.min(vs)

range(vs)

# TYPEOF = obter o tipo de dados existentes num dado vetor

typeof(vs)

# CLASS = Usada para obter o tipo de objeto atual
class(vs)

#-----------------------

# Trabalhando com números complexos, especificando o componente imaginário 
# através de um valor numérico e do simbolo i

vc = c(2 + 3i, 4 - 21, 3i, 4)

sum(vc)

mean(vc)

# Raiz quadrada de números negativos

vc = c(4, -4)

sqrt(vc)

vc = c(4, -4 + 0i)

sqrt(vc)

# Usando vetores lógicos (com variáveis booleanas ou lógicas) TRUE e FALSE

vb1 = c(TRUE, TRUE, FALSE, TRUE, FALSE)

vb1

vb1[3]

# Criar um vetor lógico a partir de um vetor numérico, aplicando cada elemento
# uma condição que define se o valor a colocar nessa posição é TRUE ou FALSE

v = 1:10
vb2 = v > 5
vb2

# É possível utilizar >, <, >=, <=
# Igualdade representa == e desigualdade !=
# %in% = verifica se um determinado valor pertence ao conjunto
# ! = negação
# & = conjunção
# | = disjunção
# ALL = retorna TRUE quando todos os elementos forem TRUE
# ANY = retorna TRUE quando pelo menos um dos elementos for TRUE

vb2 | vb1

vb1 & !vb2

all(vb1)

any(vb1)

which(vb1) # índice dos elementos TRUE

#-----------------------

ve = 8:2
ve

vb = ve > 5
vb

ve[vb]

ve[ve<6]

# Permite armazenar, em casa posição, sequências de caracteres, também
# designados por strings

cores = c("azul", "amarelo", "verde", "vermelho")

cores[3]

muitascores = rep(cores, 2)

muitascores

muitascores[1] == muitascores[5]

# Funções para trabalhar com strings:
# NCHAR = retorna o número de caracteres de uma string
# PASTE = concatena os valores de dois vetores de string
# SUBSTR = permite extrair uma substring de uma string, permitindo, retirar prefixos e sufixos
# TOUPPER/TOLOWER = convertem uma string para maíusculas e minúsculas
# GREP = permite procutar padrões em strings
# SUB/GSUB = permitem procurar e substituir padrões em strings
# CHARTR = permite substituir em paralelo um conjunto de caracteres por outro
# STRSPLIT = "parte" a string original em várias strings, de acordo com um separador

nome = "geraldo"
apelido = "neto"
toupper(nome)

paste(nome, apelido)

substr(apelido, 2, 4)

#-----------------------

nchar(nome)

sub("do", "da", nome)

str = "abracadabra"
gsub("a", "x", str)

chartr("abc", "ABC", str)

# Comportamento das funções que manipulam strings

x = "isto é um teste"
strsplit(x, " ")

# Manipulando vetores de strings com funções apropriadas

nomes = c("joão", "joaquim", "jose")
apelidos = c("pereira", "martins")
paste(nomes, apelidos, sep = " ")

toupper(nomes)

# Manipulando vetores de strings com funções apropriada

mapply(nchar, nomes)

sub("j", "J", nomes)

grep("abra", c("cabra", "braga", "abracadabra"))

# Constantes predefinidas que armazenam o conjunto de letras maiusculas e minusculas

letters

LETTERS

# Manipulando dados com FATORES (fator)

racas = c("bulldog", "rafeiro", "doberman", "rafeiro", "bulldog", "rafeiro", "rafeiro", "doberman")

fr = factor(racas)

fr 

levels(fr) # Separa os tipos de categorias do vetor

table(fr) # Cria uma tabela de frequências de cada uma das categorias presentes no vetor

# Agora usando o TAPPLY

pesos = c(12, 15, 25, 10, 20, 8, 13, 25)
tapply(pesos, fr, mean) # pesos = vetor / fr = fator / mean = média

# Uso da função ORDERED
# Utilizada para criar um objeto do tipo fator, em que os níveis (levels) são inseridos por uma ordem definida pelo analista

tamanhos = c("medio", "medio", "grande", "pequeno", "grande", "pequeno", "medio", "grande")
of = ordered(tamanhos, c("pequeno", "medio", "grande"))
of

# Agora usando o TAPPLY

tapply(pesos, of, range)

# VALORES AUSENTES (slide 80)
# NA (Not Available) = valor não conhecido
# IS.NA = retorna um vetor lógico que tem um valor TRUE nas posições onde o vetor original não pe conhecido
# IS.NAN = o contrário da de cima
# NaN (Not a Number) = usado para representar situações de erro em alguns tipos de cálculo
# INF = representa um valor infinito
# INF - INF = NaN

v = c(NA, 2, 3, NA, 5)
v

v[is.na(v)]

v[!is.na(v)]
