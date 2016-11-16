%Analyse data from DataReader
%Manuel Morgado
%November 2016



function output = DataAnalyzer(data,mdComp)
    
    %Calculing Gate Fidelity
    format long
    [i,j] = size(data);
    states = zeros(i/2,2);
    fidelityGate = zeros(i/2,1);
    k = round(i/2);
    
    V = [1:1:k; 1:2:i];
    
    for iv = V;

        %Save states in vectors
        states(iv(1),1) = data(iv(2));
        states(iv(1),2) = data(iv(2)+1);
    
        %Computing density matrix
        mdState = mDen(states(iv(1),:));
        
        %Computiing Gate Fidelity
        fidelityGate(iv(1)) = fidGate(mdState,mdComp,2);
    end
    output = cat(2,states,fidelityGate); 