% Universidad Simon Bolivar
% Autor: Geza Toth
% Modificacion: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Vector de d dimensiones.
% 
% Entradas: Numero de qubits y dimension.
% Salida: Qubit de dimension n.

function s=qvec(varargin)

if isempty(varargin)
    global N;
    d=2;
elseif length(varargin)==1
    N=varargin{1};
    d=2;
elseif length(varargin)==2
    N=varargin{1};
    d=varargin{2};
else
    error('Wrong number of input arguments.')
end %if

s=zeros(d^N,1);
