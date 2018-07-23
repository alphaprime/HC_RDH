function decrypted_image=imageRecovery(img_Encry_embed,EN_Key,blcoksize) 


%% 图像转为向量
[N,N]=size(img_Encry_embed);
BlockNumber=(N*N)/(blcoksize*blcoksize);
encrypt_block_code=cell(1,BlockNumber);
decrypt_block_code=cell(1,BlockNumber);
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
                imBlock(mblock,nblock)=img_Encry_embed(m,n); % 保存每一个block  
           
            end
  
        end
            
        %%%%%%%%% 对每个Block进行zigzag扫描，得到每个block的系数向量vblock
        for ii=1:4
            for jj=1:4
                pixel_code=double(dec2bin(imBlock(ii,jj),8))-48;
                encrypt_block_code{:,blockNo}=cat(2,encrypt_block_code{:,blockNo},pixel_code);
                    
            end
        end
         
        blockNo=blockNo+1;
    end
end


%% 提取LSB

hidenLSB=LSBextract(encrypt_block_code,BlockNumber);

%% 解密
k=1;
RPV=zeros(BlockNumber,blcoksize*blcoksize*8);
for key=EN_Key:BlockNumber
   RandStream.setGlobalStream ...  
   (RandStream('mt19937ar','seed',key));  
   RPV(key,:) =  randi([0 1],1,blcoksize*blcoksize*8);  
end

encrypt_block=cell(1,BlockNumber);
error=cell(1,BlockNumber);
for i=1:BlockNumber
    encrypt_block_code{1,i}=double(encrypt_block_code{1,i});
    LSB=encrypt_block_code{1,i}(128);
    if LSB==1 % 待编写
        
        embed_data_len=encrypt_block_code{1,i}(121:127);
        data_len=bin2dec(char((embed_data_len)+48));
        data_len=data_len+1; % 嵌入数据的长度
        encrypt_block_code{:,i}=xor(encrypt_block_code{:,i},RPV(i,:));
        error_len=128-1-7-data_len-6-16-22;
        position1_code=encrypt_block_code{1,i}(1:8);
        position2_code=encrypt_block_code{1,i}(9:16);
        position1=bin2dec(char((position1_code)+48))+1; % 位置1
        position2=bin2dec(char((position2_code)+48))+1; % 位置2
        
        value1_code=encrypt_block_code{1,i}(17:27);
        value2_code=encrypt_block_code{1,i}(28:38);
        value1=complementalBintoDec(double((value1_code))');   
        value2=complementalBintoDec(double((value2_code))');
        
        
        error_code=encrypt_block_code{1,i}(39:39+error_len-1);
        
        
        coeff_token_len_code=encrypt_block_code{1,i}(39+error_len:39+error_len+4-1);
        coeff_token_len=bin2dec(char((coeff_token_len_code)+48))+1; %coeff_token的长度，在error_code的最前面,用来解码
        
        NC_code=encrypt_block_code{1,i}(39+error_len+4-1+1:39+error_len+4-1+1+2-1);
        NC_value=bin2dec(char((NC_code)+48))+1; % NC，用来解吗
        
 
        error{:,i}=de_CAVLC(error_code,coeff_token_len,NC_value);  
        error_vector=reshape(error{:,i},16,1);
        decrypt_block_code{:,i}=block_deSC(position1,position2,value1,value2,error_vector); %% 根据sparse coding恢复原始block 待编写
        encrypt_block{:,i}=reshape(double(decrypt_block_code{:,i}),4,4);
        
    end
    
    if LSB==0  % 恢复不能压缩的block的内容
        decrypt_block_code_128=xor(encrypt_block_code{:,i},RPV(i,:));
        decrypt_block_code_128(128)=hidenLSB(k);
        decrypt_block_code{:,i}=vectorToMatrix(decrypt_block_code_128);
        encrypt_block{:,i}=reshape(double(decrypt_block_code{:,i}),4,4);
        encrypt_block{:,i}=encrypt_block{:,i}';
        k=k+1;
    end
     
end


%% decrypt_block_code 转为图像
decrypted_image=zeros(N,N);
blockNo=1;
for i=1:N/blcoksize 
    mstart=(i-1)*blcoksize+1;  
    for j=1:N/blcoksize   
        nstart=(j-1)*blcoksize+1;  
        disp(blockNo) ; 
        %encrypt_block=reshape(double(decrypt_block_code{:,blockNo}),4,4);
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
                decrypted_image(m,n)=encrypt_block{:,blockNo}(mblock,nblock); % 保存每一个block  
           
            end
  
        end
        blockNo=blockNo+1;      
    end
end



 