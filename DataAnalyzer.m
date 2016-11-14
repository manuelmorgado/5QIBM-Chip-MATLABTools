%Analyse data from DataReader
%Manuel Morgado
%November 2016

function output = DataAnalyzer(data)
    %Histogram of data
%     hist(data,nbins);
    %Fit of histogram
%     histfit(data, nbins, dist);
    
    %Plot scatter
%     scatter(x,y)
    
    %Plot bars
%     bars()
%     bars3()
    
    %Plot data
%     plot()
    
    %Calculing Gate Fidelity
    format long
    [i,j] = size(data);
    states = zeros(i/2,2);
    fidelityGate = zeros(i/2,1);
    alfa = zeros(i/2,1);
    k = round(i/2);
    
    V = [1:1:k; 1:2:i];
    
    for iv = V;

        %Save states in vectors
        states(iv(1),1) = data(iv(2));
        states(iv(1),2) = data(iv(2)+1);
    
        %Computing density matrix
%         mdComp = mDen(1/sqrt(2)*[1 1]);
        mdComp = mDen([0 1]);
        mdState = mDen(states(iv(1),:));
        
        %Computiing Gate Fidelity
        fidelityGate(iv(1)) = fidGate(mdState,mdComp,1);
    end
    output = cat(2,states,alfa,fidelityGate); 