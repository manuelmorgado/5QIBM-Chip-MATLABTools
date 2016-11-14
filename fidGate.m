%Fidelity Gate
%Manuel Morgado
%November 2016

function output = fidGate(mS,mC,n)

output=(1/n)*trace(sqrt((sqrt(mC))*(mS)*(sqrt(mC))));