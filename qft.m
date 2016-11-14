% Universidad Simon Bolivar
% Autor: Geza Toth
% Modificacion: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Quantum Fourier Transform.
% 
% Entradas: Qubit.
% Salida: Matriz del QFT del qubit.

function  m = qft(q)
%m = qft(q)
%
% Create QFT matrix with q rows and cols
%
%usage:
%  m'*x std->f  =fft
%  m *x f->std  =ifft

w=exp(2*pi*i/q);

s = zeros(q);

row=0:q-1;

for r=1:q
   m(r,:)=row*(r-1);
end

m = w.^m;

m = m/sqrt(q);