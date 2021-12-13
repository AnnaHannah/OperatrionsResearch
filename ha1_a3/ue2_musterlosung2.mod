option solver gurobi;

set J; 

param p{J};
param g{J};
param G;

var x{J} binary;

maximize z: sum{j in J} p[j]*x[j];

s.t. kapa: sum{j in J} g[j]*x[j] <= G;