## Aula 4 - Semana 2

#Usando simulação para estimar o VaR e o ES

#Para estimar o quantil alpha de uma distribuição podemos simular alguns dados dessa
#distribuição e tomar o quantil alpha dos dados simulados.

#O VaR é o quantil alpha de uma distribuição, então este método de simulação deve
#funcionar. Vamos supor que queremos calcular o VaR no intervalo de confiança de 95%.
#Digamos que o retorno vem de uma distribuição normal (nossa hipótese até agora).
#Pode-se simular um amostra de 10.000 resultados da distribuição normal e quinto
#percentil dos dados simulados é uma estimativa do VaR.

#Uma vez que tenha-se estimado o VaR usamos dados simulados, também pode-se encontrar
#o déficit esperado com bastante facilidade. Pega-se os dados simulados e matenhamos
#apenas os resultados que são os piores do que o VaR estimado; e a média deles é uma 
#estimativa do déficit esperado. Se o tamanho amostral da simulação aumentar, essas 
#duas estimativas devem ser muito próximas dos valores reais. O método de simulação
#é uma boa maneira de verificar nossas fórmulasquanto ao valor em risco e ao déficit
#esperado.

#Vamos desenhar uma amostra com 100.000 resultados da distribuição normal, com média
#mu e desvio padrão sig. O VaR é o quantil alpha desses 100.000 resultados e o ES é a
#média dos resultados que são piores do que o VaR ou pior 100.000 x alpha resultados.

#Vamos realizar os mesmos procedimentos das aulas anteriores

install.packages('quantmod')
library(quantmod)
wilsh = getSymbols("WILL5000IND", src = "FRED", auto.assign = FALSE)
wilsh = na.omit(wilsh)
wilsh = wilsh['1979-12-31/2017-12-31']
names(wilsh) = "TR"

#criando os retornos diários
logret = apply.daily(wilsh,sum)

#média amostral
mu = round(mean(logret),8)
mu

#desvio padrão amostral
sig = round(sd(logret),8)
sig

#SIMULAÇÃO COM BASE NA DISTRIBUIÇÃO NORMAL
alpha = 0.05
set.seed(123789)
rvec1 = rnorm(100000,mu,sig)
VaR1 = quantile(rvec1, alpha)
ES1=mean(rvec1[rvec1<VaR1])

VaR1

ES1

#SIMULAÇÃO COM BASE NA DISTRIBUIÇÃO DOS DADOS
#(sem supor normalidade nos dados)
alpha = 0.05
set.seed(123789)
rvec2 = sample(as.vector(logret),100000,replace = TRUE)
VaR2 = quantile(rvec2, alpha)
ES2=mean(rvec2[rvec2<VaR2])

VaR2

ES2

#Distribuição dos dados

hist(rvec1)
hist(rvec2)