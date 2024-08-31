:- dynamic insurance/6.

% Vehicles
vehicle('Toyota', 'CH001', 'Corolla', 'Sedan', 1998, 'red').
vehicle('Honda', 'CH002', 'Civic', 'Sedan', 2015, 'blue').
vehicle('Toyota', 'CH003', 'Camry', 'Sedan', 2005, 'black').
vehicle('Ford', 'CH004', 'Fiesta', 'Hatchback', 2018, 'red').

% Owners
owner(1, 'Mr. Ajantha', '123 Main St', date(1980, 5, 10), 'male', '0771234567').
owner(2, 'Ms. Nimalka', '456 Side Rd', date(1990, 8, 22), 'female', '0777654321').
owner(3, 'Mr. Kumara', '789 High St', date(1975, 3, 15), 'male', '0779876543').

% Registrations
registration('REG001', 'CH001', 1, 1998, date(2023, 7, 15)).
registration('REG002', 'CH002', 2, 2015, date(2015, 8, 20)).
registration('REG003', 'CH003', 3, 2005, date(2005, 9, 25)).
registration('REG004', 'CH004', 2, 2018, date(2023, 7, 12)).

% Insurance
insurance('POL001', 1, date(2023, 7, 12), 1000000, 'ABC Insurance', 'Agent Smith').
insurance('POL002', 2, date(2023, 7, 12), 800000, 'XYZ Insurance', 'Agent John').
insurance('POL003', 3, date(2018, 7, 12), 500000, 'ABC Insurance', 'Agent Smith').
insurance('POL004', 2, date(2023, 7, 12), 2000000, 'ABC Insurance', 'Agent Alex').



% split([], [], []).                  % Base case: empty list results in two empty lists.

% split([H|T], [H|Pos], Neg) :-       % Case for positive numbers (including zero).
%     H >= 0,                         % If the head of the list is non-negative, it goes to the positive list.
%     split(T, Pos, Neg).

% split([H|T], Pos, [H|Neg]) :-       % Case for negative numbers.
%     H < 0,                          % If the head of the list is negative, it goes to the negative list.
%     split(T, Pos, Neg).             % Continue splitting for the tail.



% split([], [], []).                  % Base case: empty list results in two empty lists.

% split([H|T], [H|Pos], Neg) :-       % Case for positive numbers (including zero).
%     H >= 0, !,                      % If the head of the list is non-negative, it goes to the positive list.
%     split(T, Pos, Neg).

% split([H|T], Pos, [H|Neg]) :-       % Case for negative numbers.
%     split(T, Pos, Neg).             % Continue splitting for the tail.




% p(1).
% p(2):-!.
% p(3).






% % count(0,X,[]).
% % count(N,X,[H|T]):-H<X,count(P,X,T), N is P+1.
% % count(N,X,[H|T]):-H>=X,count(N,X,T).






% % % height/2 computes the height of BinaryTree
% % height(nil, 0).
% % height(tree(L, _, R), Height) :-
% %     height(L, LHeight),
% %     height(R, RHeight),
% %     max(LHeight, RHeight, MaxHeight),
% %     Height is MaxHeight + 1.

% % % max/3 succeeds if Max is the maximum of X and Y
% % max(X, Y, X) :- X >= Y.
% % max(X, Y, Y) :- X < Y.




% % % delete/3 removes X from Tree to produce NewTree
% % delete(nil, _, nil).
% % delete(tree(L, X, R), X, Tree) :- 
% %     delete_aux(tree(L, X, R), Tree).
% % delete(tree(L, Root, R), X, tree(L1, Root, R)) :- 
% %     X < Root, 
% %     delete(L, X, L1).
% % delete(tree(L, Root, R), X, tree(L, Root, R1)) :- 
% %     X > Root, 
% %     delete(R, X, R1).

% % % delete_aux handles different cases of node deletion
% % delete_aux(tree(nil, _, R), R).
% % delete_aux(tree(L, _, nil), L).
% % delete_aux(tree(L, _, R), tree(L, Min, R1)) :- 
% %     min(R, Min), 
% %     delete(R, Min, R1).

% % % min/2 finds the minimum element in a tree
% % min(tree(nil, X, _), X).
% % min(tree(L, _, _), Min) :- 
% %     min(L, Min).


% % % minimum/3 succeeds if Min is the minimum of X and Y
% % minimum(X, Y, X) :- X =< Y.
% % minimum(X, Y, Y) :- X > Y.

% % % min_list/2 finds the minimum element in a list
% % min_list([X], X).
% % min_list([X|Xs], Min) :-
% %     min_list(Xs, TailMin),
% %     minimum(X, TailMin, Min).

% % % remove_first/3 removes the first occurrence of an element from a list
% % remove_first(X, [X|Xs], Xs).
% % remove_first(X, [Y|Ys], [Y|Zs]) :-
% %     remove_first(X, Ys, Zs).

% % % selection_sort/2 performs selection sort
% % selection_sort([], []).
% % selection_sort(List, [Min|Sorted]) :-
% %     min_list(List, Min),
% %     remove_first(Min, List, Rest),
% %     selection_sort(Rest, Sorted).
% % :- op(600, xfx, was).
% % :- op(500, xfx, of).
% % :- op(400, fx, the).

% % % Fact representation
% % X was Y :- fact(X, Y).

% % % Query predicates
% % who(X, Y) :- fact(X, Y).
% % what(X, Y) :- fact(X, Y).

% % % Example fact
% % fact(diana, the secretary of the department).
% % % f(1,one).
% % % f(s(1),two).
% % % f(s(s(1)),three).
% % % f(s(s(s(X))),N):-f(X,N).

% % % % regular(rectangle((X1, Y1), (X2, Y2), (X3, Y3), (X4, Y4))) :-
% % % %     X1 =:= X2,   % Vertical side between P1 and P2
% % % %     Y2 =:= Y3,   % Horizontal side between P2 and P3
% % % %     X3 =:= X4,   % Vertical side between P3 and P4
% % % %     Y4 =:= Y1.   % Horizontal side between P4 and P1
