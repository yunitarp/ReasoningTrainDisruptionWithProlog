prob([X|Xs],Cond,P) :- !,
	prob(X, Cond, Px),
	prob(Xs, [X|Cond], PRest),
	P is Px * PRest.

prob([],_,1):- !.
prob(X, Cond, 1) :-
	member(X, Cond),!.

prob(X, Cond, 0) :-
	member(\+ X, Cond), !.

prob(\+ X, Cond, P) :- !,
	prob(X, Cond, P0),
	P is 1-P0.

%Use Bayes rule if condition involves a descendant of X
prob(X, Cond0, P):-
	delete(Y, Cond0, Cond),
	predecessor(X,Y),!,				%Y is a descendant of X
	prob(X, Cond, Px),
	prob(Y, [X|Cond], PyGivenX),
	prob(Y, Cond, Py),
	P is Px * PyGivenX / Py.		%Assuming Py > 0

%Cases when condition does not involves a descendant

prob(X, Cond, P) :-
	p(X, P),!.						% X a root cause - its probability given

prob(X, Cond, P) :-
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

route(X,Y) :- retractall(visited(_)), route_(X,Y).
route_(X,Y) :- edge(X,Y).
route_(X,Y) :- edge(X,Z), \+ visited(Z), asserta(visited(Z)), route_(Z,Y).


show_path(A,A,T,P) :- reverse([A|T],P).
show_path(A,Z,T,P) :- edge(A,B), not(member(A,T)), show_path(B,Z,[A|T],P).
show_path(A,B,P) :- show_path(A,B,[],P).



%cause(A,B, Path, prob(B, [A], P)) :- show_path(A,B, Path), prob(B, [A], P).

tracing_cause(A, B, cause(A,B)) 	:- parent(A,B).
tracing_cause(A,B, cause(A,Z,G)) 	:- 
										parent(A, Z),
										tracing_cause(Z, B, G).

adjacent(A, B ,[A,B]) 	:- parent(A, B).
path(A, B, [A,B]) 		:- adjacent(A,B, [A,B]).
path(A, B, [A | Rest]) 	:- 
							adjacent(A, X, [A,X]),
							path(X, B, Rest).
path_probability(A, B, Path, Prob) :- 
										path(A, B, Path), prob(B, [A], P),
										Prob is P.

causing(A, B, Path, Cause) :- show_path(A, B, Path), subset(Cause, Path).

match(L1,L2) :- member(X,L1),member(X,L2).
avoid(L1,L2) : not(match(L1,L2)).

path_avoid(A,B,Path,Avoid) :- show_path(A, B, Path), not(match(Avoid, Path)).

notCausingDisruption(Disruption, X) :- node(X), not(path(X, Disruption, Path)).

indirectCaused(X,Y) :- parent(Z,X).
indirectCaused(X,Y) :- parent(X,Z), indirectCaused(Z, Y).

directCaused(X,Y) :- parent(Y,X).

numberOfChildren(Disruption, N) :-
	findall(Y, parent(Disruption, Y),L),
	length(L,N).

numberOfParent(Disruption, N) :-
	findall(Y, parent(Y, Disruption),L),
	length(L,N).

haveAtLeastThreeParents(Disruption, N) :-
	parent(X,Disruption), parent(Y, Disruption), parent(Z, Disruption),
	(X \= Y), (Y \= Z), (Z \= X).

haveAtLeastTwoParents(Disruption) :-
	parent(X,Disruption), parent(Y, Disruption),
	(X \= Y).

independentNodes(Node) :-
	node(Node), \+ parent(Node,Y), \+ parent(Y, Node).

safetyCriticalness(X) :- node(X), safety(X).
missionCriticalness(X) :- node(X), mission(X).
needImmediateAction(X) :- node(X), immediate(X).

disruptionLevelOne(X) :- safetyCriticalness(X), missionCriticalness(X), needImmediateAction(X).
disruptionLevelTwo(X) :- ((safetyCriticalness(X), missionCriticalness(X)); (safetyCriticalness(X), needImmediateAction(X));
						 (missionCriticalness(X), needImmediateAction(X))), not(disruptionLevelOne(X)).
disruptionLevelThree(X) :- (safetyCriticalness(X); missionCriticalness(X); needImmediateAction(X)), not(disruptionLevelOne(X)),
						 not(disruptionLevelTwo(X)).