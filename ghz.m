% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Estados GHZ.
% 
% Entradas: Estado deseado.
% Salida: Estados GHZ para el estado requerido.

function g=ghz(varargin)
if isempty(varargin),
    global N;
else
    if length(varargin)~=1,
        error('Error argumento erroneo.')
    end 
    N=varargin{1};
end 
g=zeros(2^N,1);
g(1)=1/sqrt(2);
g(end)=1/sqrt(2);
