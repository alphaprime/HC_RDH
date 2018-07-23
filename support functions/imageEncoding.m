function [encrypted_image,direct_image,PSNR_direct,PSNR_JPEG,embed_position_code]=imageEncoding(img,coff,RError_code,coeff_token_code,NC,EN_Key,blockembedneed,blcoksize,RError,img_original)  % 对图像进行加密。流加密

%% 对RError_code〉76（76根据字典而定）的block不进行数据嵌入，直接加密。并将加密后的最后一个bit置0
[N,N]=size(img);
BlockNumber=(N*N)/(blcoksize*blcoksize);
total_block_code=cell(1,BlockNumber);
encrypt_block_code=cell(1,BlockNumber);
direct_block_code=cell(1,BlockNumber);
RError_code_total=cell(1,BlockNumber);
residual_block_code=cell(1,BlockNumber);
residual_block_code1=cell(1,BlockNumber);
residual_block_code2=cell(1,BlockNumber);
blockNo=1;sum=0;not_embed=0;
no_embed_lsb=zeros(1,N*N);
embedblockno=zeros(1,BlockNumber);
ENO=1;

% key=EN_Key;
% RandStream.setGlobalStream ...  
%      (RandStream('mt19937ar','seed',key));  
% RPV =  randi([0 1],1,blcoksize*blcoksize*8);  

RPV=zeros(BlockNumber,blcoksize*blcoksize*8);
for key=EN_Key:BlockNumber
   RandStream.setGlobalStream ...  
   (RandStream('mt19937ar','seed',key));  
   RPV(key,:) =  randi([0 1],1,blcoksize*blcoksize*8);  
end





key=EN_Key;
RandStream.setGlobalStream ...  
     (RandStream('mt19937ar','seed',key));  
RPV_block = randperm(BlockNumber);

rlength=zeros(1,BlockNumber);
for i=1:BlockNumber
rlength(i)=length(RError_code{1,i});
end



[B,IX]=sort(rlength);
borderline=B(blockembedneed);
ppp=6; % 用多少位表示位置数据
blockneed=0;
numk=1;

 
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
        if length(RError_code{1,blockNo})<=borderline  && blockneed <blockembedneed
            blockneed=blockneed+1;
            coff_block=coff(:,blockNo); %
            position=find(coff_block(:,1)~=0);
            
            if length(position)==2
                position1=dec2bin(position(1)-1,ppp);  % 注意 这里减1. 0-255 表示1到256
                position2=dec2bin(position(2)-1,ppp);
                position1_code=double(position1)-48; 
                position2_code=double(position2)-48; 
                position_code=cat(2,position1_code,position2_code);
                value=full(coff_block(:,1));
                if value(position(1))>=0
                    value1_code=dectoComplementalBin(value(position(1)),0);
                else
                    value1_code=dectoComplementalBin(abs(value(position(1))),1);
                end
                if value(position(2))>=0
                    value2_code=dectoComplementalBin(value(position(2)),0);
                else
                    value2_code=dectoComplementalBin(abs(value(position(2))),1);
                end
                value_code=cat(2,value1_code,value2_code);
            end
            
            if length(position)==1
                position1=dec2bin(position(1)-1,ppp);  % 注意 这里减1. 0-255 表示1到256
                position2=dec2bin(0,8);
                position1_code=double(position1)-48; 
                position2_code=double(position2)-48; 
                position_code=cat(2,position1_code,position2_code);
                value=full(coff_block(:,1));
                if value(position(1))>=0
                    value1_code=dectoComplementalBin(value(position(1)),0);
                else
                    value1_code=dectoComplementalBin(abs(value(position(1))),1);
                end
                value2_code=dectoComplementalBin(0,0);
                value_code=cat(2,value1_code,value2_code);
            end
             
            if length(position)==0
                position1=dec2bin(0,ppp);
                position2=dec2bin(0,ppp);
                position1_code=double(position1)-48; 
                position2_code=double(position2)-48; 
                position_code=cat(2,position1_code,position2_code);
                value1_code=dectoComplementalBin(0,0);
                value2_code=dectoComplementalBin(0,0);
                value_code=cat(2,value1_code,value2_code);
            end
            
            
            coff_code=cat(2,position_code,value_code); % part1:系数的位置和值得二进制编码   part2:RError_code
            
            
            coeff_token_len=length(coeff_token_code{1,blockNo});
            coeff_token_len_code=dec2bin(coeff_token_len-1,4);% part3: 残差的coff_coken长度
            coeff_token_len_code=double(coeff_token_len_code)-48;
            NC_value=NC(blockNo)-2;
            NC_code=dec2bin(NC_value-1,2);% part3: 残差的coff_coken长度
            NC_code=double(NC_code)-48;
            RError_code_total{1,blockNo}=cat(2,cat(2,RError_code{1,blockNo},coeff_token_len_code),NC_code);
            data_len=blcoksize*blcoksize*8-length(coff_code)-1;%length(RError_code{1,blockNo})-length(coff_code)-length(coeff_token_len_code)-1-7-2;
