# Bruno Danny Lima - 22695
# Vinícius Alexander Moreira Nascimento - 23144


#-------------------------DESÁFIO 01-------------------------


# Exercício 01
x = c(1, 2, 2)
x
y = c(1/2, 1, 1)
y
z = c(1/2, 1, 1)
z
m = matrix(c(x,y,z), 3, 3)
m

# Exercício 02
med = mean(x)
med
mediana = median(x)
mediana

# Exercício 03
cor(x, cumsum(x))

# Exercíco 04
dim(mat)

# Exercíco 05
eigen(m)

# Exercício 06
floor(8.799)
ceiling(8.799)

# Exercício 07
round(8.799, 1)

# Exercício 08
polyroot(x^2 - 9)

# Exercício 09
diff(x)

# Exercício 10
cumsum(z)
cumprod(y)
cummax(x)

# Exercício 11
sd(x)
var(x)

# Exercíio 12
a = c(0, 4, 3)
b = c(8, 1, 5)
c = c(3, 0, 1)
h = matrix(c(a,b,c), 3, 3)
h
apply(h, 1, mean)

# Exercício 13
x = c(3, 8, 1, 2.5)
y = c(8, 0, 2)
union(x, y)
intersect(x, y)
