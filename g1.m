% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Compuerta de 1 qubit sobre el i-esimo qubit en un sistema de n.
% 
% Entradas: Compuerta aplicada al i-esimo qubit, valor de i y # de qubits.
% Salida: Matriz asociada a la compuerta sobre el i-esimo qubit.

function g=g1(C,i,n)

v = cell(1,n);

    for j=1:n
        if j==i
          v{i} =  C; 
        else
          v{j} = U_Pi();
        end
    end 
    M=1;
    for m=1:n
        M=kron(M,v{m});
    end
    g=M;