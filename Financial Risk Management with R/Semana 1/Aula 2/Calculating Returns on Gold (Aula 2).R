#Calculating Daily Returns (Aula 2)

#Nessa aula será realizado cálculo de retorno diário do índice WILSHIRE 5000.
# O cálculo de retorno é realizado dividindo o valor atual do índice pelo valor do dia 
# anterior e subtraindo 1 (um).

#Os resultados podem ser negativos e positivos, mas há uma limitação. Os valores
#negativos não podem ser menores que -1 (menos um), ou seja, a variação do valor do 
#índice de um dia para o outro não pode ser menor que -100%, mas os resultados positivos
# da variação podem ultrapassar os 100%. Isso não é uma simétrico, por isso é melhor
#utilizar o logaritmo desse resultado.

#Soma-se 1 ao valor da variação do índice (todos os valores) e depois tiramos o 
#logaritmo (também podemos pegar o logaritmo do dia atual menos o logaritmo do dia 
#anterior) e, por fim, encontramos o valor do retorno invertendo o logaritmo com a fun-
#ção exponencial.

#Antes irei realizar todos os procedimentos da aula anterior.

install.packages('quantmod')
library(quantmod)
wilsh = getSymbols("WILL5000IND", src = "FRED", auto.assign = FALSE)
wilsh = na.omit(wilsh)
wilsh = wilsh['1979-12-31/2017-12-31']
names(wilsh) = "TR"

# Calculando o retorno

logret  = diff(log(wilsh$TR))
head(logret,3)# 3 primeiras observações

sum(is.na(logret)) #pode-se perceber um valor faltante (NA)

##removendo o valor faltante

logret = diff(log(wilsh$TR))[-1]
round(head(logret,3),6)

sum(is.na(logret)) #não há mais o valor faltante (NA)

#Agora vamos encontrar o retorno do logaritmo do retorno

ret = exp(logret) - 1
round(head(ret,3),6)

#Plotando o gráfico dos retornos diários
plot(logret) #retornos logarítmicos
plot(ret)#retornos
