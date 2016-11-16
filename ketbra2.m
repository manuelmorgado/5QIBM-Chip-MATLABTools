%Normalization of density matrix
%Manuel Morgado
%November 2016

function k=ketbra2(f)
[sy,sx]=size(f);
if sx==1,
   k=f*f';
elseif sy==1,
   k=f'*f;
else
   k=f;
end %if
if trace(k)~=0,
   k=k/trace(k);
end %if
