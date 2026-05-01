block(X, Y, N):- number(X, Y, N).
% achievement: Identify all blocks in the game

gray(X, Y):- area(X,Y,_).
% achievement: Identify all valid ending areas

straight(X, Y, XX, Y) :- cell(X, Y), cell(XX, Y), X != XX.
straight(X, Y, X, YY) :- cell(X, Y), cell(X, YY), Y != YY.
% achievement: Identify all straight paths

legal_target(X, Y, XX, YY) :- block(X, Y, _), gray(XX, YY), straight(X, Y, XX, YY).
% achievement: Determine all legal target positions for each block

{ target(X, Y, XX, YY) : legal_target(X, Y, XX, YY) } = 1 :- block(X, Y, _).
% achievement: Select exactly one legal target position for each block

in_area(A) :- target(_, _, X, Y), area(X, Y, A).
% achievement: Determine which areas contain target positions
:- area(_, _, A), not in_area(A).
% achievement: Disallow areas that are not covered by target positions

#show target/4.