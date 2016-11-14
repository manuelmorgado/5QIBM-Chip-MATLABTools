% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Ruido en matriz densidad.
% 
% Entradas: Matriz densidad rho (o estado en su defecto) y probabilidad p.
% Salida: Valor del oraculo.

function rho_noisy=ruidos(rho,p)

rho=ketbra2(rho);

[sx,sy]=size(rho);
rho_noisy=(1-p)*rho+p*eye(sx)/sx;