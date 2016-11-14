% Universidad Simon Bolivar
% Autor: Geza Toth
% Modificacion: Manuel Morgado
% Fecha: Julio 2016
% 
% Rutina: Imprimir estado.
% 
% Entradas: Vector de estado.
% Salida: Estado escrito en los estados base.

function s=printv(v,varargin)

% Setting the treshold
if isempty(varargin),
vmin=1e-4;
elseif length(varargin)==1,
   vmin=varargin{1};
else
   error('Wrong number of input arguments.')
end %if

index=find(abs(v)>vmin);

N=log2(length(v));

s='';
for n=1:length(index)
   ii=index(n);
   vv=v(ii);
   b=dec2bin(2^N+ii-1);
   b=b(2:end);
   if isempty(s),
      if vv==1,
         s=['|' b '>'];,
      elseif vv==-1,
         s=[ '-|' b '>'];,
      elseif isreal(vv) && vv>0,
	     s=[ num2str(vv) '|' b '>'  ];
      elseif isreal(vv) && vv<0, 
	     s=[ '-' num2str(abs(vv)) '|' b '>'  ];
      elseif isreal(vv/i) && vv/i>0,
         if vv==i,
            s=[ 'i|' b '>'  ];
         else
	        s=[ num2str(vv/i) 'i|' b '>'  ];
         end %if
      elseif isreal(vv/i) && vv/i<0, 
         if vv==-i,
            s=[ '-i|' b '>'  ];
         else
            s=[ '-' num2str(abs(vv/i)) 'i|' b '>'  ];
         end %if
      else 
          s=[ '(' num2str(vv) ')|' b '>'  ];
      end %if
   else
      if vv==1,
         s=[s '+|' b '>'];,
      elseif vv==-1,
         s=[s '-|' b '>'];,
      elseif isreal(vv) && vv>0,
	     s=[ s '+' num2str(vv) '|' b '>'  ];
      elseif isreal(vv) && vv<0,
         s=[ s '-' num2str(abs(vv)) '|' b '>'  ];
      elseif isreal(vv/i) && vv/i>0,
         if vv==i,
            s=[ s '+i|' b '>'  ];
         else
   	        s=[ s '+' num2str(abs(vv)) 'i|' b '>'  ];
         end %if
      elseif isreal(vv/i) && vv/i<0, 
         if vv==-i,
            s=[ s '-i|' b '>'  ];
         else
            s=[ s '-' num2str(abs(vv/i)) 'i|' b '>'  ];
         end %if
      else 
         s=[ s '+(' num2str(vv) ')|' b '>'  ];
      end %if
   end %if
end %for
if isempty(s)
    s='0';
end

