# Aula 07
# Instalação do Pacote

install.packages("tidyverse")

# Conjunto de pacotes, os quais destacamos
# GGPLOT2: Visualização de dados
# TIBBLE: Data frame
# TIDYR: Organização de dados
# READR: Leitura de dados
# PURRR: Programação funcional
# DPLYR: Manipilaçao de dados

# Atualizando todos os dados do sistema
library(tidyverse)
tidyverse_update()

# Realizando a leitura do arquivo vendas.csv (com separador ponto e vírgula)
# com a função read.csv(nativa)
dados = read.csv2(file = "C:/Users/Bruno/OneDrive/Documentos/Temp/Dados/vendas.csv")
head(dados) # visualiza as 6 primeiras linhas o objeto

# Outra maneira de fazer
dados1 = readr::read_csv2(file = "C:/Users/Bruno/OneDrive/Documentos/Temp/Dados/vendas.csv")
head(dados1)

# Realizando a leitura do arquivo vendas1.csv
dados2 = read.csv(file = "C:/Users/Bruno/OneDrive/Documentos/Temp/Dados/vendas1.csv")
head(dados2)

# Outra maneira de fazer
dados3 = readr::read_csv(file = "C:/Users/Bruno/OneDrive/Documentos/Temp/Dados/vendas1.csv")
head(dados3)

# Exibindo os dados1 que está no formato tibble
dados1

# Limitando a visualização de apenas 15 linhas
print(dados1, n = 15)

# Ajustando o número de colunas a serem exibidas de acordo com a largura estabelecida
# Consultando a largura do documento
getOption("width")
# [1] 156 (valor obtido)
# Ajustando a largura a ser impressa
print(dados1, width = 35)

# Criando uma tabela de dados com o comando tibble, o procedimento é semelhante
# ao comando data.frame
library(tibble)
#Criando uma tabela com tibble
x1 = tibble(x = 1:3, y = 10:12, c = c("A1", "A2", "A3"))
x1

# Criando uma tabela com data.frame
x2 = data.frame(x = 1:3, y = 10:12, z = c("A1", "A2", "A3"))
x2

# Transformando x2 em tibble
x2 = as_tibble(x2)
is_tibble(x2)

# Verificando os Data Types
is.numeric(dados$valor_compra)

is.numeric(dados1$valor_compra)

is.factor(dados$filial)

is.character(dados$filial)

is.factor(dados1$filial)

is.character(dados1$filial)

# Transformando a variável filial de dados1 de tipo caractere para tipo factor
is.character(dados1$filial)

is.factor(dados$filial)

dados1$filial = as.factor(dados1$filial)
is.character(dados1$filial)

is.factor(dados1$filial)

# Transformando variável caractere em numérica
is.character(dados3$filial)
# Deve-se transformar o caractere para fator primeiro
filial = as.factor(dados3$filial)
filial
is.factor(filial)
# Agora os fatores são transformados em números inteiros de acordo com os niveis dos fatores
filial = as.numeric(filial)
is.numeric(filial)
filial
filial = as.character(filial)
is.character(filial)
filial


# Modo tradicional sem uso do Pipe
summary(dados1)

# Modo Pipe
library(magrittr)
dados1 %>% summary()

# Carregamos o pacote no início do script
library(magrittr)
# Agora aplicamos o procedimento com o pipe
dados1 %>%
  dplyr::select(filial, quinzena) %>%
  dplyr::filter(quinzena == 1)

# Comando encadeado sem o uso do Pipe
dplyr::filter(dplyr::select(dados1, filial, quinzena), quinzena ==1)

# Selecionando as colunas filial, quinzena e valor_compra
library(magrittr)
library(dplyr)

dados1 %>%
  dplyr::select(filial, quinzena, valor_compra)

# Selecionando as colunas quinzena, filial e valor_compra
dados1 %>%
  dplyr::select(quinzena, filial, valor_compra)

# Extraindo a coluna filial de dados1
vetor = dados1 %>% pull(filial)
vetor

# A mesma extração agora utilizando a posição da coluna filial da esquerda para a direita
vetor = dados1 %>% pull(2)
vetor


# INÍCIO CÓDIGO VINÍCIUS ---------------------------------------------


# Exemplo 5
vetor = dados %>% pull(-5)
vetor

# Exemplo 1
library(magrittr)
library(dplyr)
dados %>%
  filter(filial == "A")


# Exemplo 2
dados1 %>%
  filter(filial == "A" | n_itens == 1)

# Exemplo 3
# Filial "B" com quinxena 2
dados1 %>%
  filter(filial == "B" | quinzena == 2)

