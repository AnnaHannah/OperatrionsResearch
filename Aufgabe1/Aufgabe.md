## Center County Problem

Centre County, PA is considering 4 potential community development projects:

Project 		Daily-Usage(ppl) 	Cost 		Land Space (acres)
Park			600 				$50,000 	8
Basketball 		100 				$20,000 	0
Recreation center  300 				$150,000 	4
Swimming pool 	500 				$70,000 	5

Restriction for baskeball:
- Basketball court will be built in park
- No extra space needed
- But cannot build unless build park

Restriction from State:
- $200,000 from state
- 15 acres available

Goal: select projects to max daily usage s.t. budget and land
constraints

### Names in this code for data File

param usage :=
	park 		600
	basketball 	100
	rec 		300
	pool 		500 ;
	
param cost :=
	park 		50
	basketball 	20
	rec 		150
	pool 		70 ;
	
param space :=
	park 		8
	basketball 	0
	rec 		4
	pool 		5 ;

