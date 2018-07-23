function totalZeos=zeroBeforeLastCoeff(A_zig)

A_zig_reorder=fliplr(A_zig);
I=find(A_zig_reorder(:)~=0); 
if isempty(I)==1
    totalZeos=16; % 这种情况最后一个非零系数前0的个数这一步骤不再需要。
else
    len=length(A_zig_reorder);
    inital=I(1);
    num=0;
    for i=inital+1:len
        if A_zig_reorder(i)==0
            num=num+1;
        end
    end

    totalZeos=num;
end