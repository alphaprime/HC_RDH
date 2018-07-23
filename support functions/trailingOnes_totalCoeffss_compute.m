
function [trailingOnes,totalCoeffss]=trailingOnes_totalCoeffss_compute(NC_value,coeff_token_value,coeff_token)

[m,n]=size(coeff_token);
for i=1:m
    j=NC_value+2;
    if length(coeff_token{i,j})==length(coeff_token_value)
        if coeff_token{i,j}==coeff_token_value   %% 判断两个数组是否匹配
            trailingOnes=coeff_token{i,1};
            totalCoeffss=coeff_token{i,2};
            break;
        end   
    end
end