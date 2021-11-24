/*
set PRODUKT;

# by defailt they are numerated/indexed if you use {}, to use Index you need to use quadratische Kammern z.B.:[i]
param rohstoffe { PRODUKT }; # enumeration 
param produktionszeit { PRODUKT }; # enumeration
param lagerraum { PRODUKT }; # enumeration
param gewinn { PRODUKT }; # enumeration

# import Kapazitätsbeschränkungen
param max_ersatz_r ; 
param max_ersatz_p ;
param max_ersatz_l ;

#decision variable / 
var Select { PRODUKT } binary ; # select project j? (x_j)

#goal
minimize TotalUsedResource : 	sum { j in PRODUKT } rohstoffe[j]*produktionszeit[j]*lagerraum[j]*Select[j];
maximize TotalGewinn : 	sum { j in PRODUKT } gewinn[j]*Select[j];


#constrains Betriebsamkeit d.h. nicht negativ
subj to Betriebsamkeit_r : 		sum { j in PRODUKT } rohstoffe [ j ] * Select [ j ] >= 3;
subj to Betriebsamkeit_p : 		sum { j in PRODUKT } produktionszeit [ j ] * Select [ j ] >= 1;
subj to Betriebsamkeit_l : 		sum { j in PRODUKT } lagerraum [ j ] * Select [ j ] >= 3;

#constrains Produktionsmenge
subj to Ersatz_r : 		sum { j in PRODUKT } rohstoffe [ j ] * Select [ j ] <= max_ersatz_r;
subj to Ersatz_p : 		sum { j in PRODUKT } produktionszeit [ j ] * Select [ j ] <= max_ersatz_p;
subj to Ersatz_l : 		sum { j in PRODUKT } lagerraum [ j ] * Select [ j ] <= max_ersatz_l;

*/

# musterlösung aus Folien

option solver gurobi;

#import set+param
set produkte;
set ressourcen;

# mengen-klammern -> enumeration of indexes in Menge
param gewinn{produkte};
param verf_ressourcen{ressourcen};
param ressourcen_Matrix{produkte, ressourcen};

#dessision Variable
var every_instance{produkte} >= 0 integer;

#goal
maximize z: sum{p in produkte} gewinn[p] * every_instance[p];

# constrains
s.t. Kapazitaet{r in ressourcen}: sum{p in produkte} ressourcen_Matrix[p,r] * every_instance[p] <= verf_ressourcen[r]; 

