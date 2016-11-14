% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Compuerta del sistema S.
% 
% Entradas: Compuertas unitarias en orden correcto generadas por g1q y g2q.
% Salida: Matriz S asociada a la compuerta del sistema.

function U = C(varargin)
% U=A*B;
U=1;
for n=0:(length(varargin)-1)
    U=varargin{length(varargin)-n}*U;
end 