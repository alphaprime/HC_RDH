function encrypt_image_LSBembed=encryptedImgLSBHiding(encrypted_image,no_embed_lsb_len_code,no_embed_lsb,blcoksize)


[N,N]=size(encrypted_image);
BlockNumber=(N*N)/(blcoksize*blcoksize);
encrypt_block_code=cell(1,BlockNumber);
blockNo=1;
for i=1:N/blcoksize 
    mstart=(i-1)*blcoksize+1;  
    for j=1:N/blcoksize   
        nstart=(j-1)*blcoksize+1;  
        imBlock=zeros(blcoksize,blcoksize); % ����ÿһ��block�Ҷ�ֵ

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
                imBlock(mblock,nblock)=encrypted_image(m,n); % ����ÿһ��block  
           
            end
  
        end
            
        %%%%%%%%% ��ÿ��Block����zigzagɨ�裬�õ�ÿ��block��ϵ������vblock
        for ii=1:4
            for jj=1:4
                pixel_code=double(dec2bin(imBlock(ii,jj),8))-48;
                encrypt_block_code{:,blockNo}=cat(2,encrypt_block_code{:,blockNo},pixel_code);
                    
            end
        end
         
        blockNo=blockNo+1;
    end
end



hidenLSB_total=cat(2,no_embed_lsb_len_code,no_embed_lsb);
len=length(hidenLSB_total);



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
        if current_p-1+data_len<len
            tempdata(120-data_len+1:120)=hidenLSB_total(current_p:current_p+data_len-1);
        else
            res=len-(current_p-1);
            tempdata(120-res+1:120)=hidenLSB_total(current_p:current_p+res-1); % �����ݳ��ȵĺ��濪ʼǶ�롣��������***�� *ΪǶ��Ĳ��֣������ҡ�
            encrypt_block_code{1,i} = tempdata;
            break;
        end
     
%         tempdata(1:127)=circshift(tempdata(1:127)',-4)'; % ѭ������nλ
        encrypt_block_code{1,i} = tempdata;
        current_p=current_p+data_len;
        sum=sum+data_len;
    end
end
encrypt_block_code_embed=encrypt_block_code;


 



%% Ƕ����ϵ�block codeתΪͼ��

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
encrypt_image_LSBembed=encrypted_image;
