function refExtractValue=complementalBintoDec(refExtractBit)

% ���ܣ������Ʋ���תΪʮ����
% ������referenceBitforTotalBlock����161��1��
% ���أ�refExtractValue����23 ��1��
 refExtractBit=refExtractBit';
 refExtractBitchar=char(refExtractBit+48);
 if bin2dec(refExtractBitchar)==1024
     refExtractValue=-1024;
     return;
 end
     
 if refExtractBit(1)==0  % �����ʮ������Ϊ�����������Ĳ�������ԭ����ͬ
    numbin=bin2dec(refExtractBitchar);  % 7λ�Ķ�������ת����ʮ����
    refExtractValue=numbin;
 end
 
 
 if refExtractBit(1)==1 % ���������㲹��
    l=length(refExtractBit);
    for i=2:l 
       if refExtractBit(i)==1%��λȡ��
           refExtractBit(i)=0;
       else
           refExtractBit(i)=1;
       end      
      
    end
    
    %ȡ�����һ
    temp_l=l;
    while(temp_l-1~=0)
        if refExtractBit(temp_l)==0%���λΪ0
            refExtractBit(temp_l)=1;
            temp_l=1;%����ѭ��
        else
            refExtractBit(temp_l)=0;
            temp_l=temp_l-1;
        end
    end  
    numinto=refExtractBit(2:l);
    numbin=bin2dec(char(numinto+48)); 
    refExtractValue=-numbin;

 end