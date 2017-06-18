# Trabalho 3 - componentes fortes

A implementação usa o algoritimo de Kosaraju

Definição: Vertices v e w são considerados fortementes conectados se
existe um caminho direto de v para w **e** um caminho direto de w para v.

Conectividade forte é considerado uma realção de equivalencia:
* v é fortemente conectado a v.
* se v é fortemente conectado para w, entao w é fortemente conectado em v.
* se v é fortemente conectado para w, e w para x, entao v é é fortemente conectado para x.

Grafo transposto: componentes fortes em *G* são os mesmos em *Gr (transposto)*


## implementação

O parser utilizado foi o mesmo do segundo trabalho com algumas modificacoes.
Ao executar, ele armazena o grafo original e o transposto em variaveis.
Após fazer o parse do grafo, é executado uma busca em profundidade no grafo transposto, em pós ordem.
Para cada nodo da busca não visitado executamos uma recursão para visitar os nodos adjacentes.
Durante a recursão os componentes fortes são salvos em uma variavel e usada como argumento para escrever o arquivo de resultado.


## Execução
Basta executar o executavel 'componentes-fortes' com o arquivo dot.
Por exemplo: ./componentes-fortes sample.dot
O resultado estará no arquivo resultado.dot
