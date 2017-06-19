# Trabalho 3 - componentes fortes

A implementação usa o algoritimo de Kosaraju

Definição: Vertices v e w são considerados fortementes conectados se
existe um caminho direto de v para w **e** um caminho direto de w para v.

Conectividade forte é considerado uma realção de equivalencia:
* v é fortemente conectado a v.
* se v é fortemente conectado para w, entao w é fortemente conectado em v.
* se v é fortemente conectado para w, e w para x, entao v é é fortemente conectado para x.

Grafo transposto: Inverter direção dos arcos. Componentes fortes em *G* são os mesmos em *Gr (transposto)*


## Implementação

O parser utilizado foi o mesmo do segundo trabalho com algumas modificacoes.
Ao executar, ele armazena o grafo original e seu transposto em variaveis.
É executado uma busca em profundidade no grafo transposto, empilhando os vértices em pós ordem.
Então, é feita uma busca em profundidade no grafo original, na ordem em que os vértices da busca anterior foram empilhados. 
Essa segunda busca gera os componentes fortes que depois são impressos no arquivo resultado.dot


## Execução
Basta executar o executavel 'fortes' com o arquivo dot.
Por exemplo: ./fortes sample.dot
O resultado estará no arquivo resultado.dot
