% N-Queens Problem Solver (Updated)

% Main predicate to solve N-Queens problem
solve_n_queens(N, Queens) :-
    length(Queens, N),
    range(1, N, Rows),
    permutation(Rows, Queens),
    safe_queens(Queens).

% Check if all queens are safe
safe_queens(Queens) :-
    safe_queens(Queens, 1, []).

safe_queens([], _, _).
safe_queens([Q|Qs], Col, DiagDiffs) :-
    safe_queen(Q, Col, DiagDiffs),
    Col1 is Col + 1,
    safe_queens(Qs, Col1, [Q-Col|DiagDiffs]).

% Check if a single queen is safe
safe_queen(_, _, []).
safe_queen(Q, Col, [Diff-PrevCol|DiagDiffs]) :-
    Q =\= Diff,
    abs(Q - Diff) =\= abs(Col - PrevCol),
    safe_queen(Q, Col, DiagDiffs).

% Generate a range of numbers
range(Min, Max, [Min|Rest]) :-
    Min < Max,
    Next is Min + 1,
    range(Next, Max, Rest).
range(Max, Max, [Max]).

% Example usage:
% ?- solve_n_queens(8, Queens).
% Queens = [1, 5, 8, 6, 3, 7, 2, 4] ;
% (more solutions...)