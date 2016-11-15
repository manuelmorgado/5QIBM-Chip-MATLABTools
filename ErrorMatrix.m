%Define Initial State
StateI = [1 0];

%Define Final State
StateF = StateI*gate;

%Compute density matrix 
rhoTeo = mDen(stateF);

%Compute RhoNoise
rhoNoi = (1/(1-p))*rhoExp - p*rhoTeo;

