# Nome: Bruno Danny Lima
# Código: 22695
# Curso: Ciências da Computação

# EXERCÍCIO 01

getwd()

wd = "C:/Users/Bruno/OneDrive/Área de Trabalho/Simulado Prova"

setwd(wd)

arquivo = "C:/Users/Bruno/OneDrive/Área de Trabalho/Simulado Prova/TA_PRECO_MEDICAMENTO.csv"

medicamentos = read.csv(
  file = arquivo,
  sep = ";",
  dec = ",",
  encoding = "latin1"
)

medicamentos

names(medicamentos)

install.packages("lifecycle") # Código que o Geraldo usou para arrumar o problema no dplyr
install.packages("dplyr")
install.packages("magrittr")
library("magrittr")
library(dplyr)

# A 

medicamentos %>% arrange(PF.Sem.Impostos)

# B 

medicamentosAltoCusto = head(
  medicamentos
  %>% arrange(desc(PF.Sem.Impostos))
  %>% distinct(PRODUTO, .keep_all = TRUE),
  n = 15
)
medicamentosAltoCusto

# C

medicamentosAltoCusto$LABORATÓRIO

# D 

medicamentosAltoCusto$CLASSE.TERAPÊUTICA

# E

quantidade = table(medicamentos$LISTA.DE.CONCESSÃO.DE.CRÉDITO.TRIBUTÁRIO..PIS.COFINS.)
quantidade['Positiva'] * 100 / nrow(medicamentos)

# F 

porcentagemTarja = table(medicamentos$TARJA)*100/ nrow(medicamentos)
porcentagemTarja

# G 

pie(porcentagemTarja)

# H 
medicamentosAltoCusto %>% filter(COMERCIALIZAÇÃO.2020 == 'Sim')

# I 
medicamentosAltoCusto %>% filter(RESTRIÇÃO.HOSPITALAR == 'Sim')

# J 
mediaPorLab = tapply(medicamentos$PF.Sem.Impostos,medicamentos$LABORATÓRIO,mean)
barplot(mediaPorLab)



