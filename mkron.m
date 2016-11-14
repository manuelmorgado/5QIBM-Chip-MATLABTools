% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Multiple productor Kronecker.
% 
% Entradas: Matrices o estado en producto tensorial.
% Salida: Estado producto.

function K = mkron(A,B,varargin)
K=kron(A,B);
for n=1:length(varargin)
    K=kron(K,varargin{n});
end 

%R=(kron(oo,kron(oo,kron(oo,I2))))+(kron(oo,kron(oo,kron(ll,X))))+(kron(ll,kron(kron(oo,X),kron(kron(oo,X),I2))))+(kron(ll,kron(kron(oo,X),kron(kron(ll,X),X))))