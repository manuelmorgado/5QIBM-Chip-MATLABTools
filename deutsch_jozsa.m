% Universidad Simon Bolivar
% Autor: Geza Toth
% Modificacion: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Algoritmo de Detsch-Jorzsa (AUN EN PRUEBA).
% 
% Entradas: .
% Salida: .

function deutsch_jozsa(f)
psi = bin2vec('000001');

U_f = uf(f, 5, 1);

H_6 = hadamard(6);
H_5 = hadamard(5);
I   = identity(1);

psi = (kron(H_5, I))*U_f*H_6*psi;

psi = measure(psi);

pretty(psi)











