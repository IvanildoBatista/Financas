#Curso Financial Risk Management with R - Semana 2

#Distribution of Returns (AUla 1)

#Nessa aula foi discutido sobre a distribui��o normal, que seria a distribui��o ideal
#para os retornos analisados. 

#A distribui��o normal possui como par�metrs a m�dia e o desvio padr�o, � a mais
#conhecidas das distribui��es e em condi��es apropriadas, o Teoremoa do Limite Central
#diz que o somat�rio de n�meros aleat�rios pode ser aproximado para uma distribui��o
#normal.

#Se os retornos s�o normalmente distribu�dos, o valor em risco e a queda curta espera-
#da s�o facilmente calculados, mas caso n�o possuam um comportamento normal o c�lculo
#do valor em risco e da queda curta esperada s�o mais dif�ceis de de obter.

#Tamb�m foi tratado sobre a distribui��o normal padr�o, que possui m�dia zero e desvio
#padr�o igual a um (x ~ N(0,1)).

#Realizando os procedimentos das aulas anteriores:

install.packages('quantmod')
library(quantmod)
wilsh = getSymbols("WILL5000IND", src = "FRED", auto.assign = FALSE)
wilsh = na.omit(wilsh)
wilsh = wilsh['1979-12-31/2017-12-31']
names(wilsh) = "TR"

#criando os retornos di�rios
logret = apply.daily(wilsh,sum)

#Assumindo que a vari�vel logret possui uma distribui��o normal, abaixo iremos estimar 
#a m�dia e o desvio padr�o com base nas amostras:

#m�dia amostral
round(mean(logret),8)

#desvio padr�o amostral
round(sd(logret),8)