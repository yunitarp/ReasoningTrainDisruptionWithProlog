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

parent(fallen_tree, pantograph).
parent(fallen_tree, overhead_line).
parent(service_table, switch).
parent(signal, switch).
parent(pantograph, overhead_line).
parent(fire, overhead_line).
parent(overhead_line, static_inverter).
parent(static_inverter, ac).
parent(compressor, door).
parent(compressor, horn).
parent(compressor, break).
parent(ac, series).
parent(door, series).
parent(horn, series).
parent(break, series).
parent(traction, series).
parent(wiper, series).
parent(speedometer, series).

p(server_and_application, 0.001230516817063).
p(railway, 0.038146021328958).
p(suspension, 0.002050861361772).
p(emergency, 0.002871205906481).
p(mg, 0.002871205906481).
p(service_table, 0.002871205906481).
p(signal, 0.062756357670222).
p(fallen_tree, 0.008613617719442).
p(fire, 0.017637407711239).
p(compressor, 0.007793273174733).
p(traction, 0.007793273174733).
p(wiper, 0.002050861361772).
p(speedometer, 0.001230516817063).

p(static_inverter, [overhead_line], 0.005050505050505).
p(static_inverter, [\+ overhead_line], 0.000213766566909).

p(ac, [static_inverter], 0.5).
p(ac, [\+ static_inverter], 0.029749692244563).

p(door, [compressor], 0.026315789473684).
p(door, [\+ compressor], 0.006821000413394).

p(horn, [compressor], 0.026315789473684).
p(horn, [\+ compressor], 0.000206696982224).

p(break, [compressor], 0.026315789473684).
p(break, [\+ compressor], 0.004340636626705).

p(switch, [signal, service_table], 0.5).
p(switch, [\+ signal, service_table], 0.346153846153846).
p(switch, [signal, \+ service_table], 0.054098360655738).
p(switch, [\+ signal, \+ service_table], 0.041364933070002).

p(overhead_line, [fire, pantograph, fallen_tree], 0.5).
p(overhead_line, [\+ fire, pantograph, fallen_tree], 0.5).
p(overhead_line, [fire, \+ pantograph, fallen_tree], 0.5).
p(overhead_line, [\+ fire, \+ pantograph, fallen_tree], 0.302469135802469).
p(overhead_line, [fire, pantograph, \+ fallen_tree], 0.5).
p(overhead_line, [\+fire, pantograph, \+ fallen_tree], 0.01219512195122).
p(overhead_line, [fire, \+ pantograph, \+ fallen_tree], 0.002958579881657).
p(overhead_line, [\+ fire, \+ pantograph, \+ fallen_tree], 0.03896584540552).