%           data_len_code=dec2bin(data_len-1,7);% part4: 嵌入数据的长度
%           data_len_code=double(data_len_code)-48;
            data_code=randi([0 1],1,data_len);% 数据的部分设成随机数

            embed_flag_code=1;
            total_block_code{:,blockNo}=cat(2,cat(2,coff_code,data_code),embed_flag_code);
            %total_block_code{:,blockNo}=cat(2,cat(2,cat(2,cat(2,cat(2,cat(2,coff_code,RError_code{1,blockNo}),coeff_token_len_code),NC_code),data_code),data_len_code),embed_flag_code); 
           % encrypt_block_code{:,blockNo}=xor(total_block_code{:,blockNo},RPV(blockNo,:));% 加密
            %encrypt_block_code{:,blockNo}=total_block_code{:,blockNo};
            %encrypt_block_code{:,blockNo}(121:127)=data_len_code; % 加密后的倒数第2位到8位设置为数据长度项
           % encrypt_block_code{:,blockNo}(128)=1; % 加密之后最后一位置标志位1，说明可以嵌入
            
            sum=sum+data_len;%总嵌入数据位数
            
            randipixel_0=zeros(1,128);
            residual_block_code{:,blockNo}= randipixel_0;     % 被选择的block 置0 或者255
            
            embedblockno(ENO)=blockNo;
            ENO=ENO+1;
        else
            lsb=mod(img(m,n),2) ;
            not_embed=not_embed+1; % 无法嵌入的block个数
            no_embed_lsb(not_embed)=lsb;
            
            for ii=1:4
                for jj=1:4
                    pixel_code=double(dec2bin(imBlock(ii,jj),8))-48;
                    total_block_code{:,blockNo}=cat(2,total_block_code{:,blockNo},pixel_code);
                    
                end
            end
            residual_block_code{:,blockNo}=total_block_code{:,blockNo};  % 没被选择的block
            residual_block_code1{:,numk}=total_block_code{:,blockNo}; 
            numk=numk+1;
%             encrypt_block_code{:,blockNo}=xor(total_block_code{:,blockNo},RPV(blockNo,:));
%             encrypt_block_code{:,blockNo}(128)=0; % 标志位为0，不可以嵌入
        end
        
      
        
        
        blockNo=blockNo+1;
                
    end
end


 
embedblockno=embedblockno(1:ENO-1);  % 需嵌入的block编号 将其表示为bit，可逆嵌入加密图像。
row=zeros(1,128);
colum=zeros(1,128);
row_code=[];
colum_code=[];
for i=1:ENO-1  % 只记录第一个block的位置 
    tempNO=embedblockno(i);
    
    if mod(tempNO,128)==0
        row(i)=floor(tempNO/128);
        row_code=cat(2,row_code,double(dec2bin(row(i)-1,7))-48);
        colum(i)=128;
        colum_code=cat(2,colum_code,double(dec2bin(colum(i)-1,7))-48);
    else
        row(i)=floor(tempNO/128)+1;
        row_code=cat(2,row_code,double(dec2bin(row(i)-1,7))-48);
        colum(i)=mod(tempNO,128);
        colum_code=cat(2,colum_code,double(dec2bin(colum(i)-1,7))-48);
    end
end

embed_position_code=cat(2, row_code,colum_code);



%% 选择的block构成一个向量selectpatch
selectpatch=[];
totalselectpatchimage=zeros(64,blockembedneed/4);
blockNo=1;selectno=1;
for i=1:N/blcoksize  
    mstart=(i-1)*blcoksize+1;  
    for j=1:N/blcoksize   
        nstart=(j-1)*blcoksize+1;  
        if selectno<=blockembedneed
        if blockNo== embedblockno(selectno)
           % disp(selectno)
       
        for m=mstart:1:mstart+blcoksize-1
            for n=nstart:nstart+blcoksize-1
                
                selectpatch=cat(2,selectpatch,img(m,n));
            end
                 
        end
        
         
        
        selectno=selectno+1;
      
        end
        end
        blockNo=blockNo+1;      
    end
