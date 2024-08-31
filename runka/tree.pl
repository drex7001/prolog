max(X, Y, X) :- X >= Y.
max(X, Y, Y) :- X < Y.
list_max([H], H).
list_max([H|T], Max) :- list_max(T, P), max(H, P, Max).