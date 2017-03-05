% Quantum Topology Computers. 
%Author: Manuel Morgado
%University Simon Bolivar. Quantum Information and Communication group.
%Department of Physics.
%Based in the paper by Dr. J. Wootton (University of Basel). 

%Warnings:
%1. Check that Gengates, md.m, prot.m are in the folder.
%2. Check that the numbers m and n give multiple number of 6 qubits,
%otherwise is not going to work.
%3. Kronecker product works fine until 2^15 Hilbert spaces (qubits) for
%normal computers. (This warning is just in case you want the matrices of 
%plaquette and link operators)

clear all;
clc;

%Greetings
disp('Hello!')
disp('Thanks for using me and for be interested in Quantum Computing!')
m=input('Please, introduce the Nr. of rows of your lattice: ');
n=input('Please, introduce the Nr. of columns of your lattice: ');

%Initializing (Generating Pauli Matrices, structures for link operators,
%plaquette operators and initializing the lattice of vertex,)
clc;
disp('Initializing...')

Gengates

k=0;N=m*n; nq=N/2;

links=cell(nq,3);

klx=cell(1,N);
kly=cell(1,N);
klz=cell(1,N);
for i=1:N
    klx{1,i}=I;
    kly{1,i}=I;
    klz{1,i}=I;
end

red=zeros(m,n);
vert=1:N;

for i=1:m
    for j=1:n
        k=k+1;
        red(i,j)=vert(1,k);
    end
end

%Computing the links operators
disp('Computing links operators...')
k=1;r=1;trian=zeros(1,N);
for i=1:2:m
    for j=1:n
        
        %Make a copy of initial kl structure
        klxj=klx;
        klyj=kly;
        klzj=klz;
        
        %Determine the vertex
        q0=red(md(i,m),md(j,n))*mod(k,2) + red(md(i,m),md(j,n))*mod(k+1,2);
        qx=red(md(i+1,m),md(j,n))*mod(k,2) + red(md(i+1,m),md(j-1,n))*mod(k+1,2);
        qy=red(md(i+1,m),md(j+1,n))*mod(k,2) + red(md(i+1,m),md(j,n))*mod(k+1,2);
        qz=red(md(i-1,m),md(j,n))*mod(k,2) + red(md(i-1,m),md(j,n))*mod(k+1,2);
        
        %Put the Pauli operators in the right Hilbert space
        klxj{1,q0}=X;klxj{1,qx}=X;
        klyj{1,q0}=Y;klyj{1,qy}=Y;
        klzj{1,q0}=Z;klzj{1,qz}=Z;
        
        %Put the link operators in the list of kl operators for N/2 vertex
        links{r,1}=klxj;
        links{r,2}=klyj;
        links{r,3}=klzj;
        
        %Create a list of 
        trian(1,q0)=r;
        
        %Counter for the number of vertex
        r=r+1;
        
    end
    
    %Counter for the check line
    k=k+1;

end

%Computing the plaquette operators
disp('Computing plaquette operators...')
k=1;Wps=cell(1,N);Lwp=cell(nq,1);c=1;
for i=1:2:m
    for j=1:n
        
        %Determine the vertex for echa 3 edges vertex (triangle)
        qa=red(md(i,m),md(j,n))*mod(k,2) + red(md(i,m),md(j,n))*mod(k+1,2);
        qb=red(md(i+2,m),md(j,n))*mod(k,2) + red(md(i+2,m),md(j-1,n))*mod(k+1,2);
        qc=red(md(i+2,m),md(j+1,n))*mod(k,2) + red(md(i+2,m),md(j,n))*mod(k+1,2);
    
        Xa=links{trian(1,qa),1};
        Ya=links{trian(1,qa),2};
        
        Yb=links{trian(1,qb),2};
        Zb=links{trian(1,qb),3};
        
        Zc=links{trian(1,qc),3};
        Xc=links{trian(1,qc),1};
        
        for s=1:N
            Wps{1,s}=Xa{1,s}*Ya{1,s}*Zc{1,s}*Xc{1,s}*Yb{1,s}*Zb{1,s};
        end
        Lwp{c,1}=Wps;
        c=c+1;
    end
    
    %Counter for the check line
    k=k+1;
end

%Computing matrices for every plaquette operator
clc;
Q=input('Would you like to compute the matrices of the plaquettes and links? [yes=1/no=2]: ');
if Q== 1
    
    Mplaq=cell(nq,1);Mlks=cell(nq,3);
    
    %Computing plaquettes matrices
    disp('Computing plaquettes matrices...')
    for i=1:nq
        Mplaq{i,1}=prot(Lwp{i,1});
    end

    disp('Computing links matrices...')
    for j=1:nq
        for k=1:3
            Mlks{j,k}=prot(links{j,k});
        end
    end
    
    disp('Done! Thanks!')
    
elseif Q== 2
    
    %Farewell
    dips('Gotcha! Thanks for saving me the work! :) BTW, type "links" or "Lwp" for access to the operators structure. Bye!')
end