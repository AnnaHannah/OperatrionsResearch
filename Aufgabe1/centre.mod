# dediziere von tabelle auf einzelne Parameter, mache lineares GLS daraus
# --------------
# decition variables:
# decimal numbers:

#var x1 >= 0 , <= 1;
#var x2 >= 0 , <= 1;
#var x3 >= 0 , <= 1;
#var x4 >= 0 , <= 1;

# binary format
var x1 binary;
var x2 binary;
var x3 binary;
var x4 binary;

# GOAL:
maximize Profit : 600 * x1 + 100 * x2 + 300 * x3 + 500 * x4 ;

# basketball place will only will build wehn park will be build:
subject to IfBasketballThenPark: x2 <= x1;

subject to Budget : 50 * x1 + 20 * x2 + 150 * x3 + 70 * x4 <= 200;
subject to Space : 8 * x1 + 4 * x3 + 5 * x4 <= 15;

