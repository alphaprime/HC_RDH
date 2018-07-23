function Levels=nonzeroCoeffExceptTrailingCoeff(A_zig)

A_zig_reorder=fliplr(A_zig);
I=find(A_zig_reorder(:)~=0); 
len=length(I);
num=0;
Levels=zeros(1,16);
flag1=0; flag2=0;
for i=1:len
    if i==1
        if A_zig_reorder(I(i))==1  
            flag1=1;
            continue;
        end
        if A_zig_reorder(I(i))==-1  
            flag1=1;
            continue;
        end
    end
    if i==2 && flag1==1
        if A_zig_reorder(I(i))==1 
            flag2=1;
            continue;
        end
        if A_zig_reorder(I(i))==-1  
            flag2=1;
            continue;
        end
    end
    
    if i==3 && flag1==1 && flag2==1
        if A_zig_reorder(I(i))==1 
             
            continue;
        end
        if A_zig_reorder(I(i))==-1  
            
            continue;
        end
    end
    
    
    num=num+1;
    Levels(num)=A_zig_reorder(I(i));

end

Levels=Levels(1:num);