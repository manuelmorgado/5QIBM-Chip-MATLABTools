% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Genera estado 0 o 1.
% 
% Entradas: Qubit base.
% Salida: Qubit.

function v=q(n)
if n
    v=[0;1];
else
    v=[1;0];
end
