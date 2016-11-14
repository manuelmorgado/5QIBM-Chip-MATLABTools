%Gate Operations with errors
%Manuel Morgado
%November 2016

function fState = eGate(gate,state)

%Generating random number for noise
error = random('Normal',0,1,1,2);

%Computing final State
eState = state*gate;

%Introducing error
eState(1) = eState(1)*error(1);
eState(2) = eState(2)*error(2);

fState = eState/sum(eState);