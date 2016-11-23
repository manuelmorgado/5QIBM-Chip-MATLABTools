%Fidelity Gate using density matrices
%Manuel Morgado
%November 2016

function output = fidGate(mS,mC,n)
ms = ketbra2(mS);
mC = ketbra2(mC);
output=(1/n)*trace(sqrt((sqrt(mC))*(mS)*(sqrt(mC))));