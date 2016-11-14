% Universidad Simon Bolivar
% Autor: Geza Toth
% Modificacion: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Condicion Booleano.
% 
% Entradas: Entrada y mensaje.
% Salida: verifica que su entrada es Booleana.

function cond_bool(b, msg)
if ~b
    str = 'Condici?n Booleana fall?.';

    if nargin>1
        str = [str ': ' msg];
    end
    
    error(str)
    
end
