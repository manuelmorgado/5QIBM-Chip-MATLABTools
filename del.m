%Deleting data
%Manuel Morgado
%November 2016

function vec = del(data, cut)

[n,m] = size(data);
dCut = zeros(n,1);
vec = [];

for i=1:n
    if data(i)>cut
        vec = cat(1,vec,data(i))
    end
end
end
