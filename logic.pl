% Title  : Logic
% Desc   : Using prolog to build logic gates and bit adder
% Author : Trevor Ransom
% Date   : 12/15/2021

% and logic gate, when A and B are 1, C is 1. When A and B are 0, C is
% 0. Both A and B must be one in order for the output to be one
and(A,B,C) :-

    A + B =< 1
    -> C = 0
    ;C = 1.
% or logic gate. When a A or B equal 1 C is 1
or(A,B,C) :-

    A + B >= 1
    -> C = 1
    ;C = 0.
% Exclusive or. When A and B = 1, C = 0 and when A and B = 0, C = 0
% otherwise functions like an or
xor(A,B,C):-
    A + B =:= 2
    -> C = 0
    ; A + B =:= 1
    -> C =1
    ;C = 0.
% not logic gate when A = 1, C =0 and visa versa
not(A,C) :-
    A = 1
    -> C = 0
    ;C = 1.
% full adder function using logic gates above
fulladdr(A,B,X,S,C):-
    xor(A,B,X1),
    or(A,B,X2),
    and(X,X2,X5),
    and(A,B,X3),
    or(X5,X3,C),
    xor(X1,X,S).
