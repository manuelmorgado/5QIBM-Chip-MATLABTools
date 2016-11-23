mS=ketbra(Probability);
ini=[1 0 0 0];
fin=ini*CNOT;
mC=ketbra(fin);
fidGate(mS,mC,1)