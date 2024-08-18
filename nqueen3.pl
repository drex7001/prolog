% N-Queens Problem Solver with Board Printing

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

% Print the chessboard
print_board(Queens) :-
    length(Queens, N),
    print_board(Queens, 1, N).

print_board(_, Row, N) :- 
    Row > N, !.
print_board(Queens, Row, N) :-
    print_row(Queens, Row, 1, N),
    nl,
    NextRow is Row + 1,
    print_board(Queens, NextRow, N).

print_row(_, _, Col, N) :- 
    Col > N, !.
print_row(Queens, Row, Col, N) :-
    (nth1(Col, Queens, Row) -> write('Q ') ; write('. ')),
    NextCol is Col + 1,
    print_row(Queens, Row, NextCol, N).

% Solve and print all solutions
solve_and_print_all(N) :-
    findall(Queens, solve_n_queens(N, Queens), AllSolutions),
    length(AllSolutions, Count),
    format('Found ~w solutions for ~w-Queens problem:~n', [Count, N]),
    print_all_solutions(AllSolutions, 1).

print_all_solutions([], _).
print_all_solutions([Queens|Rest], SolutionNumber) :-
    format('Solution ~w:~n', [SolutionNumber]),
    print_board(Queens),
    nl,
    NextSolutionNumber is SolutionNumber + 1,
    print_all_solutions(Rest, NextSolutionNumber).

% Example usage:
% ?- solve_and_print_all(8).