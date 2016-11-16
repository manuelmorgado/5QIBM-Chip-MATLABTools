%Computing Matrix Error of data
%Manuel Morgado
%November 2016


function NoiseMatrices = ErrorMatrix(gate, rhoExp, aveFid)

Gengates;

NoiseMatrices = {};
key = 1;
%Define Initial State
% StateI = [1 0];

%Define Final State
StateF = StateI*gate;

%Compute density matrix 
rhoTeo = mDen(StateF);
while key==1;
    %Ask for random probability 'p'
%     key = 0;
%         while key==0;
%             p = random('uniform',0,1);
%             if p>=0.5 && p<=0.7
%                 key = 1;
%             else
%                 key = 0;
%             end
%         end
    

    %Compute RhoNoise
    rhoNoi = (1/(1-p))*rhoExp - p*rhoTeo;

    %Compute RhoFinal in order to compute the Fidelity with Experiment
    rhoF = (1-p)*rhoNoi + p*rhoTeo;

    %Compute the Fidelity between rhoF and rhoExp
    gFidelity = fidGate(rhoF,rhoTeo,2);

    if gFidelity<=aveFid
        if gFidelity>=fidFProm
            %Check components of rhoFinal are close to experimental
            for i=1:2
                for j=1:2
                    if (rhoF(i,j)-rhoExp(i,j))<=1E-3
                        count=count+1;
                    end
                end
            end

            %If all elements are close to rhoExp, then save the rhoFinal
            if count==4
                disp('Guardado')
                NoiseMatrices = cat(1,NoiseMatrices,rhoF);
                key=0;
            end
        end
    end
        
end   