% Universidad Simon Bolivar
% Autor: Geza Toth
% Modificacion: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Decimal a vector.
% 
% Entradas: entrada decimal y tamano.
% Salida: vector con numero de bits definidos.

function phi=dec2vec(dec,n)
cond_bool(dec<=2^n-1, 'dec too big for register size n!');
phi=zeros(2^n,1);
phi(dec+1)=1; 