%Error computation
%Manuel Morgado
%November 2016

sswitch=0;

while sswitch==0;
    %Ask for random numbers
    key = 0;
        while key==0;
            nRi = random('uniform',0,1,1,2);
            if nRi(1)>=0 && nRi(2)>=0
                if (nRi(1)<=1 && nRi(2)<=1)
                    key = 1;
                end
            else
                key = 0;
            end
        end

    %Defining aleatory numbers for operator
    p = nRi(1);
    a = nRi(2);

    %Defining a operator matrix error
    E = [p a;a 1-p];

    %Defining gate
    gate = X;

    %Defining initial state
    stateI = [1 0];

    %Define final state
    stateF = stateI*gate;

    %Computing candidate state
    candS = stateF*E;

    %Computing Density Matrix of candidate
    rhoCand = mDen(candS);

    %Computing Density Matrix of Theoretical output
    rhoTeo = mDen(stateF);

    %Computing Gate Fidelity of candidate
    candFid = fidGate(rhoCand,rhoTeo,1);

    %Define experimental Gate Fidelity
    expFid = 0.707466976132757;
    % expFid = 0.92936;
    
    cond = abs(expFid-candFid);
    if cond<5E-5
        E,candFid,a,p
%         key = 1;
    end
end