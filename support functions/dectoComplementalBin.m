 function numbin=dectoComplementalBin(numint,flag)
 % ʵ��ʮ���Ƶ������Ƶ�ת��
 % ���룺numint ʮ������   flag��1��ʾ������0��ʾ����
 
 numbin=dec2bin(numint,11);  % ת����8λ�Ķ�������
 num=double(numbin)-48;
 
 if flag==0  % �����ʮ������Ϊ�����������Ĳ�������ԭ����ͬ
    numbin=num;
 end
 
 if flag==1 % ���������㲹��
    l=length(num);
    for i=2:l 
       if num(i)==1%��λȡ��
           num(i)=0;
       else
           num(i)=1;
       end      
      
    end
    
    %ȡ�����һ
    temp_l=l;
    while(temp_l-1~=0)
        if num(temp_l)==0%���λΪ0
            num(temp_l)=1;
            temp_l=1;%����ѭ��
        else
            num(temp_l)=0;
            temp_l=temp_l-1;
        end
    end  
    numinto=num(2:l);
    numbin=[1,numinto];

 end