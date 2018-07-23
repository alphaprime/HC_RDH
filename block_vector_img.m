function img_block = block_vector_img(img,N1,N2,blocksize,block_num_img)

img_block=zeros(blocksize*blocksize,block_num_img);
blockNo=1;
for i=1:N1/blocksize 
    mstart=(i-1)*blocksize+1;  
    for j=1:N2/blocksize   
        nstart=(j-1)*blocksize+1;  
        imBlock=zeros(blocksize,blocksize); % ����ÿһ��block�Ҷ�ֵ
    
        for m=mstart:1:mstart+blocksize-1
            for n=nstart:nstart+blocksize-1
                mblock=mod(m,blocksize);
                nblock=mod(n,blocksize);
                if mblock==0 
                    mblock=blocksize;
                end
                if nblock==0 
                    nblock=blocksize;
                end
                imBlock(mblock,nblock)=img(m,n); % ����ÿһ��block  
           
            end
  
        end
            
        %%%%%%%%% ��ÿ��Block����һάɨ�裬�õ�ÿ��block������vblock
        img_block(:,blockNo)=reshape(imBlock,1,blocksize*blocksize);
        blockNo=blockNo+1;
                
    end
end