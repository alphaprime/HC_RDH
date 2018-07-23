function [TrailingOnes,Trailsign]=TrailingCoeff(A_zig)

A_zig_reorder=fliplr(A_zig);
I=find(A_zig_reorder(:)~=0); 
len=length(I);
num=0;
Trailsign=zeros(1,3);
for i=1:len
    if A_zig_reorder(I(i))==1  
        num=num+1;
        Trailsign(num)=0;
    end
    if A_zig_reorder(I(i))==-1
        num=num+1;
        Trailsign(num)=1;
    end
    if num==3
        break;
    end
    if A_zig_reorder(I(i))~=1 && A_zig_reorder(I(i))~=-1
        break;
    end
end
TrailingOnes=num;

Trailsign=Trailsign(1:num);
 
 