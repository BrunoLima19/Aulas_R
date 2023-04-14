# PROGRAMAÇÃO EM R

# O R permite definir novas funções que poderão ser utilizadas da mesma forma que as predefinidas
# Function: Tipo de objeto em R 

"quadrado" <- function(x) x ^ 2
quadrado(3)

# Definidas na linha de comando ou no arquivo texto externo e carregado no R pela função SOURCE
# source(nome do arquivo)

# Criando a function
"cubo" = function(x)
{
  x ^ 3
}
# Executando
cubo(9)

# Criando a function
"volume.esfera" = function(r)
{
  res = 4/3 * pi * cubo(r)
  res
}
# Executando
volume.esfera(2)

# Usando a estrutura IF
# if(condicao)
# else
"menor.dois" = function (val1, val2)
{
  if(val1 < val2) res = val1
  else res = val2
  res
}
menor.dois(8,6)

"valor.absoluto" = function(val)
{
  if(val > 0) res = val
  else res = -val
  res
}
valor.absoluto(-13)

# Usando a estrutura FOR

a = vector()
for (i in 1:20) a[i] = 2 * i
a

"soma.vetor" = function(vetor){
  s = 0
  for (i in 1:length(vetor))
    s = s + vetor[i]
  s
}

soma.vetor(a)

"soma.vetor_1" = function(vetor)
{
  s = 0
  for (i in vetor)
    s = s + i
  s
}
soma.vetor_1(a)

"media.colunas" = function(matriz)
{
  v = vector()
  for(i in 1:ncol(matriz))
    v[i] = mean(matriz[,i])
  v
}
mat = matrix(1:20, 4, 5)
mat
media.colunas(mat)

# Uso do WHILE

# O vetor é percorrido até que seja econtrado um determinado elemento (valor)
# Assim que encontrado, o WHILE é interrompido

"encontrar.elemento" = function(vetor, valor){
  encontrou = FALSE
  i = 1
  while (encontrou == FALSE && i <= length(vetor)){
    if(vetor[i] == valor)
      encontrou = TRUE
    else i = i + 1
  }
  encontrou
}
encontrar.elemento(a, 4) # TRUE
encontrar.elemento(a, 7) # FALSE


