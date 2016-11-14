% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Plot imagen del Qubit.
% 
% Entradas: Qubit.
% Salida: Plot en escala grises del Qubit.

function qimage(m)

image(64*cf_rescale(m, -1, 1, 0, 1))
colormap gray
