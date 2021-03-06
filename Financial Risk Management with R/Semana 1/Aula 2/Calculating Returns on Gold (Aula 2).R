#Calculating Daily Returns (Aula 2)

#Nessa aula ser� realizado c�lculo de retorno di�rio do �ndice WILSHIRE 5000.
# O c�lculo de retorno � realizado dividindo o valor atual do �ndice pelo valor do dia 
# anterior e subtraindo 1 (um).

#Os resultados podem ser negativos e positivos, mas h� uma limita��o. Os valores
#negativos n�o podem ser menores que -1 (menos um), ou seja, a varia��o do valor do 
#�ndice de um dia para o outro n�o pode ser menor que -100%, mas os resultados positivos
# da varia��o podem ultrapassar os 100%. Isso n�o � uma sim�trico, por isso � melhor
#utilizar o logaritmo desse resultado.

#Soma-se 1 ao valor da varia��o do �ndice (todos os valores) e depois tiramos o 
#logaritmo (tamb�m podemos pegar o logaritmo do dia atual menos o logaritmo do dia 
#anterior) e, por fim, encontramos o valor do retorno invertendo o logaritmo com a fun-
#��o exponencial.

#Antes irei realizar todos os procedimentos da aula anterior.

install.packages('quantmod')
library(quantmod)
wilsh = getSymbols("WILL5000IND", src = "FRED", auto.assign = FALSE)
wilsh = na.omit(wilsh)
wilsh = wilsh['1979-12-31/2017-12-31']
names(wilsh) = "TR"

# Calculando o retorno

logret  = diff(log(wilsh$TR))
head(logret,3)# 3 primeiras observa��es

sum(is.na(logret)) #pode-se perceber um valor faltante (NA)

##removendo o valor faltante

logret = diff(log(wilsh$TR))[-1]
round(head(logret,3),6)

sum(is.na(logret)) #n�o h� mais o valor faltante (NA)

#Agora vamos encontrar o retorno do logaritmo do retorno

ret = exp(logret) - 1
round(head(ret,3),6)

#Plotando o gr�fico dos retornos di�rios
plot(logret) #retornos logar�tmicos
plot(ret)#retornos
