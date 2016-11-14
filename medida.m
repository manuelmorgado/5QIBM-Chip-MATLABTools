% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Medir.
% 
% Entradas: Vector de estado.
% Salida: Vector de estado con 1 en la medida.

function [phi,obs]=medida(psi)

p = (abs(psi)).^2;
cf_assert(cf_approx(sum(p)-1, 0), 'Phi not normalised');

[sp,ip]=sort(p);
sp=cumsum(sp);

r = rand;

i=1;
while r>sp(i)
    i=i+1;
end

obs=ip(i);  

phi=zeros(size(psi));
phi(obs)=1;

