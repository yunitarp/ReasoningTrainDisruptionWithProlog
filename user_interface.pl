show_prob([]).										% Itemize and write the list of path and probability
show_prob([[Path,Prob]|Tail]):-
	write('Path: '), write(Path), nl,
	write('Probability: '), write(Prob), nl,
	show_prob(Tail).

show_path([]).										% Itemize and write the list of path
show_path([H|Tail]):-
	write(H),nl,show_path(Tail).

show_descendant([]).
show_descendant([[Node, Descendant, Length]|Tail]) :-
	write('Disruption: '), write(Node), nl,
	write('Trigger Disruptions: '), write(Descendant),nl,
	write('Total: '), write(Length), nl,
	show_descendant(Tail).

show_ancestor([]).
show_ancestor([[Node, Ancestor, Length]|Tail]) :-
	write('Disruption: '), write(Node), nl,
	write('Triggered by Disruptions: '), write(Ancestor),nl,
	write('Total: '), write(Length), nl,
	show_descendant(Tail).

probability:-
	write('Disruption: '),read(Ans),
	write('Conditional: '),read(Ans2),
	(	% If no conditional
		(Ans2 = 'no', write('Probability: '), ((prob(Ans,[],P), write(P)); write(0)), nl,
		numberOfChildren(Ans,N1, L1), write('Number of Children( The disruption that triggered) '), write(Ans), write(' disruption'), write(N1), nl, write(L1),nl,
		numberOfParent(Ans,N2, L2), write('Number of Parents (The disruption that triggering) '), write(Ans), write(' disruption'), write(N2), nl, write(L2));
		% If there exists a conditional
		(Ans2 \= 'no', findall([P1,P2],path_probability(Ans2,Ans,P1,P2),L),
		(L = [] -> (write('Path: []'), nl, write('Probability: '), findall(Prob, prob(Ans, [Ans2], Prob), P), write(P), nl); show_prob(L)))
	).

trace:-
	write('Disruption: '),read(A1),
	write('Cause: '),read(A2),
	write('List Contain Disruption: '),read(A3),
	write('List Not Contain Disruption: '),read(A4),
	write('Path containing  '),write(A3), write(': '), nl,
	findall(Path,causing(A2,A1,Path, A3),L), sort(L, Sorted), write(Sorted), nl,
	write('Path not containing '),write(A4), write(': '), nl,
	findall(Path,notCausing(A2,A1,Path,A4),L1), sort(L1, Sorted1), write(Sorted1), nl.

most_lead :-
	findall([Node, Descendant, Length], detail_max_descendant([Node, Descendant, Length]), L), show_descendant(L).

most_triggered :-
	findall([Node, Ancestor, Length], detail_max_ancestor([Node, Ancestor, Length]), L), show_ancestor(L).

com_trigged :-
	write('Disruption 1 : '), read(D1),
	write('Disruption 2 : '), read(D2),
	write('Common Triggered Disruption by '), write(D1), write(' and '), write(D2), write(' :'), nl,
	show_com_triged_dis(D1,D2,Z), write(Z).

com_triggering :-
	write('Disruption 1: '), read(D3),
	write('Disruption 2 :'), read(D4),
	write('Common Triggering Disruption by '), write(D3), write(' and '), write(D4), write(' :'), nl,
	show_com_triging_dis(D3,D4, L), write(L).

not_lead_other :-
	write('Disruption that not lead any other disruptions : '), nl,
	findall(Node, independentNodes(Node), L), write(L).

menu:-
	write('Main Menu'),nl,
	write('1. Safety Criticalness'),nl,
	write('2. Mission Criticalness'),nl,
	write('3. Need Immediate Action'),nl,
	write('4. Disruption Probability'),nl,
	write('5. Trace Disruption'),nl,
	write('6. The most-triggering disruptions'),nl,
	write('7. The most-triggered disruptions'),nl,
	write('8. Common Trigged Disruption'),nl,
	write('9. Common Triggering Disruption'),nl,
	write('10. Not lead to any other disruptions'), nl,
	write('11. Exit'), nl,
	write('Choice: '),read(Ans),
	(
		(Ans = 1, findall(X,safetyCriticalness(X),L), write('Safety Criticalness: '),write(L),nl,nl,menu);
		(Ans = 2, findall(X,missionCriticalness(X),L), write('Mission Criticalness: '),write(L),nl,nl,menu);
		(Ans = 3, findall(X,needImmediateAction(X),L), write('Need Immediate Action: '),write(L),nl,nl,menu);
		(Ans = 4, probability ,nl, menu);
		(Ans = 5, trace, nl, menu);
		(Ans = 6, most_lead, nl, menu);
		(Ans = 7, most_triggered, nl, menu);
		(Ans = 8, com_trigged, nl, menu);
		(Ans = 9, com_triggering, nl, menu);
		(Ans = 10, not_lead_other, nl, menu);
		(Ans = 11, write('Closing'));
		((Ans > 11; Ans < 1; not(integer(Ans))), write('Invalid choice.'),nl,nl,menu)
	).
