% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Estados Bra.
% 
% Entradas: vector columna.
% Salida: vector fila.

function w=bra(v)
   [y,x]=size(v);
   if x>1,
     w=conj(v);
   else
     w=v';
   end 
   % Normalizacion
   w=w/sqrt(w*w');
   
   