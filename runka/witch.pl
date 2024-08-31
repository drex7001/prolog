%some common knowledge about witch
witch(X) :- female(X), hasWart(X), turnedIntoNewt(X,Y).
warlock(X) :- male(X), hasWart(X), turnedIntoNewt(X,Y).

turnedIntoNewt(X,Y) :- wasNewt(Y), not(gotBetter(Y)).

%the mob has come to us with some facts.....
female(glenda).
hasWart(glenda).

male(steve).
wasNewt(steve).
gotBetter(steve).