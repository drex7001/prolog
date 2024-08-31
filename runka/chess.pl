% solution(Position) is true if Position is a valid solution
% to the eight queens problem
solution(Position) :-
    Position = [_,_,_,_,_,_,_,_],
    valid_queens(Position),
    safe_queens(Position).

% valid_queens(Position) is true if each queen is on a valid square
valid_queens([]).
valid_queens([Queen|Others]) :-
    between(1, 8, Queen),
    valid_queens(Others).

% safe_queens(Position) is true if no two queens attack each other
safe_queens([]).
safe_queens([Queen|Others]) :-
    safe_queens(Others),
    no_attack(Queen, Others, 1).

% no_attack(Queen, Others, Dist) is true if Queen does not attack
% any queen in Others. Dist is the row distance.
no_attack(_, [], _).
no_attack(Queen, [Other|Others], Dist) :-
    Queen =\= Other,
    abs(Queen - Other) =\= Dist,
    NextDist is Dist + 1,
    no_attack(Queen, Others, NextDist).
% % solution(Position) is true if Position is a valid solution
% % to the eight queens problem
% solution(Position) :-
%     Position = [_,_,_,_,_,_,_,_],
%     valid_queens(Position),
%     safe_queens(Position).

% % valid_queens(Position) is true if each queen is on a valid square
% valid_queens([]).
% valid_queens([Queen|Others]) :-
%     between(1, 8, Queen),
%     valid_queens(Others).

% % safe_queens(Position) is true if no two queens attack each other
% safe_queens([]).
% safe_queens([Queen|Others]) :-
%     safe_queens(Others),
%     no_attack(Queen, Others, 1).

% % no_attack(Queen, Others, Dist) is true if Queen does not attack
% % any queen in Others. Dist is the row distance.
% no_attack(_, [], _).
% no_attack(Queen, [Other|Others], Dist) :-
%     Queen =\= Other,
%     abs(Queen - Other) =\= Dist,
%     NextDist is Dist + 1,
%     no_attack(Queen, Others, NextDist).

% % Helper predicate to generate all solutions
% all_solutions(Solutions) :-
%     findall(Sol, solution(Sol), Solutions).