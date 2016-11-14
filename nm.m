% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Normalizador.
% 
% Entradas: Vector de estado.
% Salida: Vector de estado normalizado.

function w=nm(v)
   [y,x]=size(v);
   if y==1,
     w=v.';
     w=w/sqrt(w'*w);    
   elseif x==1,
     w=v;
     w=w/sqrt(w'*w);
   else
     w=v/trace(v);
   end 
