function [r,xtilde]=dpcm(x,a)
% Usage: [r,xtilde]=dpcm(x,a)
% Differential Pulse Coded Modulation
% x: input source vector to be encoded
% a: prediction filter
% r: residue vector quantized to integer
%
%    r(t) = Q[x(t)-xhat(t)] = Q[x(t)- sum a(i)xtilde(t-i)]
%    xtilde(t) = xhat(t) + r(t)
%
% copyright (c) 1997 by Yu Hen Hu
% created: 11/24/97
%
[m,nx]=size(x);  
if min(m,nx) > 1, error('x must be a vector'); RETURN, end
if m==1 & nx > 1, x = x'; m=nx;  end  % ensure x is a column vector
[p,na]=size(a);
if p==1 & na > 1, a = a'; p=na;  end  % ensure a is a col. vector

% First p element of x must be sent unchanged as part of r after
% scaler quantization

r=round(x(1:p)); xtilde=r;
for t=p+1:m,
   xhat(t)=a'*xtilde(t-1:-1:t-p);
   r(t)=round(x(t)-xhat(t));
   xtilde(t)=xhat(t)+r(t);
end
