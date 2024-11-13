%QUESTION 1
% Base case: X is the head of the list, so X is an element of the list.
element_of(X, [X | _]).

% Recursive case: X is an element of the tail if X is not the head.
element_of(X, [_ | Tail]) :-
    element_of(X, Tail).

%QUESTION 2
first(E, [E | _]).

%QUESTION 3
% Base case: the last element of a single-element list is that element itself.
last([X], X).

% Recursive case: move down the list by calling last on the tail.
last([_ | Tail], X) :-
    last(Tail, X).

%QUESTION 4
% Base case: the penultimate element of a list with only two elements is the first element.
penultimate([X, _], X).

% Recursive case: move down the list by calling penultimate on the tail.
penultimate([_| Tail], X) :-
    penultimate([Tail], X).

%QUESTION 5
% Base case: if K is 1, we remove the head of the list.
del_k(X, [X|Tail], 1, Tail).

% Recursive case: decrement K and traverse the list to find the Kth element.
del_k(X, [Head|Tail], K, [Head|NewTail]) :-
    K > 1,
    K1 is K - 1,
    del_k(X, Tail, K1, NewTail).


%QUESTION 6
% Base case: an empty list has length 0.
length([], 0).

% Recursive case: the length of the list is 1 plus the length of the tail.
length([_|Tail], N) :-
    length(Tail, N1),
    N is N1 + 1.

%QUESTION 7
% Base case: an empty list has an even number of elements.
even([]).

% Recursive case: if we can remove two elements, the list remains even.
even([_, _|Tail]) :-
    even(Tail).

%QUESTION 8
% Base case: concatenating an empty list with L gives L.
concat([], L, L).

% Recursive case: add the head of L1 to the result of concatenating the tail.
concat([Head|Tail], L2, [Head|L3]) :-
    concat(Tail, L2, L3).

%QUESTION 9
% A list is a palindrome if it is equal to its reverse.
palindrome(L) :-
    reverse(L, L).

% Base case for reverse.
reverse([], []).

% Recursive case: add the head to the reversed tail.
reverse([Head|Tail], RevL) :-
    reverse(Tail, RevTail),
    concat(RevTail, [Head], RevL).