end
%totalselectpatchimage=reshape(selectpatch,64,blockembedneed/4);



totalselectpatchimage=uint8(totalselectpatchimage);
%figure; imshow(totalselectpatchimage);
imwrite(totalselectpatchimage,'ExperimentAnalysis\totalselectpatchimage.bmp');
save  'ExperimentAnalysis\totalselectpatchimage.mat' totalselectpatchimage;

%%

xC=cell(2,1); 
xC{1}=double(selectpatch)';
%varargout = Huff06(xC);
varargout = Arith07(xC);

% selectpatch=reshape(selectpatch,16,blockembedneed);
% [varargout,Res] = JPEGlike(0, double(selectpatch));

% [timeC,timeDC,sourcestr,decoded]=LZ77(double(selectpatch));
% data = rle(double(selectpatch));


len=length(varargout)*8;
selcetpatch_code=[];

for i=1:length(varargout)
    temp=dec2bin(varargout(i),8);
    temp_code=double(temp)-48; 
    selcetpatch_code=cat(2,selcetpatch_code,temp_code);
end

CR=length(selcetpatch_code)/(blockembedneed*16);
%%





%%%%%%%%%%%%%%%%%%%
%显示选择的block
%figure, imshow(img);
% for i=1:ENO-1
%    
%    hold on;
%    rectangle('Position',[4*colum(i),4*row(i)-4,4,4],'LineWidth',0.1,'edgecolor','r');   
% end


%%%%%%%%%%%%%%%%%%%
%% 生成嵌入图像



residual_block_code1=residual_block_code1(1:numk-1);
img_resdual=zeros(floor((numk-1)/(N/blcoksize))*4,512);
 


