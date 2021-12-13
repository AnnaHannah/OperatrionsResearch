
# Entscheidungsvariablen Definieren:
# decimal numbers:
param x1 =3.44444;
param x2 =1.88889;
#var x1 >= 1 ;
#var x2 >= 1 ;

# ermittelte schrankte 
param schranke_z;

var lambda >=0, <= 100; # kann negativ werden da lambda-k
var k = 0.1;
var lambda_old ;
var lambda_old_old ;

# GOAL: Lagrange variablen mit Randbedingungen verknüpfen
minimize z : 4*x1 + 2*x2 ;

	printf "\n\n--------------------------START my code---------------------------------------------\n\n ";			
		for {i in 1..10}{ 		# abbruch nach 8 iterationen:
			
			if (4*x1 + 2*x2 
			- lambda*(3*x1 + 3*x2 - 16) 
			- lambda*(10*x1 + 4*x2 - 42) 
			- lambda*(3*x1 - 4.5) 			>= z)# alternativ kann auch schranke_z hier stehen
			
			# 1.Fall - Überschritten -> Vorzeichen k
				then {
					printf "-> ÜBERSCHRITTEN: \n";
					#lambda-tracking/anpassung: lambda state saving
					let lambda_old_old := lambda_old;
					let lambda_old := lambda;
					#aktion
					let lambda := lambda - k;
					#let lambda_changed := lambda_changed +1;
					
					
					display i,k, x1,x2;
					display (4*x1 + 2*x2 - lambda*(3*x1 + 3*x2 - 16) - lambda*(10*x1 + 4*x2 - 42)- lambda*(3*x1 - 4.5)) ;	
					display lambda, lambda_old, lambda_old_old; 
					} 
				
				# 2.Fall -> Vorzeichen k
				else {
					printf "-> UNTERSCHRITTEN: \n";
					#lambda-tracking/anpassung: lambda state saving
					let lambda_old_old := lambda_old;
					let lambda_old := lambda;
					let lambda := lambda + k;
					#let lambda_changed := lambda_changed + 1;
					# console
					
					display i,k,x1,x2;
					display (4*x1 + 2*x2 - lambda*(3*x1 + 3*x2 - 16) - lambda*(10*x1 + 4*x2 - 42)- lambda*(3*x1 - 4.5)) ;	
					display lambda, lambda_old, lambda_old_old; 
					} 
			
			# alternierendes Verhalten unterbinden (letzte 3 Werte anschauen)-> Näherung anfangen
			if (lambda == lambda_old_old
				or z = (4*x1 + 2*x2 - lambda*(3*x1 + 3*x2 - 16) - lambda*(10*x1 + 4*x2 - 42)- lambda*(3*x1 - 4.5))) 
				then {		
					let k := k/2;
					# console
					printf("-> ! k HALBIEREN \n");
					display i, k, lambda, lambda_old,lambda_old_old; #lambda_changed;
					}	
		
	}

			
	
printf "--------------------------my code is DONE---------------------------------------------\n\n";
printf " Ende der iteration z = %s, \n lambda = %s \n x1 = %s \n x2 = %s \n\n",
	 (4*x1 + 2*x2 
	 	- lambda*(3*x1 + 3*x2 - 16) 
	 	- lambda*(10*x1 + 4*x2 - 42)
	 	- lambda*(3*x1 - 4.5)), 
	 	
	 	lambda, x1, x2
	 	;
		
			
