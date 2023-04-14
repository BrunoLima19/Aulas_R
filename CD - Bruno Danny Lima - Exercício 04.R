# Nome: Bruno Danny Lima
# Código: 22695
# Curso: Ciências da Computação

# ------------ RESPOSTAS DO EXERCÍCIO 04 ------------

# Exercício 01
"conversor" = function(val)
{
  res = val * 5.40
  res
}
conversor(6)

# Exercício 02
"coordenadas" = function(x1, y1, x2, y2)
{
  res = (x1 - x2)^2 + (y2 - y2)^2
  sqrt(res)
}
coordenadas(10, 20, 30, 40)

# Exercício 03
vet = c(1:10)
vet
"vetor.pares" = function(vetor)
{
  s = 0
  for (i in vetor){
    if (i %% 2 == 0)
      s = s + 1
  }
  s
}
vetor.pares(vet)

# Exercício 04
frase = "viva o são paulo"
frase
"manipula.string" = function(string)
{
  gsub("v", "b", paste(string, ", é campeão"))
}
manipula.string(frase)

# Exercício 05
"calculadora" = function(n1, n2, string)
{
  if (string == "+")
    res = n1 + n2
  else if (string == "-")
    res = n1 - n2
  else if (string == "*")
    res = n1 * n2
  else if (string == "/")
    res = n1 / n2
  res
}
calculadora(30, 10, "+")
calculadora(30, 10, "-")
calculadora(30, 10, "*")
calculadora(30, 10, "/")

# Exercício 06
"compara" = function(a, b)
{
  if (a < b)
    res = 1
  else if (a == b)
    res = 0
  else if (a > b)
    res = -1
  res
}
compara(1, 2)
compara(2, 2)
compara(2, 1)

# Exercício 07
vet = c(1:20)
vet
"retorna.media" = function(vetor)
{
  s = 0
  for (i in 1:length(vetor)){
    s = s + vetor[i]
  }
  med = s / length(vetor)
  med
}
retorna.media(vet)

# Exercício 08
vet = c(1, 4, 18, 30, 43, 87, 2, 4, 5, 0, 2.5, 3.5)
vet
"inferior.limite" = function(vetor)
{
  s = 0
  for (i in vetor){
    if (i <= 10) # 10 é o valor limite
      s = s + 1
  }
  s
}
inferior.limite(vet)

# Exercício 09
#A
vet = c(1:10)
vet
"menor.dez" = function(vetor)
{
  crescente = sort(vetor)
  contador = 0
  i = 1 
  continue = TRUE
  while ( continue == TRUE && i < length(crescente)){
    if (crescente[i] >= 10)
      continue = FALSE
    else
      contador = contador + 1
    i = i + 1
  }
  contador
}
menor.dez(vet)
#B
"b" = function(vetor, soma)
{
  vetor = sort(vetor)
  
  conta_elem = 0
  soma_elem = 0
  i = 1
  
  while (i <= length(vetor)){
    if (soma_elem < soma){
      conta_elem = conta_elem + 1
      soma_elem = soma_elem + vetor[i]
    }
    i = i + 1
  }
  conta_elem
}

vetor = c(15, 25, 5, 20, 10)
b(vetor, 30)

# Exercício 10
mat = matrix(1:20, 4, 5)
mat
"maior.matriz" = function(matriz)
{
  m = 0
  for (l in 1:nrow(matriz))
    for (c in 1:ncol(matriz))
      if (matriz[l, c] > m)
        m = matriz[l, c]
  m
}
maior.matriz(mat)

# Exercício 11
mat = matrix(1:9, 3, 3)
mat
"multi.diagonal" = function(matriz)
{
  res = 1
  for (l in 1:nrow(matriz))
    for (c in 1:ncol(matriz))
      if (l == c)
        res = res * matriz[l, c]
  res
}
multi.diagonal(mat)

# Exercício 12
mat1 = matrix(1:9, 3, 3)
mat1
mat2 = matrix(11:19, 3, 3)
mat2
"soma.matriz" = function(matriz1, matriz2)
{
  matriz3 = matriz1 + matriz2
  matriz3
}
soma.matriz(mat1, mat2)
