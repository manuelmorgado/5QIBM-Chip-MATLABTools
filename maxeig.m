% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Maximos autovalores.
% 
% Entradas: Matriz M.
% Salida: Maximos autovalores de matriz M.

function m=maxeig(M)

m=max(real(eig(M)));

