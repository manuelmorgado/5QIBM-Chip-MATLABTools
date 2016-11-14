% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Producto n de kronecker de M.
% 
% Entradas: Vector o matriz M.
% Salida: Vector o matriz M producto.

function m=pkron(M,no_of_repeatations)
   if no_of_repeatations==0,
      [sy,sx]=size(M);
      m=eye(sy,sx);
   else
      m=M;
      for n=2:no_of_repeatations
         m=kron(m,M);
      end 
   end 
