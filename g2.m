% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Compuerta de 2 qubit sobre el i-esimo qubit en un sistema de n.
% 
% Entradas: Compuerta aplicada al i-esimo qubit, valor de i y # de qubits.
% Salida: Matriz asociada a la compuerta sobre el i-esimo qubit.

function G=g2(C,i,a,n)
    v1 = cell(1,n);
    v2 = cell(1,n);
    Gengates()
    if C==X
        for j=1:n
            
            if j==a
                v1{a} = U_Pi();
                v2{a} = C;
            elseif j==i
                v1{i} = oo;
                v2{i} = ll;
            else
                v1{j} = U_Pi();
                v2{j} = U_Pi();
            end
        end
        M1=1;
        M2=1;
        for m=1:n
            M1=kron(M1,v1{m});
            M2=kron(M2,v2{m});
        end
    G1=M1;
    G2=M2;
    G=G1+G2
    
    elseif C==Z
         for j=1:n
            if j==a
                v1{j} = U_Pi();
                v2{j} = X;
            elseif j==i
                v1{j} = oo;
                v2{j} = ll;
            else
                v1{j} = U_Pi();
                v2{j} = U_Pi();
            end
         end
         M1=1;
         M2=1;
         for m=1:n
            M1=kron(M1,v1{m});
            M2=kron(M2,v2{m});
         end
    G1=M1;
    G2=M2;
    G=G1+G2
    else
        disp('No es un estado estabilizador.')
    end
    
