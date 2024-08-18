/*
parent(ya,jim).
parent(xa,ya).
grandparent(ya,jim).


parent(tom, bob).
parent(pam, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).
*/

% Facts
parent(john, mary).
parent(mary, susan).
parent(susan, alice).

% Rules
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

% Define male individuals
male(albert).
male(john).
male(michael).
male(samuel).
male(george).

% Define female individuals
female(nirmali).
female(patricia).

% Define lesbian relationship
lesbian(X, Y) :- 
    female(X), 
    female(Y), X \= Y.

% Query to find all combinations of lesbians
find_lesbians(X, Y) :- lesbian(X, Y).






/*female(ann).
female(elizabeth).
female(kate).
female(liz).
female(sarah).
*/