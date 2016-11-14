% Universidad Simon Bolivar
% Autor: Geza Toth
% Modificacion: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Vector a Estructura.
% 
% Entradas: Vector de estado.
% Salida: Estructura del vector.

function s = vec2struct(phi)

n=log2(size(phi,1));
cond_bool(n==floor(n));

in=find(phi~=0); %nonzero

for i=1:length(in)

    dec = in(i)-1;
    s(i).bin = dec2bin(dec,n);
    s(i).alpha = phi(in(i));
    
end
