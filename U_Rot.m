% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Compuerta de Rotacion.
% 
% Entradas: Angulo de rotacion y eje sobre el cual se hace rotacion.
% Salida: Compuerta de rotacion de angulo.

function rot = U_Rot(a,C)
    if C==0
        rot = [1 0;0 exp(i*a)];
    else
        rot = cos(a)*eye(2) - i*sin(a)*C;
    end
end
