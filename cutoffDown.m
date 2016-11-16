%Cutoff DOWN data for histograms
%Manuel Morgado
%November 2016

function vec = cutoff(data,cut)

[n,m] = size(data);
dCut = zeros(n,1);
vec = [];

for i=1:n
  [dCut(i),idx] = min(data);
  if dCut(i) < cut
    vec = cat(1,vec,dCut(i));
  end
    data(idx) = [];
end