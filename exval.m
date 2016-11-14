% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Valor esperado.
% 
% Entradas: Matriz del Operador y matriz densidad.
% Salida: Valor esperado del operador.

function e=ex(op,rho)
   if min(size(rho))==1,
       e=bra(rho)*op*ket(rho);
   else
       e=trace(rho*op)/trace(rho);
   end 