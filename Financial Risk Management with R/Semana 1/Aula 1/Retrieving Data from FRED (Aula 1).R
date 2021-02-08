## Curso Financial Risk Management with R - Semana 1

## Retrieving Data from FRED
# O objetivo dessa aula é extrair dados do FRED, que uma base de dados do FED (conjunto
# de banco que orientam a política monetária americana). Essa base de dados compreende 
#dados macroeconômicos (como PIB, oferta de monetária, inflação, etc), dados setorias,
#dados populacionais e de outros tipos


#Iniciarei instalando a biblioteca QUANTMOD, para extrair esses dados
install.packages('quantmod')

#Agora irei aplicar a biblioteca
library(quantmod)

#Índice WILLSHIRE 5000 TOTAL MARKET INDEX

#Irei extrair os dados desse índice que representa um portfólio que investe em todas
#as ações negociadas no mercado de ações dos Estados Unidos da América. Os dados dessa
#série são diários e vão dos anos de 1971 até 2017.

#importando os dados com a biblioteca QUANTMOD
wilsh = getSymbols("WILL5000IND", src = "FRED", auto.assign = FALSE)

#Visualizando a série
wilsh

#Visualizando de outra forma
View(wilsh)

#A série de dados pode apresentar dados faltantes, principalmente por ter períodos que
#não foram computados, que são os casos de sábados e domingos. Por isso os dados do 
#tipo NA serão removidos:
wilsh = na.omit(wilsh)

#Irei selecionar os dados para que estejam de 31 de Dezembro de 1971 até 31 de Dezem-
#bro de 2017
wilsh = wilsh['1979-12-31/2017-12-31']

#Renomeando a variável
names(wilsh) = "TR"

#Visualizando as primeiras linhas
head(wilsh)

#Visualizando as últimas linhas
tail(wilsh)

#Irei agora plotar o gráfico com a série do índice
plot(wilsh)