% Encoding a solver for the Yosenabe game.For this question we have to provide an encoding that moves all blocks into gray areas such that the movement of the block is made in straitgh line. We ignore for now all the other restrictions of the game.

block(X, Y, N):- number(X, Y, N).
% achievement: Identify all blocks in the game

gray(X, Y):- area(X,Y,_).
% achievement: Identify all valid ending areas

straight(X, Y, XX, Y):- cell(X, Y), cell(XX, Y), X != XX.
straight(X, Y, X, YY):- cell(X, Y), cell(X, YY), Y != YY.
% achievement: Identify all straight paths

legal_target(X, Y, XX, YY):- block(X,Y,_), gray(XX, YY), straight(X, Y, XX, YY).
% achievement: Determine all legal target positions for each block

{ target(X, Y, XX, YY) : legal_target(X, Y, XX, YY) } = 1 :- block(X, Y, _).
% achievement: Select exactly one legal target position for each block

#show target/4.