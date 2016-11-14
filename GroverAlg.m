% Universidad Simon Bolivar
% Autor: Geza Toth
% Modificacion: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Algoritmo de Groover.
% 
% Entradas: .
% Salida: .

n=5;

V_haystack = vf('haystack', n)

H = hadamard(n)
D = ia(n)

phi = bin2vec('00000');

phi = H*phi;

maxiter = (pi/4)*sqrt(2^n);
phihist=[];

for i=1:10

    phi=V_haystack*phi;
    phi=D*phi;
    
    phihist=[phihist, phi];
    
end

phi=measure(phi);

ribbon(phihist')