% Facts
parent(john, mary).
parent(mary, susan).
parent(susan, jim).

% Rule: X is a grandparent of Y if X is a parent of Z and Z is a parent of Y
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

% Rule: X is a sibling of Y if they share a parent and X is not Y
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \== Y.

% Rule: X is a cousin of Y if their parents are siblings
cousin(X, Y) :- parent(A, X), parent(B, Y), sibling(A, B).

% Rule: X is an ancestor of Y if X is a parent of Y or X is a parent of an ancestor of Y
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

% Check if a list contains only positive numbers
all_positive([]).
all_positive([Head | Tail]) :- Head > 0, all_positive(Tail).

% Negation example: X is not a parent of Y
not_parent(X, Y) :- \+ parent(X, Y).

% Arithmetic example: calculate the square of a number
square(X, Y) :- Y is X * X.
