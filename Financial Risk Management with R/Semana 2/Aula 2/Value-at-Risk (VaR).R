#Aula 2 - Semana 2

## Value-At-Risk (VaR): quantia que um portf�lio pode perder, com uma dada probabilidade,
#(1-alfa), sobre uma dado per�odo. O valor de alfa pode ser 0.1, 0.05 ou 0.01 e o per�odo
#pode ser de um dia ou de uma semana.

#Se o valor de alfa for de 0.05, ent�o o VaR � o quantil de 5% da fun��o de distribui��o
#de probabilidade. Significa que os retornos que estamos analisando estar�o 95% das vezes
#acima do quantil 5%, e em 5% das vezes abaixo desse quantil.

#Para calcular o VaR, primeiramente, irei realizar os passos das aulas anteriores:

install.packages('quantmod')
library(quantmod)
wilsh = getSymbols("WILL5000IND", src = "FRED", auto.assign = FALSE)
wilsh = na.omit(wilsh)
wilsh = wilsh['1979-12-31/2017-12-31']
names(wilsh) = "TR"

#criando os retornos di�rios
logret = apply.daily(wilsh,sum)

#Visualizando os retornos
View(logret)

#Conforme aula anterior estamos assumindo que logret possui uma distribui��o normal
#agora vamos calcular a m�dia e o desvio padr�o amostral.

#m�dia amostral
mu = round(mean(logret),8)
mu

#desvio padr�o amostral
sig = round(sd(logret),8)
sig

#Por fim, irei calcular o VaR
VaR = round(qnorm(0.05,mu,sig),6)
VaR