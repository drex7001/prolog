% Base case: If the number is 1, the sequence ends.
collatz(1) :- write(1), nl.

% If the number is even, divide it by 2 and continue the sequence.
collatz(N) :-
    N > 1,
    N mod 2 =:= 0,
    write(N), write(' -> '),
    N1 is N // 2,
    collatz(N1).

% If the number is odd, multiply it by 3 and add 1, then continue the sequence.
collatz(N) :-
    N > 1,
    N mod 2 =\= 0,
    write(N), write(' -> '),
    N1 is 3 * N + 1,
    collatz(N1).
