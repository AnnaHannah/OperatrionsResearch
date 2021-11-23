## Center County Problem

---
### Tips:
Programming good Style:
- no numbers in .mod file
- better use: param ind .mod file and declare in the .dat file that number

#### common mistakes
 - offset 281 (index is nor defined) => you forgot the sum
 - offset 722 (index is nor defined) => you forgot to say sum over what => SUM {J in PROJECS}
 - offset 747 (syntax error) => multiple usage of same indexing-latter e.g. "for all" and "sum" uses both same "j" letter in one formula
 - Case-sensitive /groß kleinschreibung
 - Error no value for 'pool' in data-file -> you forgot column in data file
 - syntax error - you forgot Semicolon (look at line before)
 - ampl: to ampl? (means you could complete the statement: ex. ampl: solve -> ampl? -> ; -> ok 
 
---

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

Restriction from state:
- $200,000 from state
- 15 acres available

Restriction from public:
- for each Project can be no more be spend than 60

## Goal: select projects to max daily usage (s.t. budget and land)




