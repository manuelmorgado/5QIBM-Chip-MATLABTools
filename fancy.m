% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Escritura Bonita.
% 
% Entradas: Estado en alguna estructura.
% Salida: String con el estado bien escrito.

function str = fancy(struct, b_dec)
if nargin<2,b_dec=0; end

if ~isstruct(struct)
    struct=vec2struct(struct);
end
    
str=[];

for i=1:length(struct)
    
    if ~b_dec
        str=[ str ' ' num2str(struct(i).alpha) '|' struct(i).bin '> +'];
    else
     str=[ str ' ' num2str(struct(i).alpha) '|' num2str(bin2dec(struct(i).bin)) '> +'];
    end
end

str=str(1:end-1);