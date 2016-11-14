%Read data from quantum experience
%Manuel Morgado
%November 2016

clear all;
clc;

%File details and management 
folder = '/Users/Manuel/Documents/USB/Tesis/Papers/QC/Data/';
sGate = {'X', 'Y', 'Z', 'H', 'S', 'Sd', 'T', 'CNOT'};
gate = sGate{1};
sShots = [1 1024 4096 8192];
nShots = int2str(sShots(1));
gnr = 1;
fName = 'distributionCSV';
ext = '.csv';
nr = 1;
key = 0;
fid2 = fopen('/Users/Manuel/Desktop/ErrorReport.txt','wt');

%Seting directory and file
% file = [folder, gate, '/', nShots, '/', int2str(gnr), '/', ...
%     int2str(nr), '/', fName, ext];
%, int2str(nr),ext];

%Reading spreedsheet
% [shots, val, prob, measu]  = csvimport(file, 'columns', ...
%     {'Shots', 'Value', 'Probability', 'Qubits Measured'});

%Saving first record
% Shots = shots; Value = val; Probability = prob; QubitMeasured = measu;

%Loop for every gate of Universal Set
for g = 1:1;
    gate = sGate{g}

    %Loop for any number of shots
    for s = 1:4;
        nShots = int2str(sShots(s))

        %Loop for nr of gates, max 20 runs
        for nr = 1:20;

            %Loop for runs, max 39 gates
            for gnr = 1:39;
 
                %Open every data file
                try
                
                %Seting directory and file
                file = [folder, gate, '/', nShots, '/', int2str(nr), '/', ...
                    int2str(gnr), '/', fName, ext];
                
                %Reading spreedsheet
                [shots, val, prob, measu]  = csvimport(file, 'columns', ...
                    {'Shots', 'Value', 'Probability', 'Qubits Measured'});
                
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
                    fprintf(fid2,'File Gate %s : Shot %s : Gates # %s : Run %s is missing. Please Check.\n',sGate{g},int2str(sShots(s)),int2str(gnr),int2str(nr));
%                     disp('Execution will continue.');
                end
            end
        end
    end
end
fclose(fid2);