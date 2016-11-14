% Universidad Simon Bolivar
% Autor: Geza Toth
% Modificacion: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Lleva de bonito a vector.
% 
% Entradas: Estado en forma de estructura.
% Salida: Estado en forma de vector.

function vec = struct2vec(struct)

n=length(struct(1).bin);
vec=zeros(2^n-1, 1);

for i=1:length(struct)
    dec = bin2dec(struct(i).bin);
    vec(dec)=struct(i).alpha;
end
