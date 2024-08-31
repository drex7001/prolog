% Define the top-level structure of a sentence
sentence --> noun_phrase, verb_phrase.

% Define a noun phrase (can include an article and a noun)
noun_phrase --> article, noun.

% Define a verb phrase (can include a verb and a noun phrase)
verb_phrase --> verb, noun_phrase.

% Define articles
article --> [the].
article --> [a].

% Define some nouns
noun --> [cat].
noun --> [dog].
noun --> [mouse].

% Define some verbs
verb --> [chases].
verb --> [sees].


% Predicate to parse a sentence
parse_sentence(Sentence) :-
    sentence(Sentence, []).

% Example query:
% ?- parse_sentence([the, cat, chases, the, mouse]).
% This should return true.



% Define the top-level structure with semantics
sentence(s(NP, VP)) --> noun_phrase(NP), verb_phrase(VP).

% Define noun phrase with semantics
noun_phrase(np(Det, N)) --> article(Det), noun(N).

% Define verb phrase with semantics
verb_phrase(vp(V, NP)) --> verb(V), noun_phrase(NP).

% Define articles with semantics
article(det(the)) --> [the].
article(det(a)) --> [a].

% Define some nouns with semantics
noun(n(cat)) --> [cat].
noun(n(dog)) --> [dog].
noun(n(mouse)) --> [mouse].

% Define some verbs with semantics
verb(v(chases)) --> [chases].
verb(v(sees)) --> [sees].

% Example query:
% ?- sentence(Tree, [the, cat, chases, the, mouse], []).
% This should return Tree = s(np(det(the), n(cat)), vp(v(chases), np(det(the), n(mouse)))).



% Knowledge base
fact(cat, chases, mouse).
fact(dog, sees, cat).

% Query predicate
query(S) :-
    sentence(s(np(_, n(Subject)), vp(v(Verb), np(_, n(Object)))), S, []),
    fact(Subject, Verb, Object).

% Example query:
% ?- query([the, cat, chases, the, mouse]).
% This should return true because it matches the fact in the knowledge base.