blockNo=1;
for i=1:floor((numk-1)/(N/blcoksize)) 
    mstart=(i-1)*blcoksize+1;  
    for j=1:N/blcoksize   
        nstart=(j-1)*blcoksize+1;  
        bp=1;
        %encrypt_block=reshape(double(encrypt_block_code{:,RPV_block(blockNo)}),8,16);
        %encrypt_block=reshape(double(encrypt_block_code{:,(blockNo)}),8,16);
        residual_block=reshape(double(residual_block_code1{:,(blockNo)}),8,16);
       
        for m=mstart:1:mstart+blcoksize-1
            for n=nstart:nstart+blcoksize-1
                %img(m,n)=bin2dec(char((encrypt_block(:,bp))'+48));
                if bp==16
                    img_resdual(m,n)=bin2dec(char((residual_block(:,bp))'+48));
                    %img_resdual(m,n)=floor(img_resdual(m,n)/2)*2;  % 去掉最后一位，最后一位不参与隐藏
                else
                img_resdual(m,n)=bin2dec(char((residual_block(:,bp))'+48));
                end
                bp=bp+1;
            end
        end
        blockNo=blockNo+1;      
    end
end


%% 需自嵌入的bit计算

no_embed_lsb=no_embed_lsb(1:not_embed); % 不能嵌入的block的最低位，需和数据一起嵌入。放在数据的最前面。
no_embed_lsb_len=length(no_embed_lsb);
no_embed_lsb_len_code=dec2bin(no_embed_lsb_len-1,14);
no_embed_lsb_len_code=double(no_embed_lsb_len_code)-48; % 非嵌入block的最低位长度所占位数编码

% embed_bit_length_total=sum-not_embed-14-21;  % 21 为嵌入数据长度的标识
% embed_rate=embed_bit_length_total/(N*N);%18 标识非嵌入block的长度


RDHembedSelf=cat(2,no_embed_lsb_len_code,no_embed_lsb); % 每个block的最后一位，记录下来嵌入


% 残差部分bit计算，记录下来嵌入
length_CAVLC=0;
error_total=zeros(1,16*blockembedneed);
k=0;
for i=1:BlockNumber
    if length(RError_code_total{1,i})~=0
       length_CAVLC=length_CAVLC+length(RError_code_total{1,i});
       error_total(16*k+1:16*k+16)=RError(:,i);
       k=k+1;
    end
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 注意这里修改，残差改为jpeg的残差%%%%%

xC=cell(2,1); 
xC{1}=error_total';
% load 'ExperimentAnalysis\total_error.mat';
% xC{1}=total_error;

varargout = Arith07(xC);
len=length(varargout)*8;
residual_code=[];

for i=1:length(varargout)
    temp=dec2bin(varargout(i),8);
    temp_code=double(temp)-48; 
    residual_code=cat(2,residual_code,temp_code);
end



%RDHembedSelf_total=cat(2,RDHembedSelf,residual_code);

RDHembedSelf_total=residual_code;
  


%% residual_image 通过RDH方法嵌入RDHembedSelf_total
 tic;
[frame_embed, actualEmbedRate]=RDHEmbedding(double(img_resdual),RDHembedSelf_total);
toc;
PSNR=PSNR_compute(frame_embed,double(img_resdual));

%figure; imshow(uint8(img_resdual));
%% 对嵌入后的图像恢复原始位置

blockNo=1;
for i=1:floor((numk-1)/(N/blcoksize)) 
    mstart=(i-1)*blcoksize+1;  
    for j=1:N/blcoksize   
        nstart=(j-1)*blcoksize+1;  
        bp=1;
        residual_block=zeros(8,16);
        for m=mstart:1:mstart+blcoksize-1
            for n=nstart:nstart+blcoksize-1
                if bp==16
                    %frame_embed(m,n)=frame_embed(m,n)+no_embed_lsb(blockNo);
                    residual_block(:,bp)=dec2bin(frame_embed(m,n),8)-48;
                else
                    residual_block(:,bp)=dec2bin(frame_embed(m,n),8)-48;
                end
                bp=bp+1;
            end
        end 
        residual_block_code2{:,(blockNo)}=reshape(residual_block,1,128);
        blockNo=blockNo+1;      
    end
end

residual_block_code2(blockNo:numk-1)=residual_block_code1(blockNo:numk-1);
residual_block_code2=residual_block_code2(1:numk-1);

%% 计算嵌入之后的图像，不用block部分嵌入，其他部分用系数恢复，计算与原始图像的PSNR 即为 直接解密图像的PSNR



L=2;
load('Dictionary\50_dictionary\D_64_2_50'); % 训练好的字典
 
 





ppp=6; % 用多少位表示位置数据
blockneed=0;
aaa=1;
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
        if length(RError_code{1,blockNo})<=borderline  && blockneed <blockembedneed
            blockneed=blockneed+1;
            coff_block=coff(:,blockNo); %
            position=find(coff_block(:,1)~=0);
            
            if length(position)==2
                position1=dec2bin(position(1)-1,ppp);  % 注意 这里减1. 0-255 表示1到256
                position2=dec2bin(position(2)-1,ppp);
                position1_code=double(position1)-48; 
                position2_code=double(position2)-48; 
                position_code=cat(2,position1_code,position2_code);
                value=full(coff_block(:,1));
                if value(position(1))>=0
                    value1_code=dectoComplementalBin(value(position(1)),0);
                else
                    value1_code=dectoComplementalBin(abs(value(position(1))),1);
                end
                if value(position(2))>=0
                    value2_code=dectoComplementalBin(value(position(2)),0);
                else
                    value2_code=dectoComplementalBin(abs(value(position(2))),1);
                end
                value_code=cat(2,value1_code,value2_code);
            end
            
            if length(position)==1
                position1=dec2bin(position(1)-1,ppp);  % 注意 这里减1. 0-255 表示1到256
                position2=dec2bin(0,8);
                position1_code=double(position1)-48; 
                position2_code=double(position2)-48; 
                position_code=cat(2,position1_code,position2_code);
                value=full(coff_block(:,1));
                if value(position(1))>=0
                    value1_code=dectoComplementalBin(value(position(1)),0);
                else
                    value1_code=dectoComplementalBin(abs(value(position(1))),1);
                end
                value2_code=dectoComplementalBin(0,0);
                value_code=cat(2,value1_code,value2_code);
            end
             
            if length(position)==0
                position1=dec2bin(0,ppp);
                position2=dec2bin(0,ppp);
                position1_code=double(position1)-48; 
                position2_code=double(position2)-48; 
                position_code=cat(2,position1_code,position2_code);
                value1_code=dectoComplementalBin(0,0);
                value2_code=dectoComplementalBin(0,0);
                value_code=cat(2,value1_code,value2_code);
            end
            
            
            coff_code=cat(2,position_code,value_code); % part1:系数的位置和值得二进制编码   part2:RError_code
            
            
            coeff_token_len=length(coeff_token_code{1,blockNo});
            coeff_token_len_code=dec2bin(coeff_token_len-1,4);% part3: 残差的coff_coken长度
            coeff_token_len_code=double(coeff_token_len_code)-48;
            NC_value=NC(blockNo)-2;
            NC_code=dec2bin(NC_value-1,2);% part3: 残差的coff_coken长度
            NC_code=double(NC_code)-48;
            RError_code_total{1,blockNo}=cat(2,cat(2,RError_code{1,blockNo},coeff_token_len_code),NC_code);
            data_len=blcoksize*blcoksize*8-length(coff_code)-1;%length(RError_code{1,blockNo})-length(coff_code)-length(coeff_token_len_code)-1-7-2;
            data_code=randi([0 1],1,data_len);% 数据的部分设成随机数
            embed_flag_code=1;
            total_block_code{:,blockNo}=cat(2,cat(2,coff_code,data_code),embed_flag_code);
            
            
            
            data_recover_block=Dictionary_out*coff(:,blockNo);
            data_recover_block_code=[];
            
            for bbb=1:16
                if data_recover_block(bbb)>255
                    data_recover_block(bbb)=255;
                end
                if data_recover_block(bbb)<0
                    data_recover_block(bbb)=0;
                end
                data_recover_block_code=cat(2,data_recover_block_code,dec2bin(round(data_recover_block(bbb)),8)-48);  
            end
            direct_block_code{:,blockNo}=data_recover_block_code;%  不加密恢复
            
            
           encrypt_block_code{:,blockNo}=xor(total_block_code{:,blockNo},RPV(blockNo,:));% 加密
           %encrypt_block_code{:,blockNo}(128)=1; % 加密之后最后一位置标志位1，说明可以嵌入
            
            
        else
             
           
           direct_block_code{:,blockNo}=residual_block_code2{:,aaa};
           encrypt_block_code{:,blockNo}=xor(residual_block_code2{:,aaa},RPV(blockNo,:));
           aaa=aaa+1;
           %encrypt_block_code{:,blockNo}(128)=0; % 标志位为0，不可以嵌入
        end
        
      
        
        
        blockNo=blockNo+1;
                
    end
end



%% 还原图像 （加密之后的，和直接解密的）










img1=img;
img2=img;
blockNo=1;
for i=1:N/blcoksize 
    mstart=(i-1)*blcoksize+1;  
    for j=1:N/blcoksize   
        nstart=(j-1)*blcoksize+1;  
        bp=1; 
        encrypt_block=reshape(double(encrypt_block_code{:,(blockNo)}),8,16);
        direct_block=reshape(double(direct_block_code{:,(blockNo)}),8,16);
        for m=mstart:1:mstart+blcoksize-1
            for n=nstart:nstart+blcoksize-1
                img1(m,n)=bin2dec(char((encrypt_block(:,bp))'+48));
                img2(m,n)=bin2dec(char((direct_block(:,bp))'+48));
                bp=bp+1;
            end
        end
        blockNo=blockNo+1;      
    end
end
encrypted_image=img1;
direct_image=img2;
% figure;imshow(direct_image); 
% figure;imshow(encrypted_image);  
%originalimg=imread('data\test\man.bmp'); % test image



%%%%%%%%%%%%%%%%%%%%%%%%%%% 此处修改 选择的patch变成JPEG压缩之后的，没有选择的和以前相同%%%%%%%%%%
% load  'ExperimentAnalysis\recover_selectpatch_jpeg.mat';
% selectpatch_jpeg=reshape(iFf,1,blockembedneed*16);   
% 
%  
% 
% 
% 
% jp=1;
% JPEGimg=zeros(N,N);
% blockNo=1;
% for i=1:N/blcoksize 
%     mstart=(i-1)*blcoksize+1;  
%     for j=1:N/blcoksize   
%         nstart=(j-1)*blcoksize+1;  
%         if length(RError_code{1,blockNo})<=borderline  && blockneed <blockembedneed
%             
%             for m=mstart:1:mstart+blcoksize-1
%                for n=nstart:nstart+blcoksize-1
%                    JPEGimg(mstart:mstart+blcoksize-1,nstart:nstart+blcoksize-1)=selectpatch_jpeg(jp); %等于ｊｐｅｇ恢复之后的
%                    jp=jp+1; 
%            
%                end
%   
%             end
% 
%         else
%             JPEGimg(mstart:mstart+blcoksize-1,nstart:nstart+blcoksize-1)=direct_image(mstart:mstart+blcoksize-1,nstart:nstart+blcoksize-1);
%         end
%  
%    
%         blockNo=blockNo+1;      
%     end
% end
% 
% PSNR_JPEG=PSNR_compute(double(JPEGimg),double(img_original));  % 直接恢复图像的PSNR
PSNR_JPEG=0;
PSNR_direct=PSNR_compute(double(direct_image),double(img_original));  % 直接恢复图像的PSNR






