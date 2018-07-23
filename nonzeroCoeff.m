function TotalCoeffs=nonzeroCoeff(A_zig)

I=find(A_zig(:)~=0); 
TotalCoeffs=length(I);