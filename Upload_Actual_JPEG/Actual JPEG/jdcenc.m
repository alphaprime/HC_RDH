function b=jdcenc(x)
% Usage: b=jdcenc(x)
% Hoffman encoding of DC coefficients in JPEG
% copyright(c) 1997 by Yu Hen Hu
%
% category c = floor(log2(abs(x)))+1
% append code is the binary representation of abs(x) if x>0
% of the 1's complement of bianry rep of abs(x) if x < 0
% created: 11/25/97

% first figure out category number
if x ==0,
   %b=[0 1 0];
   b=[0 0];
   return % done
else
   c = floor(log2(abs(x)))+1;
end

% Hoffman table
tbl=[3 0 1 0 0 0 0 0 0 0
     3 0 1 1 0 0 0 0 0 0
     3 1 0 0 0 0 0 0 0 0
     2 0 0 0 0 0 0 0 0 0
     3 1 0 1 0 0 0 0 0 0
     5 1 1 0 0 0 0 0 0 0
     4 1 1 1 0 0 0 0 0 0
     5 1 1 1 1 0 0 0 0 0
     6 1 1 1 1 1 0 0 0 0
     7 1 1 1 1 1 1 0 0 0
     8 1 1 1 1 1 1 1 0 0
     9 1 1 1 1 1 1 1 1 0];
 
 % This table is in the pdf file, print out taken
 % Modified 27 sept 2003, 2325 Hrs
 
tab=[2 0 0 0 0 0 0 0 0 0
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
 
 tbl=tab;
 % This is changed by Ravi Lakkundi

b=tbl(c+1,2:tbl(c+1,1)+1);

tmp=int2bin(x,c);  
% tmp is 1 by c+1 vector containing sign-mag
% representation of x, first bit is sign bit.

if tmp(1)==0, % if x > 0
   b=[b tmp(2:c+1)];
elseif tmp(1)==1, % if x < 0
   b=[b ones(1,c)-tmp(2:c+1)];
end
