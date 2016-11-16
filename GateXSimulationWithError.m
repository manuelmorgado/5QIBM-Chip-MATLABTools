%Simulation of X gate data with errors of IBM
%Manuel Morgado
%November 2016

clc;

%Run gengates.m
% load gengates;

%Define States
stateI = [1 0];
% stateI = [0 1];

%Define gate
gate = X;
% gate = H;

%Define experimental Gate Fidelity
expFid = 0.707466976132757;
% expFid = 0.92936;

%Compute final state
stateF = stateI*gate;

%Computing Density Matrix of Theoretical output
rhoTeo = mDen(stateF);

i = 0;
j = 1;
while j == 1
    
    %Ask for random number between 0 and 1
    key = 0;
    while key==0;
        nRi = random('uniform',0,1);
        if nRi>=0.5 && nRi<=0.7
            key = 1;
        else
            key = 0;
        end
    end
    
    
    %Computing probability counterpart 1-p
    cpi = 1 - nRi;
    state = [cpi nRi];
    
    %Computing Density Matrix of i-esim Simulate out
    rhoiSim = mDen(state);

    %Computing i-esim Gate Fidelity
    gateiFidelity = fidGate(rhoiSim,rhoTeo,1);
    
    %Indexing nRi, cpi, rhoiSim, gateiFidelity
    if i == 0
        cond = abs(expFid-gateiFidelity);
        if cond>=1E-5
            if cond<=1E-4
                i = i+1;
%                 cond
                gFidelity = gateiFidelity;
                nR = nRi;
                cp = cpi;

                %Computing average of the cumulate of Gate Fidelity
                aveFid = gFidelity;
            end
        end
    else
        gFidelityBuffer = cat(1,gFidelity,gateiFidelity);
        aveFidBuffer = sum(gFidelityBuffer)/i;
        cond2 = abs(expFid-aveFidBuffer);
        if cond2>=1E-5
            if cond2<=1E-4
                i = i+1;
%                 cond2
                gFidelity = gFidelityBuffer;
                nR = cat(1,nR,nRi);
                cp = cat(1,cp,cpi);

                %Computing average of the cumulate of Gate Fidelity
                aveFid = sum(gFidelity)/i;
                
            end
        elseif cond2<1E-5
            [sx sy] = size(gFidelity);
            sx
            if sx > 5000
                j = 0;

            end
        end
    end
    
end


%Computing the average for Gate Fidelity of all elements
aveFid = sum(gFidelity)/i

%Computing the average of all alfas and betas
avenR = sum(nR)/i;
avecp = sum(cp)/i;

%Computing Density Matrix of average of alfas and betas
rhoEsim = mDen([avecp avenR]);

