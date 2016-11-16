% Universidad Simon Bolivar
% Autor: Manuel Morgado
% Fecha: November 2016
% 
% Rutina: Generador de compuertas.
% 
% Entradas: .
% Salida: Compuertas .

clc;

X = U_Px();
Y = U_Py(); 
Z = U_Pz;
I = U_Pi();
H = hadamard(1);
S = [1 0;0 i];
Sd=transpose(conj(S));
T = [1 0;0 1/sqrt(2)+i/sqrt(2)];
R2 = U_Rot(pi/2,0);
R4 = U_Rot(pi/4,0);
R8 = U_Rot(pi/8,0);
CNOT = [1 0 0 0;0 1 0 0;0 0 0 1;0 0 1 0];

oo = ketbra(q(0));
ll = ketbra(q(1));
ol = q(0) * transpose(q(1));
lo = q(1) * transpose(q(0));

HooH = H * oo * H;
HllH = H * ll * H;

dmX = oo;
dmY=0;
dmZ=0;
dmH=HooH;
dmS=0;
dmSd=0;
dmT=0;
dmCNOT=0;

listGates = {X Y Z H S Sd T CNOT};
dm = {dmX dmY dmZ dmH dmS dmSd dmT dmCNOT}; 

StateI = [1 0];