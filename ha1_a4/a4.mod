option solver gurobi ; 

#import
set Fabriken;
set Habitat;
set Bergbaustation;

# Verbindugsstrecken
param errichtungskosten{Fabriken};
param transportkosten{Fabriken, Habitat};
param transportKunde{Habitat, Bergbaustation};

# Grenzen für jedes Node auf Layer
param fertigung_kap{Fabriken};
param endbedarf{Bergbaustation};
param lager_kap{Habitat};

# Entscheidungsvariablen
var y{Fabriken} binary;
var x{Fabriken, Habitat} >= 0;
var w{Habitat, Bergbaustation} >= 0;

#GOAL
minimize z: sum{i in Fabriken} sum{j in Habitat} (transportkosten[i,j]*x[i,j]) 
			+ sum{i in Fabriken} (y[i]*errichtungskosten[i]) 
			+ sum{i in Habitat} sum{j in Bergbaustation} (w[i,j]*transportKunde[i,j])
			;

# Restrictions
# Produktionskapazität der Farbik
s.t. res1 {i in Fabriken}: sum{j in Habitat} x[i,j] <= fertigung_kap[i]*y[i]; 
# was reingeht, geht auch raus (2. Layer) - Flow-Erhaltungssatz
s.t. res2 {i in Habitat}: sum{j in Fabriken} x[j,i] = sum{j in Bergbaustation} w[i,j]; 
# Lagerkapazität/habitate 
s.t. res3 {i in Habitat}: sum{j in Bergbaustation} w[i,j] <= lager_kap[i]; 
# Endbedarf Kunde
s.t. res4 {j in Bergbaustation}: sum{i in Habitat} w[i,j] = endbedarf[j]; 









