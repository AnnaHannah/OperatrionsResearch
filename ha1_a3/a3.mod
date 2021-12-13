# import 
set V;
set E within {V,V};
set S;
set K{S};

param c{E};
param r;

var x{E} binary;

# my goal 
minimize d: sum{(i,j) in E} x[i,j]*c[i,j];

# restrictions 
# incoming edges /first might couse error
s.t. R1{j in V}: sum{(i,j) in E} x[i,j] = 1;

#outgoing edges/last might couse error
s.t. R2{j in V}: sum{(j,k) in E} x[j,k] = 1;

# Kreise verhindern (eigentlich unnötig)
s.t. SubtourElimination{s in S}:sum{(i,j) in E: i in K[s] and j in K[s]} x[i,j] <= card(K[s]) - 1;
