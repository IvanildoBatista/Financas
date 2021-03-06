## Curso Financial Risk Management with R - Semana 1

## Retrieving Data from FRED
# O objetivo dessa aula � extrair dados do FRED, que uma base de dados do FED (conjunto
# de banco que orientam a pol�tica monet�ria americana). Essa base de dados compreende 
#dados macroecon�micos (como PIB, oferta de monet�ria, infla��o, etc), dados setorias,
#dados populacionais e de outros tipos


#Iniciarei instalando a biblioteca QUANTMOD, para extrair esses dados
install.packages('quantmod')

#Agora irei aplicar a biblioteca
library(quantmod)

#�ndice WILLSHIRE 5000 TOTAL MARKET INDEX

#Irei extrair os dados desse �ndice que representa um portf�lio que investe em todas
#as a��es negociadas no mercado de a��es dos Estados Unidos da Am�rica. Os dados dessa
#s�rie s�o di�rios e v�o dos anos de 1971 at� 2017.

#importando os dados com a biblioteca QUANTMOD
wilsh = getSymbols("WILL5000IND", src = "FRED", auto.assign = FALSE)

#Visualizando a s�rie
wilsh

#Visualizando de outra forma
View(wilsh)

#A s�rie de dados pode apresentar dados faltantes, principalmente por ter per�odos que
#n�o foram computados, que s�o os casos de s�bados e domingos. Por isso os dados do 
#tipo NA ser�o removidos:
wilsh = na.omit(wilsh)

#Irei selecionar os dados para que estejam de 31 de Dezembro de 1971 at� 31 de Dezem-
#bro de 2017
wilsh = wilsh['1979-12-31/2017-12-31']

#Renomeando a vari�vel
names(wilsh) = "TR"

#Visualizando as primeiras linhas
head(wilsh)

#Visualizando as �ltimas linhas
tail(wilsh)

#Irei agora plotar o gr�fico com a s�rie do �ndice
plot(wilsh)