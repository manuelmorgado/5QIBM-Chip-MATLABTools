% Universidad Simon Bolivar
% Autor: Geza Toth
% Modificacion: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Estado termalizado.
% 
% Entradas: Hamiltoniano y temperatura en KT.
% Salida: Estado en equilibrio.

function rho=thstate(H,kT)
   rho=expm(-H/kT);
   rho=rho/trace(rho);