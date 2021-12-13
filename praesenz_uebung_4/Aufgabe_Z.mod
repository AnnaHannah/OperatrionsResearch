option solver gurobi;

set Fabriken;
set Pizzabäckerei;
set Verkauf;

param errichtungskosten{Fabriken};
param transportkosten{Fabriken,Pizzabäckerei};
param transport{Pizzabäckerei,Verkauf};

#param bedarf{Pizzabäckerei};
param produktion{Fabriken};
param bed{Verkauf};
param Lager{Pizzabäckerei};

var x{Fabriken,Pizzabäckerei} >= 0;
var y{Fabriken} binary;
var w{Pizzabäckerei, Verkauf} >= 0;

minimize z: sum{i in Fabriken} sum{j in Pizzabäckerei} (transportkosten[i,j]*x[i,j]) + sum{i in Fabriken} (y[i]*errichtungskosten[i]) 
			+ sum{i in Pizzabäckerei} sum{j in Verkauf} (w[i,j]*transport[i,j]);

s.t. res1 {i in Fabriken}: sum{j in Pizzabäckerei} x[i,j] <= produktion[i]*y[i]; # Produktionskapazität der Farbik
s.t. res2 {i in Pizzabäckerei}: sum{j in Fabriken} x[j,i] = sum{j in Verkauf} w[i,j]; # was reingeht, geht auch raus
s.t. res3 {i in Pizzabäckerei}: sum{j in Verkauf} w[i,j] <= Lager[i]; # Lagerkapazität 
s.t. res4 {j in Verkauf}: sum{i in Pizzabäckerei} w[i,j] = bed[j]; # Bedarf