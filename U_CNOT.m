% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Compuerta CNOT.
% 
% Entradas: Numero de qubits.
% Salida: Compuerta de CNOT de n-qubits.

function U=U_CNOT(Nqb)
    x=U_Px();
    I=eye(2);
    M11=1;
    M22=1;
    for i=1:Nqb
        M22=kron(M22,x);
        M11=kron(M11,I);
    end
    izq=cat(1,M11,zeros(2^(Nqb)));
    der=cat(1,zeros(2^(Nqb)),M22);
    U=cat(2,izq,der);
end