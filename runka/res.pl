% Facts about people and their hobbies
person(alice, 20).
person(bob, 21).
person(charlie, 23).
person(dave, 20).

hobby(alice, programming).
hobby(alice, birdwatching).
hobby(bob, larping).
hobby(charlie, larping).
hobby(charlie, birdwatching).
hobby(dave, birdwatching).

% Rule to determine if two people can be friends
friends(Person1, Person2) :-
    hobby(Person1, Hobby),
    hobby(Person2, Hobby),
    Person1 \= Person2,
    person(Person1, Age1),
    person(Person2, Age2),
    AgeDiff is abs(Age2 - Age1),
    AgeDiff =< 2.
