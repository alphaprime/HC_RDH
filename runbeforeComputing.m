function [run_before,zerosleft]=runbeforeComputing(A_zig)
A_zig_reorder=fliplr(A_zig);
I=find(A_zig_reorder(:)~=0); 
 
len=length(A_zig_reorder);

num=1;
zerosleft=zeros(1,length(I));
run_before=zeros(1,length(I));

for i=1:length(I)
    if(I(i)==16)
        continue;
    end
    left=A_zig_reorder(I(i):len);
    zerosleft(num)=length(find(left(:)==0)); 
    if zerosleft(num)>6
        zerosleft(num)=7;
    end
    for j=I(i)+1:len
        if A_zig_reorder(j)==0
            run_before(num)=run_before(num)+1;
        else
            break;
        end
    end
    num=num+1;
     
end


run_before=run_before(1:num-1);
zerosleft=zerosleft(1:num-1);


 