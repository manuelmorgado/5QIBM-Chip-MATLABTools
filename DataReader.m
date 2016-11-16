%Read data from quantum experience
%Manuel Morgado
%November 2016

clear all;
clc;

Gengates;

%File details and management 
folder = '/Users/Manuel/Documents/USB/Tesis/Papers/QC/Database/';
sGate = {'X', 'Y', 'Z', 'H', 'S', 'Sd', 'T', 'CNOT'};
gate = sGate{1};
sShots = [1 1024 4096 8192];
nShots = int2str(sShots(1));
gnr = 1;
fName = 'distributionCSV';
ext = '.csv';
nr = 1;
key = 0;
fileError = fopen('/Users/Manuel/Desktop/5QIBM-Chip-MATLABTools/Error_Reports/ErrorReport.txt','wt');

%Loop for every gate of Universal Set
for g = 4:4;
    gate = sGate{g}

    %Loop for any number of shots
    for s = 1:4;
        nShots = int2str(sShots(s))

        %Loop for nr of gates, max 20 runs
        for nr = 1:20;

            %Loop for runs, max 39 gates
            for gnr = 39:39;
 
                %Open every data file
                try
                
                %Seting directory and file
                file = [folder, gate, '/', nShots, '/', int2str(nr), '/', ...
                    int2str(gnr), '/', fName, ext];
                
                %Reading spreedsheet
                [shots, val, prob, measu]  = csvimport(file, 'columns', ...
                    {'Shots', 'Value', 'Probability', 'Qubits Measured'});
                
                %Building data
                if key == 0;
                    Shots = shots; Value = val; Probability = prob; QubitMeasured = measu;
                    key=1;
                else
                    Shots = cat(1,Shots,shots);
                    Value = cat(1,Value,val);
                    Probability = cat(1,Probability,prob);
                    QubitMeasured = cat(1,QubitMeasured,measu);
                   
                end
                
                %Jump missing files with warning message
                catch
                    fprintf(fileError,'File Gate %s : Shot %s : Gates # %s : Run %s is missing. Please Check.\n',sGate{g},int2str(sShots(s)),int2str(gnr),int2str(nr));
%                     disp('Execution will continue.');
                end
            end
        end
    end
    
    %Insert cutoff for each gate
    
    %Build Data matrix and compute average Fidelity using States
    Data1 = DataAnalyzer(Probability,dm{g});
    aveFid = sum(Data1(:,3))/length(Data1(:,3));
    
    %Computation of alfaProm, betaProm, rhoProm, fidFProm
    alfaProm = sum(Data1(:,1))/length(Data1(:,3));
    betaProm = sum(Data1(:,2))/length(Data1(:,3));
    rhoProm = mDen([alfaProm betaProm]);
    fidFProm = fidGate(rhoProm,dm{g},2);
    Data2 = [alfaProm betaProm fidFProm];
    
    Data = cat(1,Data1,Data2,[0 0 aveFid]);
    
    eMatrices = ErrorMatrix(listGates{g}, rhoProm, aveFid);
    
    %Saving data in .txt file
    fileData = ['/Users/Manuel/Desktop/5QIBM-Chip-MATLABTools/Data/Data',sGate{g},'_Data.csv'];
    dlmwrite(fileData,Data, 'delimiter', ',', 'precision', 32);
end
fclose(fileError);