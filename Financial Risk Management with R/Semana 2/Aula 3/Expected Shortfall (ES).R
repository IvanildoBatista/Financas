#Aula 3 - Semana 2

## Expected Shortfall: C�lculo do d�ficit esperado � o retorno esperado dado que o
#retorno � pior do que o VaR associado. Expected Shortfall � a m�dia de todos os retornos
#que s�o piores do que o VaR, que nosso exemplo das aulas anteriores, de menos de 1.7%
#(-0.017 com n�vel de signific�ncia de 95%). Em outras palavras, se o resultado fosse
#pior que -1,7%, o d�ficit esperado � a perda esperada.

#Outros nomes: cVaR, AVar ou perda residual esperada.

#Para calcular o Expected Shortfall, primeiramente, irei realizar os passos das aulas
#anteriores:

install.packages('quantmod')
library(quantmod)
wilsh = getSymbols("WILL5000IND", src = "FRED", auto.assign = FALSE)
wilsh = na.omit(wilsh)
wilsh = wilsh['1979-12-31/2017-12-31']
names(wilsh) = "TR"

#criando os retornos di�rios
logret = apply.daily(wilsh,sum)

#Conforme aula anterior estamos assumindo que logret possui uma distribui��o normal
#agora vamos calcular a m�dia e o desvio padr�o amostral.

#m�dia amostral
mu = round(mean(logret),8)
mu

#desvio padr�o amostral
sig = round(sd(logret),8)
sig

#Calculando o Expected Shortfall

mu-sig*dnorm(qnorm(0.05,0,1),0,1)/0.05

#Se o retorno do log for pior do que o VaR, ent�o a perda m�dia ser� o valor do ES.