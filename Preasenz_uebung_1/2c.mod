option solver gurobi;
# import
set produkte1;
set produkte2;
set alleProdukte = produkte1 union produkte2;
set ressourcen;

param deckungsbeitrag{alleProdukte} >= 0;
param verfuegbare_ressourcen{ressourcen} >= 0;
param benoetigte_ressourcen_matrix{alleProdukte, ressourcen} >= 0;
param mindestanzahl >= 0;
param maximalanzahl >= 0;

#dessision variable
var x {p in alleProdukte} >= 0 integer;
#goal
maximize db: sum{p in alleProdukte} deckungsbeitrag[p]*x[p];

# constrains
s.t. flaeche{r in ressourcen}: sum{p in alleProdukte} benoetigte_ressourcen_matrix[p,r] * x[p] <= verfuegbare_ressourcen[r];

s.t. mindest: sum{p in produkte1} x[p] >= sum{p in alleProdukte} x[p] * mindestanzahl;
s.t. maximal: sum{p in produkte1} x[p] <= sum{p in alleProdukte} x[p] * maximalanzahl;