%Density matrix
%Manuel Morgado
%November 2016

function output = mDen(state)

%Computing alfa
alfa = 1/sqrt((state(1,1))^2 + (state(1,2))^2);

%Normalizinf vector
vectN = alfa*state;

%Computing Density Matrix
output = transpose(vectN)*vectN;