 function numbin=dectoComplementalBin(numint,flag)
 % 实现十进制到二进制的转换
 % 输入：numint 十进制数   flag：1表示正数，0表示复数
 
 numbin=dec2bin(numint,11);  % 转换成8位的二进制数
 num=double(numbin)-48;
 
 if flag==0  % 输入的十进制数为正数，正数的补码与其原码相同
    numbin=num;
 end
 
 if flag==1 % 负数，计算补码
    l=length(num);
    for i=2:l 
       if num(i)==1%按位取反
           num(i)=0;
       else
           num(i)=1;
       end      
      
    end
    
    %取反后加一
    temp_l=l;
    while(temp_l-1~=0)
        if num(temp_l)==0%最低位为0
            num(temp_l)=1;
            temp_l=1;%结束循环
        else
            num(temp_l)=0;
            temp_l=temp_l-1;
        end
    end  
    numinto=num(2:l);
    numbin=[1,numinto];

 end