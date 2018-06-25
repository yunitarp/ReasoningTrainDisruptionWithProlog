:- discontiguous prob/3.
%==============================================================================================%
/*	Rules to reason about Probability in Prolog
	===========================================
*/

/*
	Prolog rules to calculate Rules 1 (Probability of conjunction)
	prob([X|Xs],Cond,P) ==>  rules to calculate the conjunction probability (P) of disruption X given Cond disruption.
*/
prob([X|Xs],Cond,P) :- !,
	prob(X, Cond, Px),
	prob(Xs, [X|Cond], PRest),
	P is Px * PRest.

/*
	Prolog rules to calculate Rules 2 (Probability of certain disruption is happened.
	prob(X, Cond, 1) ==> rules to calculate probability (P) of a disruption given the disruption itself is = 1.
*/
prob([],_,1):- !.
prob(X, Cond, 1) :-
	member(X, Cond),!. %checking, is the conditional event is the disruption itself?

/*
	Prolog rules to calculate Rules 3 (Probability of impossible event)
	prob(X, Cond, 0) ==> rules to calculate the probability (P) of a disruption given the negation of disruption itself is = 0.
*/
prob(X, Cond, 0) :-
	member(\+ X, Cond), !. %checking, is the the conditional event is the negation of disruption itself?

/*
	Prolog rules to calculate Rules 4 (Probability of negation)
	prob(\+ X, Cond, P) ==> rules to calculate the probability (P) of negation of disruption X given other disruption (Cond) is
	= 1- Probability of disruption X (P0) given othen disruption (Cond)
*/
prob(\+ X, Cond, P) :- !,
	prob(X, Cond, P0),
	P is 1-P0.
/*	
	Prolog rules to calculate Rules 5 (Probability of disruption if condition (Cond0) involves a descendant of disruption X)
	Use Bayes rule if condition involves a descendant of disruption X

*/
prob(X, Cond0, P):- prob(X, Cond0, P, _Py),!.
prob(X, Cond0, P, Py):-
	delete(Y, Cond0, Cond),
	predecessor(X,Y),!,				%Y is a descendant of X
	prob(X, Cond, Px),
	prob(Y, [X|Cond], PyGivenX),
	prob(Y, Cond, Py), Py \=0,
	P is Px * PyGivenX / Py.

/*

*/
%Cases when condition does not involves a descendant

prob(X, _Cond, P) :-
	p(X, P),!.						% X a root cause - its probability given

prob(X, Cond, P) :- !,
	findall((CONDi, Pi), p(X,CONDi,Pi), CPlist),		%Condition on parents
	sum_probs(CPlist, Cond, P).

sum_probs([],_,0).
sum_probs([(COND1,P1) | CondsProbs], COND, P) :-
	prob(COND1, COND, PC1),
	sum_probs(CondsProbs, COND, PRest),
	P is P1 * PC1 + PRest.


predecessor(X, \+ Y) :- !,			%Negated variable Y
	predecessor(X,Y).

predecessor(X,Y) :-
	parent(X,Y).

predecessor(X,Z) :-
	parent(X,Y),
	predecessor(Y,Z).

member(X, [X|_]).
member(X, [_|L]) :-
	member(X,L).

delete(X, [X|L], L).
delete(X, [Y|L], [Y|L2]) :-
	delete(X, L, L2).
%==============================================================================================%

/*
route(X,Y) :- retractall(visited(_)), route_(X,Y).
route_(X,Y) :- edge(X,Y).
route_(X,Y) :- edge(X,Z), \+ visited(Z), asserta(visited(Z)), route_(Z,Y).
*/

/* Find path in the cyclic graph from A disruption to B disruption and it only visiting cycle path once
	show_path(A,B,P) ==> true if there is a path P from disruption A to disruption P in cyclic graph.
*/
show_path(A,A,T,P) :- reverse([A|T],P).
show_path(A,Z,T,P) :- edge(A,B), not(member(A,T)), show_path(B,Z,[A|T],P).
show_path(A,B,P) :- show_path(A,B,[],P).



/*
tracing_cause(A, B, cause(A,B)) 	:- parent(A,B).
tracing_cause(A,B, cause(A,Z,G)) 	:- 
										parent(A, Z),
										tracing_cause(Z, B, G).
*/

/*
	adjacent(A, B ,[A,B]) ===> is true if there is an edge from A disruption to B disruption, or in other word A disruption
							   is parent of B disruption in the DAG.
	path(A, B, [A,B])  ===> is true if there is a path from A disruption to B disruption (base case).
	path(A, B, [A | Rest]) ==> is true if there is a path from A disruption to B disruption (recursive case).
*/
adjacent(A, B ,[A,B]) 	:- parent(A, B).
path(A, B, [A,B]) 		:- adjacent(A,B, [A,B]).
path(A, B, [A | Rest]) 	:- 
							adjacent(A, X, [A,X]),
							path(X, B, Rest).

/*
	path_probability(A, B, Path, Prob) ==> find path(Path) disruption from A disruption to B disruption with its probability (Prob)
*/
path_probability(A, B, Path, Prob) :- 
										path(A, B, Path), prob(B, [A], P),
										Prob is P.

/*
	causing(A, B, Path, Cause) ==> find path(Path) disruption from A disruption to B disruption that contains Cause disruptions.
*/
causing(A, B, Path, Cause) :- show_path(A, B, Path), subset([Cause], Path).

