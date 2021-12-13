option solver gurobi;

set Fabriken;
set Pizzab�ckerei;
set Verkauf;

param errichtungskosten{Fabriken};
param transportkosten{Fabriken,Pizzab�ckerei};
param transport{Pizzab�ckerei,Verkauf};

#param bedarf{Pizzab�ckerei};
param produktion{Fabriken};
param bed{Verkauf};
param Lager{Pizzab�ckerei};

var x{Fabriken,Pizzab�ckerei} >= 0;
var y{Fabriken} binary;
var w{Pizzab�ckerei, Verkauf} >= 0;

minimize z: sum{i in Fabriken} sum{j in Pizzab�ckerei} (transportkosten[i,j]*x[i,j]) + sum{i in Fabriken} (y[i]*errichtungskosten[i]) 
			+ sum{i in Pizzab�ckerei} sum{j in Verkauf} (w[i,j]*transport[i,j]);

s.t. res1 {i in Fabriken}: sum{j in Pizzab�ckerei} x[i,j] <= produktion[i]*y[i]; # Produktionskapazit�t der Farbik
s.t. res2 {i in Pizzab�ckerei}: sum{j in Fabriken} x[j,i] = sum{j in Verkauf} w[i,j]; # was reingeht, geht auch raus
s.t. res3 {i in Pizzab�ckerei}: sum{j in Verkauf} w[i,j] <= Lager[i]; # Lagerkapazit�t 
s.t. res4 {j in Verkauf}: sum{i in Pizzab�ckerei} w[i,j] = bed[j]; # Bedarf