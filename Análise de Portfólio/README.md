# Análise de portfólios com *Python*

Quando falamos de investimento, falamos de uma alocação e aplicação de recursos, tempo e esforço para que algo seja obtido em retorno. Em finanças o retorno nada mais é do que 
mais dinheiro, ou seja, dinheiro gera mais dinheiro. Uma das formas mais comuns, porém complexas, de investimento é aquele aplicado no mercado financeiro, onde o dinheiro é 
aplicado em ativos de empresas listas na Bolsa de Valores (como ações, dívida de empresas, fundos, etc.). Quando se aplica dinheiro nesse mercado, geralmente, investe-se em várias
empresas e esse conjunto dar-se o nome de carteira ou portfólio.

Um porfólio pode conter ações, títulos de renda, moeda e outros produtos financeiros. A ideia dessa ferramenta financeira é obter um investimento que traga um retorno com o menor
risco possível. Por exemplo, se um investidor aplica seu dinheiro em ações de uma empresa de um setor da economia e por algum motivo (geralmente recessões) esse setor tem um 
desempenho ruim, essa empresa em que foi aplicado o terá uma queda nos preços de suas ações, gerando um prejuízo para quem investiu nela. Então entra a ideia da carteira ou 
portfólio: ao invés de investir em apenas um ativo e ter uma alta probabilidade de fracasso, investi-se em vários ativos e caso um ativo tenha um baixo retorno e uma perda alta, 
os outros ativos poderão absorver ou anular essa perda. Em utras palavras, tenta-se otimizar a taxa global de retorno.

**OBS**: Risco em finanças seria a possibilidade de um investimento dar um retorno abaixo do esperado ou de se perder tudo que foi investido.

Em tese não é tão trivial identificar os melhores ativos e sua melhores combinações para obter um portfólio ótimo, pois é necessário analisar o mercado, setores, empresas, qual o
retorno esperado, quais os melhores ativos, em quanto tempo se deseja reaver o investimento, se é um investimento que foca em dividendos ou na venda futura, a situação 
macroeconômica, etc. Não existem limites de ativos de uma carteira, mas, geralmente, aconselha-se que uma carteira tenha de 10 a 15 ativos.

Aqui nesse projeto irei aplicar alguns métodos de finanças em *Python* para identificar a carteira ótima para um conjunto de ações de empresas brasileiras listadas na Bolsa 
Brasileira (BOVESPA) e essas empresas compõem o Índice BOVESPA (ou iBOVESPA). São grandes empresas de alguns setores da economia brasileira. Analisarei os preços de fechamento
ajustado diários a partir do ano de 2013.

## Etapas

1) Importação dos dados;

2) Gerando as taxas de retorno de cada ação;

3) Análise de risco da carteira;

4) Fronteira Eficiente de *Markowitz*;

5) Modelo *CAPM*;

6) Índice de *Sharpe*;

7) Conclusão.






