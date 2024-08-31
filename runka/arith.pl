good(green,N) :- N =< 10.
good(red,N) :- N = 2.
good(blue,N) :- X is (N*10)-18, X >= 5.
%good(red,N) :- N is 22.