#import
set B;
set E within {B,B};

param c{E};
param n{B};

#entscheidungsvariable
var x{E} binary;

#zielfunktion
minimize d: sum{(i,j) in E} x[i,j];

# restriction
# s.t. R1{j in V}: sum{(i,j) in E} x[i,j] = 1;

s.t. R1{i in B}: sum{(i,j) in E} (x[i,j]*E[i,j]) >= 1;