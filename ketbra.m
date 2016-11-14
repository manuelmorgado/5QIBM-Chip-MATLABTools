% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Matriz densidad.
% 
% Entradas: Vector de estado.
% Salida: Matriz densidad de estado.

function k=ketbra(f)
[sy,sx]=size(f);
if sx==1,
   k=f*f';
elseif sy==1,
   k=f'*f;
else
   error('Inserte vector columna o vector fila.')
end %if
if trace(k)~=0,
   k=k/trace(k);
end %if
