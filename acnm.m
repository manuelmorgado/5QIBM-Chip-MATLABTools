% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Anticonmutador.
% 
% Entradas: Matrices asociadas (A y B) a dos operadores.
% Salida: Matriz resultante de calcular el anticonmutador.

function c=acnm(A,B)
c=A*B+B*A;