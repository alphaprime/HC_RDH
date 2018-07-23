function encrypt_image_hiddendata_embed=encryptedImgHiding(encrypted_image,hidendata,DH_Key,blcoksize)

%% 图像转为向量
[N,N]=size(encrypted_image);
BlockNumber=(N*N)/(blcoksize*blcoksize);
encrypt_block_code=cell(1,BlockNumber);
blockNo=1;
for i=1:N/blcoksize 
    mstart=(i-1)*blcoksize+1;  
    for j=1:N/blcoksize   
        nstart=(j-1)*blcoksize+1;  
        imBlock=zeros(blcoksize,blcoksize); % 保存每一个block灰度值

        for m=mstart:1:mstart+blcoksize-1
            for n=nstart:nstart+blcoksize-1
                mblock=mod(m,blcoksize);
                nblock=mod(n,blcoksize);
                if mblock==0 
                    mblock=blcoksize;
                end
                if nblock==0 
                    nblock=blcoksize;
                end
                imBlock(mblock,nblock)=encrypted_image(m,n); % 保存每一个block  
           
            end
  
        end
            
        %%%%%%%%% 对每个Block进行zigzag扫描，得到每个block的系数向量vblock
        for ii=1:4
            for jj=1:4
                pixel_code=double(dec2bin(imBlock(ii,jj),8))-48;
                encrypt_block_code{:,blockNo}=cat(2,encrypt_block_code{:,blockNo},pixel_code);
                    
            end
        end
%         LSB=encrypt_block_code{1,blockNo}(128);
%         if LSB==1
%             encrypt_block_code{1,blockNo}(1:127)=circshift(encrypt_block_code{1,blockNo}(1:127)',4)'; % 循环右移n位，恢复原来的顺序
%         end
         
        blockNo=blockNo+1;
    end
end



%% 对隐藏数据进行加密后嵌入。（data-hiding key:DH_Key）
% hidendata：待隐藏数据 0 1 bit

key=DH_Key;
RandStream.setGlobalStream ... 
     (RandStream('mt19937ar','seed',key));
hidendata_len=length(hidendata);
permuteDataNo=randperm(hidendata_len); % 对data 的序号进行重排
permuteDataValue=zeros(1,hidendata_len); % permuteDataValue为根据数据隐藏key排列之后的data的值
for i=1:hidendata_len
    permuteDataValue(i)=hidendata(permuteDataNo(i));
end

 
hidendata_len=length(hidendata);
hidendata_len_code=dec2bin(hidendata_len-1,21);
hidendata_len_code=double(hidendata_len_code)-48; % 嵌入数据长度所占位数编码

hiden_total=cat(2,hidendata_len_code,permuteDataValue);
len=length(hiden_total); 


%% 计算不能被数据嵌入的长度

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
 


%% 数据嵌入

current_p=1;
current_bit=1;
flag=0;
for i=1:BlockNumber

    encrypt_block_code{1,i}=double(encrypt_block_code{1,i});
    LSB=encrypt_block_code{1,i}(128);
    if LSB==1 % LSB=1，该blcok用于嵌入，等于0，不嵌入。
%         encrypt_block_code{1,i}(1:127)=circshift(encrypt_block_code{1,i}(1:127)',4)'; % 循环右移n位，恢复原来的顺序
        embed_data_len=encrypt_block_code{1,i}(121:127);
        data_len=bin2dec(char((embed_data_len)+48));
        data_len=data_len+1; % 之前是减1嵌入的。
        if flag==0
            if current_p-1+data_len<=no_embed_len
                current_p=current_p+data_len;
                continue;
            else     % 当前块可以嵌入数据
                res=abs(no_embed_len-(current_p-1+data_len)); % 此块可以嵌入多少数据
                if res<len
                encrypt_block_code{1,i}(120-data_len+1:120-data_len+1+res-1)=hiden_total(current_bit:current_bit+res-1); % y由于LSB的最后部分嵌入在此块的后部，所以数据从块的可嵌入部分头开始
                current_bit=current_bit+res;
                flag=1; %current_p 不再使用，不会进入这个if
                continue;
                else
                    encrypt_block_code{1,i}(120-data_len+1:120-data_len+1+len-1)=hiden_total(current_bit:current_bit+len-1);
                    break;
                end
            end
        end
        if flag==1
%             tempdata = encrypt_block_code{1,i};    
            if current_bit-1+data_len<len
                disp(i)
                encrypt_block_code{1,i}(120-data_len+1:120)=hiden_total(current_bit:current_bit+data_len-1);
%                 encrypt_block_code{1,i} = tempdata;
            else
                res=len-(current_bit-1);
                encrypt_block_code{1,i}(120-res+1:120)=hiden_total(current_bit:current_bit+res-1); % 从数据长度的后面开始嵌入。。。。。***。 *为嵌入的部分，从左到右。
%                 encrypt_block_code{1,i} = tempdata;
                break;
            end
%             encrypt_block_code{1,i} = tempdata;
            current_bit=current_bit+data_len;
        end
    end
end
encrypt_block_code_embed=encrypt_block_code;


%% 嵌入完毕的block code转为图像。

blockNo=1;
for i=1:N/blcoksize 
    mstart=(i-1)*blcoksize+1;  
    for j=1:N/blcoksize   
        nstart=(j-1)*blcoksize+1;  
        bp=1;
        encrypt_block=reshape(double(encrypt_block_code_embed{:,blockNo}),8,16);
        for m=mstart:1:mstart+blcoksize-1
            for n=nstart:nstart+blcoksize-1
                encrypted_image(m,n)=bin2dec(char((encrypt_block(:,bp))'+48));
                bp=bp+1;
            end
        end
        blockNo=blockNo+1;      
    end
end
encrypt_image_hiddendata_embed=encrypted_image;
