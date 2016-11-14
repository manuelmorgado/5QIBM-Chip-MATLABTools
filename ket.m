% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Ket.
% 
% Entradas: Vector de estado (en forma de bra).
% Salida: Vector de estado (en forma de ket).
function w=ket(v)
   [y,x]=size(v);
   if x>1,
     w=v.';
   else
     w=v;
   end
   w=w/sqrt(w'*w);
   
   
