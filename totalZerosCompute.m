function [TotalZeros,TotalZeros_code]=totalZerosCompute(totalCoeffss,total_zero1,total_zero2,coeff_token_len,sum_len,error_code)

if totalCoeffss>=1 && totalCoeffss<=7
    total_zeros=total_zero1;
    totalCoeffss_colum=totalCoeffss+1;
else
    total_zeros=total_zero2;
    totalCoeffss_colum=totalCoeffss-7+1;
end

[p1,p2]=size(total_zeros);

j=coeff_token_len+sum_len+1;
for i=1:p1 
    temp=total_zeros{i,totalCoeffss_colum}; % 每一行的code值
    if j+length(temp)-1<=length(error_code)
    curr=error_code(j:j+length(temp)-1);  %%%5 cuole 
    if temp==curr
        TotalZeros=i-1;
        TotalZeros_code=temp;
        break;
    end
    end
end