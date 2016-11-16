% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Fidelidad de estados.
% 
% Entradas: Matriz del estado 1 y 2.
% Salida: Fidelidad entre ambos estados.

function fidelity = fidelidad( edo1, edo2 )

fidelity = (trace(sqrt(sqrt(edo1)*edo2*sqrt(edo1))));


end

