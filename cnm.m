% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Conmutador.
% 
% Entradas: Matrices asociadas a los operadores A y B.
% Salida: comm(A,B)=AB-BA es decir el conmutador de A y B.

function c=cnm(A,B)
c=A*B-B*A;