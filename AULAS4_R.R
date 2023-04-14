# DEFINIÇÃO DO DIRETÓRIO DE TRABALHO

# Pode ser feitas de duas maneiras: RELATIVA e ABSOLUTA

#Usando a função GETWD
getwd()
setwd("C:/Users/Bruno/OneDrive/Documentos/Aula04_R")

# A função SCAN permite permite ler valores diretamente por meio da linha de comandos
# O argumento WHAT pode ser usado para determinar o tipo de dados a ler
# Para ler um vetor de strings, deve usar-se CHARACTER
# O argumento FILE, permite que a leitura seja realizada a partir de um arquivo
# A função READ.TABLE permite ler valores de uma tabela a partir de uma arquivo de texto
# assumnido que cada linha tem o mesmo número de elementos, separados por um simbolo

tabela = read.table("my_table.txt", header=TRUE)
# HEADER indica que a 1° linha contém o nome dos campos

tabela = read.csv("vendas.csv")

# Realizando download de arquivos
fileUrl = "http://archive.ics.uci.edu/ml/machine-learning-databases/ecoli/ecoli.data"
download.file(fileUrl, destfile = "ecoli.csv")

# Lendo o arquivo via função READ.FILE
ecoli = read.table("ecoli.csv")
dim(ecoli)

# Apresentando uma pequena amostra do arquivo ecoli.csv
head(ecoli)

# A função READLINES pode ser utilizada para ler um arquivo texto, retornando um
# vetor de strings que poderá ser posteriormente manipulado/processado
# O package RJONIO permite manipular arquivos/documentos no formato JSON
x <- c(2, 3, 5, 9)
print(x)

options(digits = 5)

# A função cat pode ser utilizada com o mesmo propósito de escrita de dados
cat("Este eh o valor da variavel x: ",x,"\n")

# O cat permite ainda enviar o conteúdo para um arquivo
cat(file = "resultado.txt", "Este eh o valor da variavel x: ",x,"\n")

# Adicionando algum conteúdo ao arquivo, usando APPEND
# Sem o APPEND, o conteúdo novo sobrescreve o antigo
cat(file = "resultado.txt", "Esta linha eh adicionada depois da linha anterior no mesmo arquivo \n", append = TRUE)

# A função WRITE.TABLE pode ser utilizada para armazenar uma tabela
x <- matrix(1:10, ncol = 5)
write.table(x)

write.table(x, file = "tabela.txt")

# Uso do SINK para enviar um arquivo o resultado dos comandos digitais no interpretador
x <- seq(1, 10, 0.1)
sink("saida.txt")
x
x^3
sink()

# Adicionando ao final do arquivo "saida.txt", o resultado do comando cumsum
sink("saida.txt", append = T)
cumsum(x)
sink()

# Utilizando o argumento SPLIT, o qual permite imprimir o resultado dos comandos 
# no display e no arquivo simultaneamente
sink("saida.txt", append = T, split = T)
summary(x)
sink()

# As funções save e load permitem armazenar em arquivo os conteúdos associados a objetos, e carrega-los
x <- -50:50
f <- function(x)if(x<0) 0 else x
save(x, f, file = "dados.Rdata")
load("dados.Rdata")
f(x)

# O package XML pode ser usado para escrever arquivos XML
# O package prettyR inclui funções úteis para escrita de resultados em formato HTLM

