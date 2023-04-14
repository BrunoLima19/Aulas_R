# Nome: Bruno Danny Lima
# Código: 22695
# Curso: Ciências da Computação

# ------------ RESPOSTAS DO EXERCÍCIO 01 ------------

# Exercício 01
x = 20
y = 10
 
soma = x + y
subtração = x - y
multiplicação = x * y
div = x / y
div_inteira = x %/% y
resto_div = x %% y

# Exercício 02
x = pi / 6 

sin(x)
cos(x)
tan(x)

#Exercício 03
#A
v = seq(1, 39, 2)
v
#B
sum(v)
#C
m = seq(0, 39, 3)
m
#D
div = m / 3
div

# Exercício 04
v = seq(0, 999, 2)
sum(v)

# Exercício 05
v = c(1:20)
sqrt(v)

# Exercício 06
#A
p = c(0:20)
#B
p_inv = mapply('+', p, rev(p))
p_inv
#C
p_result = mapply('+', p, 3)
p_result
#D
p_div = mapply('/', 1, p)
p_div

# Exercício 07
#A
cor1 = "azul"
cor1
#B
cor2 = "amarelo"
cor2
#c
paste(cor1, cor2)

# Exercício 08
teste = "bruno"
chartr("b", "B", teste)

# Exercício 09
nmr = c(1,2,3)
nome = c("Bruno", "Vinicius", "Joao")
notas = c(10,8,5)
paste(nmr, nome, nota, sep =" - ")

# Exercicio 10
#A
vtotal = c(60, 55, 38, 87, 65, 63, 43, 44, 45, 50, 78, 67)
sum(vtotal)
#B
min(vtotal)
max(vtotal)
names(vtotal) = c("Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho",
                  "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro")
vtotal [c("Março", "Abril")]
#C
acima_media = vtotal > mean(vtotal)
acima_media
porcent = vtotal / sum(vtotal)
porcent

# Exercício 11
#A
notas = round(runif(100) * 100)
#B
nivel = rep("", 100) # REP = criar um vetor com elementos vazios
nivel[which(notas < 20)] = "Mau"
nivel[which(notas >= 20 & notas < 50)] = "Insuficiente"
nivel[which(notas >= 50 & notas < 80)] = "Bom"
nivel[which(notas >= 80)] = "Muito Bom"
nivel
#C
table(nivel)
