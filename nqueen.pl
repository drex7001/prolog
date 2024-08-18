% Main predicate to solve the N-Queens problem
solve_n_queens(N, Solution) :-
    length(Solution, N),          % Create a list of length N
    Solution ins 1..N,            % Ensure that each element (queen's position) is between 1 and N
    all_different(Solution),      % Ensure no two queens are in the same column
    safe_queens(Solution),
    label(Solution).              % Label the solution (assign actual values)

% Predicate to ensure that no two queens can attack each other diagonally
safe_queens([]).
safe_queens([Q|Others]) :-
    safe_queens(Others),
    no_attack(Q, Others, 1).

% Predicate to check if the queen at position Q does not attack others
no_attack(_, [], _).
no_attack(Q, [Q1|Others], Dist) :-
    Q #\= Q1 + Dist,              % Check that Q is not in the same diagonal as Q1
    Q #\= Q1 - Dist,              % Check that Q is not in the opposite diagonal as Q1
    Dist1 #= Dist + 1,
    no_attack(Q, Others, Dist1).

% Run the solution
?- solve_n_queens(8, Solution), write(Solution), nl.