/*
	match(L1,L2) ==> make sure every member of L1 is contains in L2.
	avoid(L1,L2) ==> make sure every member of L1  is not contains in L2.
	notCausing(A,B,Path,Avoid) ==> find path (Path) from A disruption to B disruption that does not contain Avoid disruptions.
*/
match(L1,L2) :- member(X,L1),member(X,L2).
avoid(L1,L2) :- not(match(L1,L2)).

notCausing(A,B,Path,Avoid) :- show_path(A, B, Path), avoid([Avoid], Path).

/*notCausingDisruption(Disruption, X) :- node(X), not(path(X, Disruption, _Path)).

indirectCaused(X,_Y) :- parent(_Z,X).
indirectCaused(X,Y) :- parent(X,Z), indirectCaused(Z, Y).

directCaused(X,Y) :- parent(Y,X).
*/


numberOfChildren(Disruption, N, L) :-
	findall(Y, parent(Disruption, Y),L),
	length(L,N).
	
numberOfParent(Disruption, N, L) :-
	findall(Y, parent(Y, Disruption),L),
	length(L,N).

haveAtLeastThreeParents(Disruption, _N) :-
	parent(X,Disruption), parent(Y, Disruption), parent(Z, Disruption),
	(X \= Y), (Y \= Z), (Z \= X).

haveAtLeastTwoParents(Disruption) :-
	parent(X,Disruption), parent(Y, Disruption),
	(X \= Y).

independentNodes(Node) :-
	node(Node), \+ parent(Node,_), \+ parent(_, Node).

safetyCriticalness(X) :- node(X), safety(X).
missionCriticalness(X) :- node(X), mission(X).
needImmediateAction(X) :- node(X), immediate(X).

/*
	disruptionLevelOne(X) :- safetyCriticalness(X), missionCriticalness(X), needImmediateAction(X).
	disruptionLevelTwo(X) :- ((safetyCriticalness(X), missionCriticalness(X)); (safetyCriticalness(X), needImmediateAction(X));
						 (missionCriticalness(X), needImmediateAction(X))), not(disruptionLevelOne(X)).
	disruptionLevelThree(X) :- (safetyCriticalness(X); missionCriticalness(X); needImmediateAction(X)), not(disruptionLevelOne(X)),
						 not(disruptionLevelTwo(X)).
*/


/*Find the most triggering disruptions.
Y is descendant of X: descendant/2.
The predicate descendant/2 is true if disruption X is parent of Y or if there is a path from disruption X to disruption Y.

Node is the name of disruption, Descendant is name of disruption descendaants, and Length is the number of disruption descenants.
descendants([Node, Descendant, Length]) is predicate to collect each disruption, its descendant, and number of descendant in a list.


The predicate all_descendant/1 will give a Result list that collect all of disruptions with their descendants and number of descendant.
*/

descendant(X,Y) :- parent(X,Y).
descendant(X,Y) :- parent(X,Z), descendant(Z,Y).
descendants([Node, Descendant, Length]) :- node(Node), findall(A, descendant(Node,A), L), sort(L, Descendant), length(Descendant, Length).
all_descendant(Result) :-
	findall([Node,Descendant, Length], descendants([Node,Descendant, Length]), Result).

compare_descending('<', [_,_, X], [_, _, Y]) :- X > Y, !.
compare_descending('>', _, _N).

sort_descendant_descending(Sorted) :-
	all_descendant(Result),
    predsort(compare_descending, Result, Sorted).
max_descendant(L) :- sort_descendant_descending(Result), nth0(0, Result, L).
detail_max_descendant([Node, Descendant, Length]) :- max_descendant(L), nth0(0, L, Node), nth0(1, L, Descendant), nth0(2, L, Length).

ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).
ancestors([Node, Ancestor, Length]) :- node(Node), findall(A, descendant(A, Node), L), sort(L, Ancestor), length(Ancestor, Length).

all_ancestor(Result) :-
	findall([Node,Ancestor, Length], ancestors([Node,Ancestor, Length]), Result).
sort_ancestor_descending(Sorted) :-
	all_ancestor(Result),
    predsort(compare_descending, Result, Sorted).
max_ancestor(L) :- sort_ancestor_descending(Result), nth0(0, Result, L).

detail_max_ancestor([Node, Ancestor, Length]) :- max_ancestor(L), nth0(0, L, Node), nth0(1, L, Ancestor), nth0(2, L, Length).

/*Additional predicates: 
common triggered disruption: com_triged_dis/3.
The predicate com_triged_dis(D1,D2,D3) is true if the disruption D3 is triggered by disruption D1 and D2.
In other words, D3 is the descendant of both D1 and D2.
*/
com_triged_dis(X,Y,Z):- ancestor(X,Z), ancestor(Y,Z).
show_com_triged_dis(X, Y, Com_Triged_Dis) :- findall(Z, com_triged_dis(X,Y,Z), L), sort(L, Com_Triged_Dis).

/* Additional predicates:
common triggering disruption: com_triging_dis/3.
The predicate com_triging_dis(D1,D2,D3) is true if the disruption D1 and D2 are triggered by disruption D3.
In other words, D3 is the ancestor of both D1 and D2.
*/
com_triging_dis(X,Y,Z):- ancestor(Z,X), ancestor(Z,Y), X \= Y.
show_com_triging_dis(X, Y, Com_Triging_Dis) :- findall([Z], com_triging_dis(X,Y,Z), L), sort(L, Com_Triging_Dis).
