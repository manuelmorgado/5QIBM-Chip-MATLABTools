% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Compuerta Hadamard.
% 
% Entradas: Dimension n de la matriz.
% Salida: Matriz nxn Hadamard.

function H = hadamard(n)
%H = hadamard(n)
%
%Create n-bit hadamard matrix.

if n==1
    H = U_H();
else
    H1 = hadamard(1);
    H=1;
    for i=1:n
        H=kron(H,H1);    
    end
end

