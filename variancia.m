% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Calcula la variancia del operador en el estado rho.
% 
% Entradas: Operador y estado.
% Salida: variancia.

function v=variancia(op,rho)
   if min(size(rho))==1,
       % Input is a state vector
       v=bra(rho)*op^2*ket(rho)-(bra(rho)*op*ket(rho))^2;
   else
       % Input is a density matrix
       v=trace(rho*op^2)/trace(rho)-trace(rho*op)^2/trace(rho)^2;
   end %if