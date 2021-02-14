#Aula 2 - Semana 2

## Value-At-Risk (VaR): quantia que um portfólio pode perder, com uma dada probabilidade,
#(1-alfa), sobre uma dado período. O valor de alfa pode ser 0.1, 0.05 ou 0.01 e o período
#pode ser de um dia ou de uma semana.

#Se o valor de alfa for de 0.05, então o VaR é o quantil de 5% da função de distribuição
#de probabilidade. Significa que os retornos que estamos analisando estarão 95% das vezes
#acima do quantil 5%, e em 5% das vezes abaixo desse quantil.

#Para calcular o VaR, primeiramente, irei realizar os passos das aulas anteriores:

install.packages('quantmod')
library(quantmod)
wilsh = getSymbols("WILL5000IND", src = "FRED", auto.assign = FALSE)
wilsh = na.omit(wilsh)
wilsh = wilsh['1979-12-31/2017-12-31']
names(wilsh) = "TR"

#criando os retornos diários
logret = apply.daily(wilsh,sum)

#Visualizando os retornos
View(logret)

#Conforme aula anterior estamos assumindo que logret possui uma distribuição normal
#agora vamos calcular a média e o desvio padrão amostral.

#média amostral
mu = round(mean(logret),8)
mu

#desvio padrão amostral
sig = round(sd(logret),8)
sig

#Por fim, irei calcular o VaR
VaR = round(qnorm(0.05,mu,sig),6)
VaR