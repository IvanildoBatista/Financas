#Aula 3 - Semana 2

## Expected Shortfall: Cálculo do déficit esperado é o retorno esperado dado que o
#retorno é pior do que o VaR associado. Expected Shortfall é a média de todos os retornos
#que são piores do que o VaR, que nosso exemplo das aulas anteriores, de menos de 1.7%
#(-0.017 com nível de significância de 95%). Em outras palavras, se o resultado fosse
#pior que -1,7%, o déficit esperado é a perda esperada.

#Outros nomes: cVaR, AVar ou perda residual esperada.

#Para calcular o Expected Shortfall, primeiramente, irei realizar os passos das aulas
#anteriores:

install.packages('quantmod')
library(quantmod)
wilsh = getSymbols("WILL5000IND", src = "FRED", auto.assign = FALSE)
wilsh = na.omit(wilsh)
wilsh = wilsh['1979-12-31/2017-12-31']
names(wilsh) = "TR"

#criando os retornos diários
logret = apply.daily(wilsh,sum)

#Conforme aula anterior estamos assumindo que logret possui uma distribuição normal
#agora vamos calcular a média e o desvio padrão amostral.

#média amostral
mu = round(mean(logret),8)
mu

#desvio padrão amostral
sig = round(sd(logret),8)
sig

#Calculando o Expected Shortfall

mu-sig*dnorm(qnorm(0.05,0,1),0,1)/0.05

#Se o retorno do log for pior do que o VaR, então a perda média será o valor do ES.