p(series, [speedometer, wiper, traction, break, horn, door, ac],0.5).
p(series, [\+ speedometer, wiper, traction, break, horn, door, ac],0.5).
p(series, [speedometer, \+ wiper, traction, break, horn, door, ac],0.5).
p(series, [\+ speedometer, \+ wiper, traction, break, horn, door,ac], 0.5).
p(series, [speedometer, wiper, \+ traction, break, horn, door, ac],0.5).
p(series, [\+ speedometer, wiper, \+ traction, break, horn, door,ac], 0.5).
p(series, [speedometer, \+ wiper, \+ traction, break, horn, door,ac], 0.5).
p(series, [\+ speedometer, \+ wiper, \+ traction, break, horn, door,ac], 0.5).
p(series, [speedometer, wiper, traction, \+ break, horn, door, ac],0.5).
p(series, [\+ speedometer, wiper, traction, \+ break, horn, door, ac], 0.5).
p(series, [speedometer, \+ wiper, traction, \+ break, horn, door, ac], 0.5).
p(series, [\+ speedometer, \+ wiper, traction, \+ break, horn, door,ac], 0.5).
p(series, [speedometer, wiper, \+ traction, \+ break, horn, door,ac], 0.5).
p(series, [\+ speedometer, wiper, \+ traction, \+ break, horn, door,ac], 0.5).
p(series, [speedometer, \+ wiper, \+ traction, \+ break, horn, door,ac], 0.5).
p(series, [\+ speedometer, \+ wiper, \+ traction, \+ break, horn,door, ac], 0.5).
p(series, [speedometer, wiper, traction, break, \+ horn, door, ac],0.5).
p(series, [\+ speedometer, wiper, traction, break, \+ horn, door,ac], 0.5).
p(series, [speedometer, \+ wiper, traction, break, \+ horn, door,ac], 0.5).
p(series, [\+ speedometer, \+ wiper, traction, break, \+ horn, door,ac], 0.5).
p(series, [speedometer, wiper, \+ traction, break, \+ horn, door,ac], 0.5).
p(series, [\+ speedometer, wiper, \+ traction, break, \+ horn, door,ac], 0.5).
p(series, [speedometer, \+ wiper, \+ traction, break, \+ horn, door,ac], 0.5).
p(series, [\+ speedometer, \+ wiper, \+ traction, break, \+ horn, door, ac], 0.5).
p(series, [speedometer, wiper, traction, \+ break, \+ horn, door,ac], 0.5).
p(series, [\+ speedometer, wiper, traction, \+ break, \+ horn, door, ac], 0.5).
p(series, [speedometer, \+ wiper, traction, \+ break, \+ horn, door, ac], 0.5).
p(series, [\+ speedometer, \+ wiper, traction, \+ break, \+ horn, door, ac], 0.5).
p(series, [speedometer, wiper, \+ traction, \+ break, \+ horn, door, ac], 0.5).
p(series, [\+ speedometer, wiper, \+ traction, \+ break, \+ horn, door, ac], 0.5).
p(series, [speedometer, \+ wiper, \+ traction, \+ break, \+ horn, door, ac], 0.5).
p(series, [\+ speedometer, \+ wiper, \+ traction, \+ break, \+ horn, door, ac], 0.003875968992248).
p(series, [speedometer, wiper, traction, break, horn, \+ door, ac],0.5).
p(series, [\+ speedometer, wiper, traction, break, horn, \+ door, ac],0.5).
p(series, [speedometer, \+ wiper, traction, break, horn, \+ door, ac],0.5).
p(series, [\+ speedometer, \+ wiper, traction, break, horn, \+ door, ac],0.5).
p(series, [speedometer, wiper, \+ traction, break, horn, \+ door, ac],0.5).
p(series, [\+ speedometer, wiper, \+ traction, break, horn, \+ door, ac],0.5).
p(series, [speedometer, \+ wiper, \+ traction, break, horn, \+ door, ac],0.5).
p(series, [\+ speedometer, \+ wiper, \+ traction, break, horn, \+ door, ac],0.5).
p(series, [speedometer, wiper, traction, \+ break, horn, \+ door, ac],0.5).
p(series, [\+ speedometer, wiper, traction, \+ break, horn, \+ door, ac],0.5).
p(series, [speedometer, \+ wiper, traction, \+ break, horn, \+ door, ac],0.5).
p(series, [\+ speedometer, \+ wiper, traction, \+ break, horn, \+ door, ac],0.5).
p(series, [speedometer, wiper, \+ traction, \+ break, horn, \+ door, ac],0.5).
p(series, [\+ speedometer, wiper, \+ traction, \+ break, horn, \+ door, ac],0.5).
p(series, [speedometer, \+ wiper, \+ traction, \+ break, horn, \+ door, ac],0.5).
p(series, [\+ speedometer, \+ wiper, \+ traction, \+ break, horn, \+ door, ac],0.5).
p(series, [speedometer, wiper, traction, break, \+horn, \+ door, ac],0.5).
p(series, [\+ speedometer, wiper, traction, break, \+horn, \+ door, ac],0.5).
p(series, [speedometer, \+ wiper, traction, break, \+horn, \+ door, ac],0.5).
p(series, [\+ speedometer, \+ wiper, traction, break, \+horn, \+ door, ac],0.5).
p(series, [speedometer, wiper, \+ traction, break, \+horn, \+ door, ac],0.5).
p(series, [\+ speedometer, wiper, \+ traction, break, \+horn, \+ door, ac],0.5).
p(series, [speedometer, \+ wiper, \+ traction, break, \+horn, \+ door, ac],0.5).
p(series, [\+ speedometer, \+ wiper, \+ traction, break, \+horn, \+ door, ac],0.5).
p(series, [speedometer, wiper, traction, \+ break, \+ horn, \+ door, ac],0.5).
p(series, [\+ speedometer, wiper, traction, \+ break, \+ horn, \+ door, ac],0.5).
p(series, [speedometer, \+ wiper, traction, \+ break, \+ horn, \+ door, ac],0.5).
p(series, [\+ speedometer, \+ wiper, traction, \+ break, \+ horn, \+ door, ac],0.5).
p(series, [speedometer, wiper, \+ traction, \+ break, \+ horn, \+ door, ac],0.5).
p(series, [\+ speedometer, wiper, \+ traction, \+ break, \+ horn, \+ door, ac],0.5).
p(series, [speedometer, \+ wiper, \+ traction, \+ break, \+ horn, \+ door, ac],0.5).
p(series, [\+ speedometer, \+ wiper, \+ traction, \+ break, \+ horn, \+ door, ac],0.085806739567061).
p(series, [speedometer, wiper, traction, break, horn, door, \+ ac],0.5).
p(series, [\+ speedometer, wiper, traction, break, horn, door, \+ ac],0.5).
p(series, [speedometer, \+ wiper, traction, break, horn, door, \+ ac],0.5).
p(series, [\+ speedometer, \+ wiper, traction, break, horn, door, \+ ac],0.5).
p(series, [speedometer, wiper, \+ traction, break, horn, door, \+ ac],0.5).
p(series, [\+ speedometer, wiper, \+ traction, break, horn, door, \+ ac],0.5).
p(series, [speedometer, \+ wiper, \+ traction, break, horn, door, \+ ac],0.5).
p(series, [\+ speedometer, \+ wiper, \+ traction, break, horn, door, \+ ac],0.5).
p(series, [speedometer, wiper, traction, \+ break, horn, door, \+ ac],0.5).
p(series, [\+ speedometer, wiper, traction, \+ break, horn, door, \+ ac],0.5).
p(series, [speedometer, \+ wiper, traction, \+ break, horn, door, \+ ac],0.5).
p(series, [\+ speedometer, \+ wiper, traction, \+ break, horn, door, \+ ac],0.5).
p(series, [speedometer, wiper, \+ traction, \+ break, horn, door, \+ ac],0.5).
p(series, [\+ speedometer, wiper, \+ traction, \+ break, horn, door, \+ ac],0.5).
p(series, [speedometer, \+ wiper, \+ traction, \+ break, horn, door, \+ ac],0.5).
p(series, [\+ speedometer, \+ wiper, \+ traction, \+ break, horn, door, \+ ac],0.5).
p(series, [speedometer, wiper, traction, break, \+ horn, door, \+ ac],0.5).
p(series, [\+ speedometer, wiper, traction, break, \+ horn, door, \+ ac],0.5).
p(series, [speedometer, \+ wiper, traction, break, \+ horn, door, \+ ac],0.5).
p(series, [\+ speedometer, \+ wiper, traction, break, \+ horn, door, \+ ac],0.5).
p(series, [speedometer, wiper, \+ traction, break, \+ horn, door, \+ ac],0.5).
p(series, [\+ speedometer, wiper, \+ traction, break, \+ horn, door, \+ ac],0.5).
p(series, [speedometer, \+ wiper, \+ traction, break, \+ horn, door, \+ ac],0.5).
p(series, [\+ speedometer, \+ wiper, \+ traction, break, \+ horn, door, \+ ac],0.5).
p(series, [speedometer, wiper, traction, \+ break, \+ horn, door, \+ ac],0.5).
p(series, [\+ speedometer, wiper, traction, \+ break, \+ horn, door, \+ ac],0.5).
p(series, [speedometer, \+ wiper, traction, \+ break, \+ horn, door, \+ ac],0.5).
p(series, [\+ speedometer, \+ wiper, traction, \+ break, \+ horn, door, \+ ac],0.5).
p(series, [speedometer, wiper, \+ traction, \+ break, \+ horn, door, \+ ac],0.5).
p(series, [\+ speedometer, wiper, \+ traction, \+ break, \+ horn, door, \+ ac],0.5).
p(series, [speedometer, \+ wiper, \+ traction, \+ break, \+ horn, door, \+ ac],0.5).
p(series, [\+ speedometer, \+ wiper, \+ traction, \+ break, \+ horn, door, \+ ac],0.428651059085842).
p(series, [speedometer, wiper, traction, break, horn, \+ door, \+ ac],0.5).
p(series, [\+ speedometer, wiper, traction, break, horn, \+ door, \+ ac],0.5).
p(series, [speedometer, \+ wiper, traction, break, horn, \+ door, \+ ac],0.5).
p(series, [\+ speedometer, \+ wiper, traction, break, horn, \+ door, \+ ac],0.5).
p(series, [speedometer, wiper, \+ traction, break, horn, \+ door, \+ ac],0.5).
p(series, [\+ speedometer, wiper, \+ traction, break, horn, \+ door, \+ ac],0.5).
p(series, [speedometer, \+ wiper, \+ traction, break, horn, \+ door, \+ ac],0.5).
p(series, [\+ speedometer, \+ wiper, \+ traction, break, horn, \+ door, \+ ac],0.5).
p(series, [speedometer, wiper, traction, \+ break, horn, \+ door, \+ ac],0.5).
p(series, [\+ speedometer, wiper, traction, \+ break, horn, \+ door, \+ ac],0.5).
p(series, [\+ speedometer, \+ wiper, traction, \+ break, horn, \+ door, \+ ac],0.5).
p(series, [speedometer, wiper, \+ traction, \+ break, horn, \+ door, \+ ac],0.5).
p(series, [\+ speedometer, wiper, \+ traction, \+ break, horn, \+ door, \+ ac],0.5).
p(series, [speedometer, \+ wiper, \+ traction, \+ break, horn, \+ door, \+ ac],0.5).
p(series, [\+ speedometer, \+ wiper, \+ traction, \+ break, horn, \+ door, \+ ac],0.5).
p(series, [speedometer, wiper, traction, break, \+ horn, \+ door, \+ ac],0.5).
p(series, [\+ speedometer, wiper, traction, break, \+ horn, \+ door, \+ ac],0.5).
p(series, [speedometer, \+ wiper, traction, break, \+ horn, \+ door, \+ ac],0.5).
p(series, [\+ speedometer, \+ wiper, traction, break, \+ horn, \+ door, \+ ac],0.5).
p(series, [speedometer, wiper, \+ traction, break, \+ horn, \+ door, \+ ac],0.5).
p(series, [\+ speedometer, wiper, \+ traction, break, \+ horn, \+ door, \+ ac],0.5).
p(series, [speedometer, \+ wiper, \+ traction, break, \+ horn, \+ door, \+ ac],0.5).
p(series, [\+ speedometer, \+ wiper, \+ traction, break, \+ horn, \+ door, \+ ac],0.5).
p(series, [speedometer, wiper, traction, \+ break, \+ horn, \+ door, \+ ac],0.5).
p(series, [\+ speedometer, wiper, traction, \+ break, \+ horn, \+ door, \+ ac],0.5).
p(series, [speedometer, \+ wiper, traction, \+ break, \+ horn, \+ door, \+ ac],0.5).
p(series, [\+ speedometer, \+ wiper, traction, \+ break, \+ horn, \+ door, \+ ac],0.33347788378144).
p(series, [speedometer, wiper, \+ traction, \+ break, \+ horn, \+ door, \+ ac],0.5).
p(series, [\+ speedometer, wiper, \+ traction, \+ break, \+ horn, \+ door, \+ ac],0.001945525291829).
p(series, [speedometer, \+ wiper, \+ traction, \+ break, \+ horn, \+ door, \+ ac],0.003875968992248).
p(series, [\+ speedometer, \+ wiper, \+ traction, \+ break, \+ horn, \+ door, \+ ac],0.080313712261764).
