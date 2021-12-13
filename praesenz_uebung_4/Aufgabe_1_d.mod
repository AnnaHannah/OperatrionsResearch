option solver gurobi;

set Fabriken;
set Pizzabaeckerei;

param errichtungskosten{Fabriken};
param transportkosten{Fabriken,Pizzabaeckerei};

param bedarf{Pizzabaeckerei};
param produktion{Fabriken};

var x{Fabriken,Pizzabaeckerei} >= 0;
var y{Fabriken} binary;
	
minimize z: sum{i in Fabriken, j in Pizzabaeckerei} 
	transportkosten[i,j]*x[i,j] + sum{i in Fabriken} 
	y[i]*errichtungskosten[i];

s.t. res1{i in Fabriken}: sum{j in Pizzabaeckerei} x[i,j] 
	<= produktion[i]*y[i];
s.t. res2{j in Pizzabaeckerei}: sum{i in Fabriken} x[i,j] 
	= bedarf[j]; 

