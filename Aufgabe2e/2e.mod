#option solver gurobi;

data 2e.dat

set produkte1;
set produkte2;
set alleProdukte = produkte1 union produkte2;
set ressourcen;

param deckungsbeitrag{alleProdukte} >= 0;
param verfuegbare_ressourcen{ressourcen} >= 0;
param benoetigte_ressourcen{alleProdukte, ressourcen} >= 0;
param mindestanzahl >= 0;
param maximalanzahl >= 0;
param anz_familien{alleProdukte} >=0;

var x {p in alleProdukte} >= 0 integer;
var y1 binary;
var y2 binary;

maximize db: sum{p in alleProdukte} deckungsbeitrag[p]*x[p] -100000*y1+70000*y2;

s.t. flaeche{r in ressourcen}: sum{p in alleProdukte} benoetigte_ressourcen[p,r] * x[p] <= verfuegbare_ressourcen[r];
s.t. mindest: sum{p in produkte1} x[p] >= sum{p in alleProdukte} x[p] * mindestanzahl;
s.t. maximal: sum{p in produkte1} x[p] <= sum{p in alleProdukte} x[p] * maximalanzahl;
s.t. R1: sum{p in alleProdukte} x[p]*anz_familien[p] >= 40*y1;
s.t. R2: sum{p in alleProdukte} x[p]*anz_familien[p] <= 39+100000*y1;
s.t. R3: sum{p in alleProdukte} x[p]*anz_familien[p] >= 50*y2;
s.t. R4: sum{p in alleProdukte} x[p]*anz_familien[p] <= 49+100000*y2;
