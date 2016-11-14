% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Binario a Vector.
% 
% Entradas: un string binario.
% Salida: en un vector de estado.

function phi = bin2vec(bin)
dec=bin2dec(bin);
phi=dec2vec(dec,length(bin));