#Curso Financial Risk Management with R - Semana 2

#Distribution of Returns (AUla 1)

#Nessa aula foi discutido sobre a distribuição normal, que seria a distribuição ideal
#para os retornos analisados. 

#A distribuição normal possui como parâmetrs a média e o desvio padrão, é a mais
#conhecidas das distribuições e em condições apropriadas, o Teoremoa do Limite Central
#diz que o somatório de números aleatórios pode ser aproximado para uma distribuição
#normal.

#Se os retornos são normalmente distribuídos, o valor em risco e a queda curta espera-
#da são facilmente calculados, mas caso não possuam um comportamento normal o cálculo
#do valor em risco e da queda curta esperada são mais difíceis de de obter.

#Também foi tratado sobre a distribuição normal padrão, que possui média zero e desvio
#padrão igual a um (x ~ N(0,1)).

#Realizando os procedimentos das aulas anteriores:

install.packages('quantmod')
library(quantmod)
wilsh = getSymbols("WILL5000IND", src = "FRED", auto.assign = FALSE)
wilsh = na.omit(wilsh)
wilsh = wilsh['1979-12-31/2017-12-31']
names(wilsh) = "TR"

#criando os retornos diários
logret = apply.daily(wilsh,sum)

#Assumindo que a variável logret possui uma distribuição normal, abaixo iremos estimar 
#a média e o desvio padrão com base nas amostras:

#média amostral
round(mean(logret),8)

#desvio padrão amostral
round(sd(logret),8)