function hidenLSB=LSBextract(encrypt_block_code,BlockNumber)



current_p=1;

LSB_len_code=zeros(1,14);
for i=1:BlockNumber

    encrypt_block_code{1,i}=double(encrypt_block_code{1,i});
  
    LSB=encrypt_block_code{1,i}(128);
    if LSB==1 % LSB=1，该blcok用于嵌入，等于0，不嵌入。
%         encrypt_block_code{1,i}(1:127)=circshift(encrypt_block_code{1,i}(1:127)',4)'; % 循环右移n位，恢复原来的顺序
        embed_data_len=encrypt_block_code{1,i}(121:127);
        data_len=bin2dec(char((embed_data_len)+48));
        data_len=data_len+1; % 之前是减1嵌入的
        if current_p-1+data_len<14   % 提取14位ＬＳＢ数据的长度，在其后面嵌入
           LSB_len_code(current_p:current_p+data_len-1)=encrypt_block_code{1,i}(120-data_len+1:120);
        else
           res=14-(current_p-1);
           LSB_len_code(current_p:current_p+res-1)= encrypt_block_code{1,i}(120-data_len+1:120-data_len+1+res-1); % 长度在数据的前部，所以提取长度应该从每一块的可提取部分的头开始
           break;
        end
        current_p=current_p+data_len;
    end
end

LSB_length=bin2dec(char((LSB_len_code)+48));
LSB_length=LSB_length+1; %LSB_length 为实际的十进制的LSB长度值

no_embed_len=LSB_length+14; % 不能被嵌入的长度，已经被LSB的内容占据



current_p=1;
sum=0;

for i=1:BlockNumber

    encrypt_block_code{1,i}=double(encrypt_block_code{1,i});
    LSB=encrypt_block_code{1,i}(128);
    if LSB==1 % LSB=1，该blcok用于嵌入，等于0，不嵌入。
        embed_data_len=encrypt_block_code{1,i}(121:127);
        data_len=bin2dec(char((embed_data_len)+48));
        data_len=data_len+1; % 之前是减1嵌入的。
        tempdata = encrypt_block_code{1,i};
        if current_p-1+data_len<no_embed_len
            hidenLSB_total(current_p:current_p+data_len-1)=tempdata(120-data_len+1:120);
        else
            res=no_embed_len-(current_p-1);
            hidenLSB_total(current_p:current_p+res-1)=tempdata(120-res+1:120); % 从数据长度的后面开始嵌入。。。。。***。 *为嵌入的部分，从左到右。
            break;
        end
     
       
        current_p=current_p+data_len;
        sum=sum+data_len;
    end
end

hidenLSB=hidenLSB_total(15:no_embed_len);