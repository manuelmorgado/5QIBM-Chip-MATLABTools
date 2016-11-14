% Universidad Simon Bolivar
% Autor: Geza Toth
% Modificacion: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Algoritmo de Deutsch (AUN EN PRUEBA).
% 
% Entradas: .
% Salida: .

function deutsch 
psi = bin2vec('01')

U_f = uf('f_b1', 1, 1)

H = hadamard(2)

psi = H*U_f*H*psi

psi = measure(psi)







