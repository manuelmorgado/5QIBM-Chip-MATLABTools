% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Oraculo.
% 
% Entradas: Funcion y numero de bits.
% Salida: Valor del oraculo.

function V_f = vf(f, n)

V_f = zeros(2^n);

for i=0:2^n-1
    V_f(i+1,i+1)=(-1)^(feval(f,i));
end

