# Nome: Bruno Danny Lima
# Código: 22695
# Curso: Ciências da Computação

# ------------ RESPOSTAS DO EXERCÍCIO 02 ------------

# Exercício 01
#A
mat = matrix(1:6, 2, 3)
mat
#B
mat[2,]
mat[,3]
#C
dim(mat)
#D
sum(mat)
#E
sum(mat[1,])
#F
vet = c(mean(mat[,1]), mean(mat[,2]), mean(mat[,3]))
vet

# Exercício 02
#A
vet = c(1:100)
vet
#B
mat = matrix(vet, 10, 10)
mat

# Exercício 03
#A
exe3 = array(1:30, c(2,5,3))
exe3
#B
sum(exe3[,,3])
#C
mean(exe3[1,1,])
#D
(exe3 * 2) + 3

# Exercício 04
#A
matA = matrix(1:1, 2, 3)
matA
matB = matrix(1:6, 2, 3)
matB
#B
soma = matA + matB
soma
#C
dim(matB) = c(3, 2)
matB
#D
mult = matA %*% matB
mult

# Exercício 05
#A
L = list(nome = "João", idade = 30)
L
#B
L$nome
L[[1]]
L$idade
L[[2]]

# Exercício 06
#A
data(pressure)
pressure
#B
mean(pressure$pressure)
#C
pressure[pressure$temperature == 320, 2]
#D
max(pressure[pressure$temperature < 100, 2])
#E
pressure[pressure$pressure < 100,]

# Exercício 07
#A
sleep
class(sleep)
mapply(class,sleep)
#B
tapply(sleep$extra, sleep$group, mean)