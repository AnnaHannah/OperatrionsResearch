
# Entscheidungsvariablen Definieren:
# decimal numbers:
var x1 >= 0 , <= 1000;
var x2 >= 0 , <= 1000;

# binary format
# var x1 binary;
# var x2 binary;

# GOAL:
minimize z : 4*x1 + 2*x2 ;

# restrictions
s.t. R1: 3*	x1 	+ 3*x2 	>= 16 ;
s.t. R2: 10*x1 	+ 4*x2 	>= 42 ;
s.t. R3: 3*x1			>= 4.5 ;
