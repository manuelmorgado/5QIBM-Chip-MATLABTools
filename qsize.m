% Universidad Simon Bolivar
% Autor: Geza Toth
% Modificacion: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Tamano del qubit.
% 
% Entradas: Qubit.
% Salida: Tamano del Qubit.

function q=qsize(matrix,varargin)

if isempty(varargin)
    d=2;
elseif length(varargin)==1
    d=varargin{1};
else
    error('Wrong number of input arguments.')
end 

[sy,sx]=size(matrix);
q=log2(max(sx,sy))/log2(d);
