function encrypted_image=imageEncryption_SMC(img)

blcoksize=4;
[N,N]=size(img);
BlockNumber=(N*N)/(blcoksize*blcoksize); 
encrypt_block_code=cell(1,BlockNumber);
residual_block_code=cell(1,BlockNumber);
RPV=zeros(BlockNumber,blcoksize*blcoksize*8);

EN_Key=1;
for key=EN_Key:BlockNumber
   RandStream.setGlobalStream ...  
   (RandStream('mt19937ar','seed',key));  
   RPV(key,:) =  randi([0 1],1,blcoksize*blcoksize*8);  
end




blockNo=1;
for i=1:N/blcoksize 
    mstart=(i-1)*blcoksize+1;  
    for j=1:N/blcoksize   
        nstart=(j-1)*blcoksize+1;  
         
        bp=1;
        for m=mstart:1:mstart+blcoksize-1
            for n=nstart:nstart+blcoksize-1
                residual_block(:,bp)=dec2bin(img(m,n),8)-48;
                bp=bp+1;
            end
  
        end
        residual_block_code{:,(blockNo)}=reshape(residual_block,1,128);
                  
        
        encrypt_block_code{:,blockNo}=xor(residual_block_code{:,blockNo},RPV(blockNo,:));
            
        blockNo=blockNo+1;
                
    end
end


 
img1=img;
blockNo=1;
for i=1:N/blcoksize 
    mstart=(i-1)*blcoksize+1;  
    for j=1:N/blcoksize   
        nstart=(j-1)*blcoksize+1;  
        bp=1; 
        encrypt_block=reshape(double(encrypt_block_code{:,(blockNo)}),8,16);
        for m=mstart:1:mstart+blcoksize-1
            for n=nstart:nstart+blcoksize-1
                 
                img1(m,n)=bin2dec(char((encrypt_block(:,bp))'+48));
                bp=bp+1;
            end
        end
        blockNo=blockNo+1;      
    end
end
encrypted_image=img1;


