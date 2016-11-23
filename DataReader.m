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

fileError = fopen('/Users/Manuel/Desktop/5QIBM-Chip-MATLABTools/Error_Reports/ErrorReport.txt','wt');

%Loop for every gate of Universal Set 1 to 8
for g =8:8;
    gate = sGate{g};
    key = 0;
    %Loop for any number of shots (1, 1024, 4096, 8192)
    for s = 4:4;
        nShots = int2str(sShots(s));
        clc;
        disp('Importing data...')
        ['Importing gate ', gate,' with ', nShots, ' shots. '] 
        pause(1)
        %Loop for nr of gates, max 20 runs
        for nr = 1:1;

            %Loop for runs, max 39 gates
            for gnr = 1:1;
 
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

    %Build Data2 and ompute alfaProm, betaProm, rhoProm, fidFProm
    alfa2Prom = sum(Data1(:,1))/length(Data1(:,3));
    beta2Prom = sum(Data1(:,2))/length(Data1(:,3));
    rhoProm = mDen([sqrt(alfa2Prom) sqrt(beta2Prom)]);
    fidFProm = fidGate(rhoProm,dm{g},2);
    Data2 = [alfa2Prom beta2Prom fidFProm];

    disp('Building data...')
    %Build all Data structure
    Data = cat(1,Data1,Data2,[0 0 aveFid]);

    disp('Computing errors...')
    %Compute the Probability for get a density matrix from Experiment
%     eMatrices = interfError(listGates{g}, rhoProm);

    %Saving data in .csv file
    fileData = ['/Users/Manuel/Desktop/5QIBM-Chip-MATLABTools/Data/Data',sGate{g},'_Data.csv'];
    dlmwrite(fileData,Data, 'delimiter', ',', 'precision', 32);
end
fclose(fileError);
disp('Done! :)')