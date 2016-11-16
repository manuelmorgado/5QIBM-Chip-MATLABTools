%Ploting Data
%Manuel Morgado
%November 2016

function out = PlotData(data,nbins,dist)
%Histogram of data
hist(data,nbins);
%Fit of histogram
histfit(data, nbins, dist);

%Plot scatter
scatter(data)

%Plot bars
bars(data)
bars3(data)

%Plot data
plot(data)