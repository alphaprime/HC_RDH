% Take a test vector
function x=jdcdec(y)
%clear;clc
%y=[jdcenc(-2) jdcenc(0) jdcenc(0) jdcenc(0) jdcenc(-124)];
% table specified
table=[2 0 0 0 0 0 0 0 0 0
       3 0 1 0 0 0 0 0 0 0
       3 0 1 1 0 0 0 0 0 0
       3 1 0 0 0 0 0 0 0 0
       3 1 0 1 0 0 0 0 0 0
       3 1 1 0 0 0 0 0 0 0
       4 1 1 1 0 0 0 0 0 0
       5 1 1 1 1 0 0 0 0 0
       6 1 1 1 1 1 0 0 0 0
       7 1 1 1 1 1 1 0 0 0
       8 1 1 1 1 1 1 1 0 0
       9 1 1 1 1 1 1 1 1 0];

N=length(y);
[p,dm1]=size(table);
x=[];
x1=[];
i=1; d=2;tmp=ones(p,1);
while i<=N,
   % match y(i) to that of the d-th bit in the table
   tmp=tmp.*[table(:,d)==y(i)]; % tmp is a vector of 0 and 1 with 1 indicate a match
   if sum(tmp)==1,  % narrow down to one symbol, find it
      d=2;          % reset pointer to columns of table.
      kkt=0;
      for kk=1:length(tmp)
          if(tmp(kk)==1),kkt=kk;end
      end
      cat=kkt-1;
      tmp=ones(p,1);
      if cat==11,i=i+1;end % Because the comparison ends in last but one column,but still a 0 is left
      x1=y(i+1:i+cat);
      % Check Range
      if(cat ~=0)
          x2=bin2int(x1);
          if(x2>=2^(cat-1) & x2<2^cat)
              x2=x2;
          else
              x1=ones(1,cat)-x1;
              x2=-1*bin2int(x1);
          end
      else
          x2=0;
      end
      % Update decoded vector
      x=[x x2];
      i=i+cat;
   else 
      d=d+1; 
   end
   i=i+1; 
end
x=filter(1,[1 -1],x); % Inverse of DPCM