# TRABALHANDO COM DISTINCT
# Extraindo linhas distintas a partir da coluna filial
# Exemplo 1
library(magrittr)
library(dplyr)
dados1 %>%
  distinct(filial)


# Extraindo as linhas distintas para a coluna n_itens
# Exemplo 2
dados1 %>%
  distinct(n_itens)

# EXemplo 3
# Extraindo as linhas exclusivas a partir de diversas coluna simultaneamente
dados1 %>%
  distinct(filial, quinzena, desconto_perc)


# EXemplo 4
# Extraindo todas as linha do Data.frame
dados1 %>%
  distinct()

# TRABALHANDO COM ARRAGE
# Exemplo 1
# Classisficando os dados de maneira ascendente de nr_itens
library(magrittr)
library(dplyr)
dados1 %>%
  arrange(n_itens)

# Exemplo 2
# Classificando os dados a partir de duas colunas
dados1 %>%
  arrange(-n_itens) %>%
  arrange(filial)

# Exemplo 3
# Classificnado os dados a partir de duas colunas
dados %>%
  arrange(-n_itens, filial)

# Exemplo 4
# Classificando e filtrando dados a partir de um data frame
dados1 %>%
  arrange(n_itens, valor_compra) %>%
  filter(valor_compra > 100) %>%
  select(filial, n_itens, valor_compra)

# Comando mutate permite a criação de uma nova coluna 

# Exemplo 1
# Incluir em dados1 uma nova coluna denominada vmc contenha o valor médio de compra 
# por item
dados1 %>%
  mutate(vmci = valor_compra / n_itens)

# Exemplo 2
# Realizando o arrendondamento para os valores da coluna vmci do dataFrame dados1
dados1 %>%
  mutate(vmci = round(valor_compra / n_itens, 2)) %>%
  select(filial, valor_compra, n_itens, vmci) %>%
  arrange(vmci)

# O comando transmutate realiza o mesmo que o mutade mas não adiciona nova coluna
# Exemplo 3
dados1 %>%
  transmute(vmci = valor_compra / n_itens)

# Exemplo 4
# Selecionando algumas colunas para visualização
dados1 %>%
  transmute(filial, valor_compra, n_itens, vmci = round(valor_compra / n_itens,2))


# FIM CÓDIGO VINÍCIUS ---------------------------------------------


# SUMMARISE ou SIMMARIZE permite responder perguntas sobre os dados através da aplicação
# de funções que resumem as variáveis, possibilitando reduzir tabelas resumidas do BD

# Número de observações
dados1 %>%
  summarise(contagem = n())

# Número de filiais distintas
dados1 %>%
  select(filial) %>%
  summarise(filiais_distintas = n_distinct(filial))

# Obtendo o número de cupons distintos a partir da filial B
dados1 %>%
  select(filial, cupom) %>%
  filter(filial == "B") %>%
  summarise(cupons_distintos = n_distinct(cupom))

# Utilizando o GROUP BY para agrupar os dados

# Obtendo o número de cupons distintos a partir de cada filial
dados1 %>%
  group_by(filial) %>%
  summarize(cumpons_distintos = n_distinct(cupom))

# Obtendo o total de compras por cada filial
dados1 %>%
  group_by(filial) %>%
  summarize(compra_total = sum(valor_compra))

# Obtendo o total de itens vendidos por cada filial
dados1 %>%
  group_by(filial) %>%
  summarize(item_total = sum(n_itens))

# É possível sumarizar as informações de um grupo em mais de uma coluna, dessa forma,
# podemos obter o número de cupons vendidos, o total de itens vendidos e o total do
# valor de compras em cada filial
dados1 %>%
  group_by(filial) %>%
  summarise(
    cupons_distintos = n_distinct(cupom),
    item_total = sum(n_itens),
    compra_total = sum(valor_compra)
  )

# Obtendo a média e o desvio-padrão da coluna valor_compra agrupado por quinzena
dados1 %>%
  group_by(quinzena) %>%
  summarise(media = mean(valor_compra))

# Obtendo a média com arredondamento de 2 casas decimais
dados1 %>%
  group_by(quinzena) %>%
  summarise(media = mean(valor_compra) %>%
    round(2)
  )

# Acrescentando mais uma coluna co o desvio-padrão da valor_compra de cada quinzena
dados1 %>%
  group_by(quinzena) %>%
  summarise(media = mean(valor_compra) %>%
              round(2),
            desv_pad = sd(valor_compra) %>%
              round(2)
  )

