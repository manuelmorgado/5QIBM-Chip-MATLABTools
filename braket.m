% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: BraKet.
% 
% Entradas: uno o dos estados.
% Salida: Valor promedio de un operador entre dos estados o productor interno.

function b=braket(phi1,varargin)
   if length(varargin)==1,
       b=bra(phi1)*ket(varargin{1});
   else
       b=bra(phi1)*varargin{1}*ket(varargin{2});
   end 