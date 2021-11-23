# define  SET (menge der projekte) of projects

set PROJECTS ; # set of projects (P)

# by defailt they are numerated/indexed if you use {}, to use Index you need to use quadratische Kammern z.B.:[i]
param usage { PROJECTS }; # usage for project j (u_j)
param cost { PROJECTS }; # cost for project j (c_j)
param space { PROJECTS }; # space for project j (s_j)

param max_spend; # import from data file

#decision variable / 
var Select { PROJECTS } binary ; # select project j? (x_j)

#goal
maximize TotalUsage : 	sum { j in PROJECTS } usage [ j ] * Select [ j ];

#constrains
subj to Budget : 		sum { j in PROJECTS } cost [ j ] * Select [ j ] <= 200;
subj to LandAvailable : sum { j in PROJECTS } space [ j ] * Select [ j ] <= 15;

#constranint: if basketball then park mus be done:
subj to IfBasketballThenPark: Select['basketball'] <= Select['park'] ;

#constraint from public: "for each" Project is no more spend then 60 (max_spend) -> data file
subj to MaxSpendPerProject {j in PROJECTS}: cost[j]*Select[j] <= max_spend ;