# Incluir uma nova coluna no dataframe dados1 com o número de linha
library(magrittr)
library(dplyr)
# Adicionando uma nova coluna com números de 1 a 23
dados1 %>%
  tibble::add_column(adicionada = 1:23)

# Adicionando uma nova coluna antes da coluna 1
dados1 %>%
  tibble::add_column(adicionada = 1>23, .before = 1)

# Adicionando uma nova coluna depois da coluna 2
dados1 %>%
  tibble::add_column(adicionada = 1:23, .after = 2)

# Imagine a necessidade de incluir uma nova linha em dados1 referente
# a outro cupom de número 100 da filial A na 1° linha
dados1 %>%
  tibble::add_row(cupom = 100, filial = "A",
                  valor_compra = 10, n_itens = 1,
                  desconto_perc = 0, quinzena = 1,
                  .before = 1)

# Renomeando a coluna "valor_compra" para "venda"
dados1 %>%
  rename(venda = valor_compra)

# Renomeando várias colunas
dados1 %>%
  rename(x1 = cupom, x2 = filial, x3 = valor_compra)

# Criando duas tabelas intituladas de "x" e "y" a partir do data frame dados1
# para a combinação das tabelas
library(magrittr)
library(dplyr)
# Criando duas tabelas "x" e "y" a partir de dados1
x = dados1 %>% select(cupom, filial, valor_compra)
x
y = dados1 %>% select(cupom, n_itens)
y
# Unindo "x" e "y" pelas colunas
bind_cols(x, y)

library(magrittr)
library(dplyr)
# Criando duas tabelas "x" e "y" a partir de dados1
x = dados1 %>% select(cupom, filial, valor_compra) %>%
  filter(filial == "A")
x
y = dados1 %>% select(cupom, n_itens) %>%
  filter(n_itens ==1)
y

# Unindo x e y pelas linhas
bind_rows(x, y)

# Exemplo 5
# Criando Tabelas 'x' e 'y' a partir do dataFrame dados1
x = dados1 %>% select(cupom, filial, valor_compra)
x

y = dados1 %>% select(cupom, filial, n_itens)
y

# Exemplo 6
# Unindo 'x' e 'y' pela intersecção da coluna chave 
inner_join(x,y)

# Exemplo 7
# Criando duas tabelas 'x' e 'y' a partir do dataFrame dados1
x = dados1 %>% select(cupom, filial, valor_compra) %>%
  filter(valor_compra > 100)
x

y = dados1 %>% select(filial, n_itens) %>%
  filter(n_itens < 8)
y

# Unindo "x" e "y" pela intersecção da coluna chave
inner_join(x, y)

# Unindo "x" e "y" pelas colunas de "x" ("x" a esquerda)
left_join(x, y)

# Unindo "x" e "y" pelas colunas de "y"("y" a direita)
right_join(x, y)

# Unindo "x" e "y" pela uniao da coluna chave
full_join(x, y)

# Exemplo 14
x = dados1 %>% select(cupom, filial, valor_compra) %>%
  filter(valor_compra > 500)
x

y = dados1 %>% select(cupom, filial, valor_compra) %>%
  filter(valor_compra < 700)
y

# Exemplo 15
# Obtendo a intersecção entre 'x' e 'y'
intersect(x,y)

# Obtendo a união
union(x, y)

# Obtendo a diferença entre "x" e "y"
setdiff(x, y)

# Obtendo a diferença entre "y" e "x"
setdiff(y, x)

# Criando "x" essencialmente igual a dados1 e "y" diferente de dados1
x = dados1 %>% filter(valor_compra > 0)
y = dados1 %>% filter(valor_compra > 500)

# Testando se as tabelas são iguais
setequal(x, dados1)
setequal(y, dados1)

# Unindo as colunas "y" e "x"
z = full_join(y, x)
z
setequal(z, dados1)

# Instalando a versão pelo CRAN
install.packages("tidyr")
library(tidyr)

# Tabela inicial de dados
dados_tur = data.frame(
  estado = c("SP", "RS", "RJ"),
  terrestre = c(3900, 2800, 2600),
  aereo = c(4200, 3800, 3950)
)
dados_tur

# Reorganizando a tabela para o formato longo
dados_tur %>%
  pivot_longer(cols = c(terrestre, aereo),
               names_to = "meio",
               values_to = "chegada")

# Tabela inicial de dados
dados_dieta = data.frame(
  paciente = 1.5,
  antes = c(150, 160, 90, 95, 110),
  depois = c(140, 110, 80, 80, 82),
  tempo = c(4, 4, 3, 3, 6),
  sexo = c("homem", "homem", "muher", "mulher", "mulher")
)

dados_dieta
