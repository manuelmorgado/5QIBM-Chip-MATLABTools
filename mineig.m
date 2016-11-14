% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Minimos autovalores.
% 
% Entradas: Matriz M.
% Salida: Autovalores minimos.

function m=mineig(M)

m=min(real(eig(M)));

