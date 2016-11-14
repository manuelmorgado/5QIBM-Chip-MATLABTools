% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Universal gate.
% 
% Entradas: .
% Salida: .

function M = U_GATE( R, S, Dim )

T=2^(Dim);
a=1;
M=zeros(T);
for i = 1:S
    for j= Dim:-1:1
        a = kron(R{i,j},a);
    end
    M = M + a;
    a=1;
end

