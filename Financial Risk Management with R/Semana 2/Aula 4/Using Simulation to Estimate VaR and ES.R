## Aula 4 - Semana 2

#Usando simula��o para estimar o VaR e o ES

#Para estimar o quantil alpha de uma distribui��o podemos simular alguns dados dessa
#distribui��o e tomar o quantil alpha dos dados simulados.

#O VaR � o quantil alpha de uma distribui��o, ent�o este m�todo de simula��o deve
#funcionar. Vamos supor que queremos calcular o VaR no intervalo de confian�a de 95%.
#Digamos que o retorno vem de uma distribui��o normal (nossa hip�tese at� agora).
#Pode-se simular um amostra de 10.000 resultados da distribui��o normal e quinto
#percentil dos dados simulados � uma estimativa do VaR.

#Uma vez que tenha-se estimado o VaR usamos dados simulados, tamb�m pode-se encontrar
#o d�ficit esperado com bastante facilidade. Pega-se os dados simulados e matenhamos
#apenas os resultados que s�o os piores do que o VaR estimado; e a m�dia deles � uma 
#estimativa do d�ficit esperado. Se o tamanho amostral da simula��o aumentar, essas 
#duas estimativas devem ser muito pr�ximas dos valores reais. O m�todo de simula��o
#� uma boa maneira de verificar nossas f�rmulasquanto ao valor em risco e ao d�ficit
#esperado.

#Vamos desenhar uma amostra com 100.000 resultados da distribui��o normal, com m�dia
#mu e desvio padr�o sig. O VaR � o quantil alpha desses 100.000 resultados e o ES � a
#m�dia dos resultados que s�o piores do que o VaR ou pior 100.000 x alpha resultados.

#Vamos realizar os mesmos procedimentos das aulas anteriores

install.packages('quantmod')
library(quantmod)
wilsh = getSymbols("WILL5000IND", src = "FRED", auto.assign = FALSE)
wilsh = na.omit(wilsh)
wilsh = wilsh['1979-12-31/2017-12-31']
names(wilsh) = "TR"

#criando os retornos di�rios
logret = apply.daily(wilsh,sum)

#m�dia amostral
mu = round(mean(logret),8)
mu

#desvio padr�o amostral
sig = round(sd(logret),8)
sig

#SIMULA��O COM BASE NA DISTRIBUI��O NORMAL
alpha = 0.05
set.seed(123789)
rvec1 = rnorm(100000,mu,sig)
VaR1 = quantile(rvec1, alpha)
ES1=mean(rvec1[rvec1<VaR1])

VaR1

ES1

#SIMULA��O COM BASE NA DISTRIBUI��O DOS DADOS
#(sem supor normalidade nos dados)
alpha = 0.05
set.seed(123789)
rvec2 = sample(as.vector(logret),100000,replace = TRUE)
VaR2 = quantile(rvec2, alpha)
ES2=mean(rvec2[rvec2<VaR2])

VaR2

ES2

#Distribui��o dos dados

hist(rvec1)
hist(rvec2)