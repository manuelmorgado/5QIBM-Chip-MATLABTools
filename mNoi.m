%Noise density matrix from quantum experience
%Manuel Morgado
%November 2016

function rhoNoi=mNoi(rhoTeo,p)

rhoTeo=ketbra2(rhoTeo);

[sx,sy]=size(rhoTeo);
rhoNoi=(1-p)*rhoTeo+p*eye(sx)/sx;
