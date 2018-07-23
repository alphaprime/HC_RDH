function hidenLSB=LSBextract(encrypt_block_code,BlockNumber)



current_p=1;

LSB_len_code=zeros(1,14);
for i=1:BlockNumber

    encrypt_block_code{1,i}=double(encrypt_block_code{1,i});
  
    LSB=encrypt_block_code{1,i}(128);
    if LSB==1 % LSB=1����blcok����Ƕ�룬����0����Ƕ�롣
%         encrypt_block_code{1,i}(1:127)=circshift(encrypt_block_code{1,i}(1:127)',4)'; % ѭ������nλ���ָ�ԭ����˳��
        embed_data_len=encrypt_block_code{1,i}(121:127);
        data_len=bin2dec(char((embed_data_len)+48));
        data_len=data_len+1; % ֮ǰ�Ǽ�1Ƕ���
        if current_p-1+data_len<14   % ��ȡ14λ�̣ӣ����ݵĳ��ȣ��������Ƕ��
           LSB_len_code(current_p:current_p+data_len-1)=encrypt_block_code{1,i}(120-data_len+1:120);
        else
           res=14-(current_p-1);
           LSB_len_code(current_p:current_p+res-1)= encrypt_block_code{1,i}(120-data_len+1:120-data_len+1+res-1); % ���������ݵ�ǰ����������ȡ����Ӧ�ô�ÿһ��Ŀ���ȡ���ֵ�ͷ��ʼ
           break;
        end
        current_p=current_p+data_len;
    end
end

LSB_length=bin2dec(char((LSB_len_code)+48));
LSB_length=LSB_length+1; %LSB_length Ϊʵ�ʵ�ʮ���Ƶ�LSB����ֵ

no_embed_len=LSB_length+14; % ���ܱ�Ƕ��ĳ��ȣ��Ѿ���LSB������ռ��



current_p=1;
sum=0;

for i=1:BlockNumber

    encrypt_block_code{1,i}=double(encrypt_block_code{1,i});
    LSB=encrypt_block_code{1,i}(128);
    if LSB==1 % LSB=1����blcok����Ƕ�룬����0����Ƕ�롣
        embed_data_len=encrypt_block_code{1,i}(121:127);
        data_len=bin2dec(char((embed_data_len)+48));
        data_len=data_len+1; % ֮ǰ�Ǽ�1Ƕ��ġ�
        tempdata = encrypt_block_code{1,i};
        if current_p-1+data_len<no_embed_len
            hidenLSB_total(current_p:current_p+data_len-1)=tempdata(120-data_len+1:120);
        else
            res=no_embed_len-(current_p-1);
            hidenLSB_total(current_p:current_p+res-1)=tempdata(120-res+1:120); % �����ݳ��ȵĺ��濪ʼǶ�롣��������***�� *ΪǶ��Ĳ��֣������ҡ�
            break;
        end
     
       
        current_p=current_p+data_len;
        sum=sum+data_len;
    end
end

hidenLSB=hidenLSB_total(15:no_embed_len);