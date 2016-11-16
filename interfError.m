%Computing Probability and Matrix Noise error
%Manuel Morgado
%November 2016


function eMatrices = interfError(gate, rhoExp)

Gengates;

eMatrices = {};


%Define Final State
StateF = StateI*gate;

%Compute density matrix 
rhoTeo = mDen(StateF);

%Check which probability works better
for p=0:0.000001:1;
    rhoNoi = mNoi(rhoTeo,p);
    
    %Compare element of interference in the Noise and Experimental Matrix
    if abs(rhoNoi(1,2)-rhoExp(1,2))<1E-6
        buf = {rhoNoi p};
        eMatrices = cat(1,eMatrices,buf);      
    end
    

end
        
end 
