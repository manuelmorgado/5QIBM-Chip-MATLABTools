%Tensor product of cells with Pauli's matrices inside

function final=prot(cell)
[m,n]=size(cell);
final=cell{1,n};

for i=1:n-1
    prev=cell{1,n-i};
    final=kron(final,prev);
end