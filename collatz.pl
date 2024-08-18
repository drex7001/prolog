% Define the Collatz relation
collatz(1, [1]).
collatz(N, [N|Seq]) :-
    N > 1,
    (N mod 2 =:= 0 ->
        Next is N // 2;
        Next is 3 * N + 1),
    collatz(Next, Seq).

% Query example
% To get the Collatz sequence for a number, for example 6:
% ?- collatz(6, Seq).