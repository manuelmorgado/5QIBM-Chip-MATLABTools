%Module function without zero

function modulo=md(x,m)
modulo=mod(x,m);
if modulo == 0
    modulo=m;
end
