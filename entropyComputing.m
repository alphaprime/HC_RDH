function entropy_org_encry=entropyComputing(img,blcoksize) % 对直接加密的图像计算熵
key=2;
RandStream.setGlobalStream ...  
     (RandStream('mt19937ar','seed',key));  
RPV =  randi([0 1],1,blcoksize*blcoksize*8);  
[N,N]=size(img);
BlockNumber=(N*N)/(blcoksize*blcoksize);
total_block_code=cell(1,BlockNumber);
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
                imBlock(mblock,nblock)=img(m,n); % 保存每一个block  
           
            end
  
        end
            
        %%%%%%%%% 对每个Block进行zigzag扫描，得到每个block的系数向量vblock
        for ii=1:4
            for jj=1:4
                pixel_code=double(dec2bin(imBlock(ii,jj),8))-48;
                total_block_code{:,blockNo}=cat(2,total_block_code{:,blockNo},pixel_code);
                    
            end
        end
        encrypt_block_code{:,blockNo}=xor(total_block_code{:,blockNo},RPV);
        blockNo=blockNo+1;
    end
end


blockNo=1;
for i=1:N/blcoksize 
    mstart=(i-1)*blcoksize+1;  
    for j=1:N/blcoksize   
        nstart=(j-1)*blcoksize+1;  
        bp=1;
        encrypt_block=reshape(double(encrypt_block_code{:,(blockNo)}),8,16);
        for m=mstart:1:mstart+blcoksize-1
            for n=nstart:nstart+blcoksize-1
                img(m,n)=bin2dec(char((encrypt_block(:,bp))'+48));
                bp=bp+1;
            end
        end
        blockNo=blockNo+1;      
    end
end
encrypted_image=img;
entropy_org_encry=entropy(encrypted_image);
            