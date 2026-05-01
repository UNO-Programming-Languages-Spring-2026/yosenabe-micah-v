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

path(X, Y, XX, Y, H, Y) :- target(X, Y, XX, Y), cell(H, Y), X < XX, X <= H, H <= XX.
path(X, Y, XX, Y, H, Y) :- target(X, Y, XX, Y), cell(H, Y), XX < X, XX <= H, H <= X.
% achievement: Identify all horizontal paths between target cells

path(X, Y, X, YY, X, V) :- target(X, Y, X, YY), cell(X, V), Y < YY, Y <= V, V <= YY.
path(X, Y, X, YY, X, V) :- target(X, Y, X, YY), cell(X, V), YY < Y, YY <= V, V <= Y.
% achievement: Identify all vertical paths between target cells

:- target(X1, Y1, XX1, YY1), target(X2, Y2, XX2, YY2), (X1, Y1) != (X2, Y2), path(X1, Y1, XX1, YY1, H, V), path(X2, Y2, XX2, YY2, H, V).
% achievement: Disallow shared paths

#show target/4.