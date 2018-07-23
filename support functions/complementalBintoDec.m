function refExtractValue=complementalBintoDec(refExtractBit)

% 功能：二进制补码转为十进制
% 参数：referenceBitforTotalBlock：（161，1）
% 返回：refExtractValue：（23 ，1）
 refExtractBit=refExtractBit';
 refExtractBitchar=char(refExtractBit+48);
 if bin2dec(refExtractBitchar)==1024
     refExtractValue=-1024;
     return;
 end
     
 if refExtractBit(1)==0  % 输入的十进制数为正数，正数的补码与其原码相同
    numbin=bin2dec(refExtractBitchar);  % 7位的二进制数转换成十进制
    refExtractValue=numbin;
 end
 
 
 if refExtractBit(1)==1 % 负数，计算补码
    l=length(refExtractBit);
    for i=2:l 
       if refExtractBit(i)==1%按位取反
           refExtractBit(i)=0;
       else
           refExtractBit(i)=1;
       end      
      
    end
    
    %取反后加一
    temp_l=l;
    while(temp_l-1~=0)
        if refExtractBit(temp_l)==0%最低位为0
            refExtractBit(temp_l)=1;
            temp_l=1;%结束循环
        else
            refExtractBit(temp_l)=0;
            temp_l=temp_l-1;
        end
    end  
    numinto=refExtractBit(2:l);
    numbin=bin2dec(char(numinto+48)); 
    refExtractValue=-numbin;

 end