#Financial Risk Management with R

#Calculating Longer Returns (Aula 3)

#Nessa aula foi ensinado sobre o cálculo de retornos para períodos maiores que 1 dia.
#Esse período para calcular o retorno pode ser 2 dias, 3 dias, uma semana, um mês, um
#ano, etc.

#Primeiramente irei fazer o que foi feito nas aulas passadas:

install.packages('quantmod')
library(quantmod)
wilsh = getSymbols("WILL5000IND", src = "FRED", auto.assign = FALSE)
wilsh = na.omit(wilsh)
wilsh = wilsh['1979-12-31/2017-12-31']
names(wilsh) = "TR"

#Agora irei utilizar algumas funções que permitem criar os retornos em vários períodos:

               #Retornos diários
logret_d = apply.daily(wilsh,sum)
#primeiras 3 linhas
round(head(logret_d,3),6)
#plotando o gráfico de retornos diários
plot(logret_d)

              #Retornos semanais
logret_w = apply.weekly(wilsh,sum)
#primeiras 3 linhas
round(head(logret_w,3),6)
#plotando o gráfico de retornos semanais
plot(logret_w)

              #Retornos mensais
logret_m = apply.monthly(wilsh,sum)
#primeiras 3 linhas
round(head(logret_m,3),6)
#plotando o gráfico de retornos mensais
plot(logret_m)

              #Retornos trimestrais
logret_q = apply.quarterly(wilsh,sum)
#primeiras 3 linhas
round(head(logret_q,3),6)
#plotando o gráfico de retornos mensais
plot(logret_q)

              #Retornos anuais
logret_y = apply.yearly(wilsh,sum)
#primeiras 3 linhas
round(head(logret_y,3),6)
#plotando o gráfico de retornos mensais
plot(logret_y)