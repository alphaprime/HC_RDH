
function [coff RError]=block_sparse_representation(img,block_size) 


L=2;
%load('Dictionary\50_dictionary\D_64_2_50'); % 训练好的字典
load('Dictionary\50_dictionary\D_64_2_50'); 

% displayDictionaryElementsAsImage(Dictionary_out, floor(sqrt(K)), floor(size(Dictionary_out,2)/floor(sqrt(K))),block_size,block_size,0);



% figure(1),displayDictionaryElementsAsImage(Dictionary_out,16,16,4,4);
 
[N1,N2]=size(img);
block_num_img=(N1*N2)/(block_size*block_size);
 
img_block = block_vector_img(img,N1,N2,block_size,block_num_img);


%  img1=reshape(img,1,N1*N2);
%  img_block=reshape(img1,16,block_num_img);
 
X=img_block;
A=OMP(Dictionary_out,X,L); % 对每个测试图像，稀疏系数计算

coff = round(A);
data_recover_block=Dictionary_out*coff;
RError=img_block-round(data_recover_block);




% %%  截断成３位系数，５位残差模式。 
% RError_vector=reshape(RError,1,16*block_num_img);
% 
% for i=1:16*block_num_img
%     if RError_vector(i)<-128
%         RError_vector(i)=-128;
%     end
%     if RError_vector(i)>127
%         RError_vector(i)=127;
%     end
% end
% 
% error_truate=RError_vector-reshape(RError,1,16*block_num_img);
% 
% 
% 
% 
% xC=cell(2,1); 
% xC{1}=double(error_truate)';
% %varargout = Huff06(xC);
% varargout = Arith07(xC);
% 
% 
% len=length(varargout)*8;
% error_code_truate=[];
% 
% for i=1:length(varargout)
%     temp=dec2bin(varargout(i),8);
%     temp_code=double(temp)-48; 
%     error_code_truate=cat(2,error_code_truate,temp_code);  % 截断导致的误差，可逆方法嵌入
% end
% 
% RError_final=reshape(RError_vector+128,N1,N2);  % RError_final ５位的残差
% 
% 
% xC=cell(2,1); 
% xC{1}=double(RError_vector)';
% %varargout = Huff06(xC);
% varargout = Arith07(xC);
% 
% 
% len=length(varargout)*8;
% error_code=[];
% 
% for i=1:length(varargout)
%     temp=dec2bin(varargout(i),8);
%     temp_code=double(temp)-48; 
%     error_code=cat(2,error_code,temp_code);  % 截断导致的误差，可逆方法嵌入
% end
% 
% 
% 
% 
% 
% % 
% % 
% % %%计算３位系数
% % %img_coefficient=zeros(1,block_num_img);
% % ppp=13; total_block_code=cell(1,block_num_img);
% % for blockNo=1:block_num_img
% %     coff_block=coff(:,blockNo); %
% %     position=find(coff_block(:,1)~=0);
% %             
% %     if length(position)==2
% %         position1=dec2bin(position(1)-1,ppp);  % 注意 这里减1. 0-255 表示1到256
% %         position2=dec2bin(position(2)-1,ppp);
% %         position1_code=double(position1)-48; 
% %         position2_code=double(position2)-48; 
% %         position_code=cat(2,position1_code,position2_code);
% %         value=full(coff_block(:,1));
% %         if value(position(1))>=0
% %             value1_code=dectoComplementalBin(value(position(1)),0);
% %         else
% %             value1_code=dectoComplementalBin(abs(value(position(1))),1);
% %         end
% %         if value(position(2))>=0
% %             value2_code=dectoComplementalBin(value(position(2)),0);
% %         else
% %             value2_code=dectoComplementalBin(abs(value(position(2))),1);
% %         end
% %             value_code=cat(2,value1_code,value2_code);
% %     end
% %             
% %     if length(position)==1
% %         position1=dec2bin(position(1)-1,ppp);  % 注意 这里减1. 0-255 表示1到256
% %         position2=dec2bin(0,8);
% %         position1_code=double(position1)-48; 
% %         position2_code=double(position2)-48; 
% %         position_code=cat(2,position1_code,position2_code);
% %         value=full(coff_block(:,1));
% %         if value(position(1))>=0
% %             value1_code=dectoComplementalBin(value(position(1)),0);
% %         else
% %             value1_code=dectoComplementalBin(abs(value(position(1))),1);
% %         end
% %             value2_code=dectoComplementalBin(0,0);
% %             value_code=cat(2,value1_code,value2_code);
% %     end
% %              
% %     if length(position)==0
% %         position1=dec2bin(0,ppp);
% %         position2=dec2bin(0,ppp);
% %         position1_code=double(position1)-48; 
% %         position2_code=double(position2)-48; 
% %         position_code=cat(2,position1_code,position2_code);
% %         value1_code=dectoComplementalBin(0,0);
% %         value2_code=dectoComplementalBin(0,0);
% %         value_code=cat(2,value1_code,value2_code);
% %     end
% %             
% %             
% %     coff_code=cat(2,position_code,value_code); % part1:系数的位置和值得二进制编码   part2:RError_code
% %     total_block_code{:,blockNo}=coff_code;   
% % %    img_coefficient(blockNo)=bin2dec(char((coff_code(:,blockNo))'+48));
% % end
% % 
% % 
% % 
% % 
% % img_coeff=zeros(N1,N2);
% % blockNo=1;
% % for i=1:N1/block_size
% %     mstart=(i-1)*block_size+1;  
% %     for j=1:N2/block_size
% %         nstart=(j-1)*block_size+1;  
% %         bp=1;
% %         %encrypt_block=reshape(double(encrypt_block_code{:,RPV_block(blockNo)}),8,16);
% %         %encrypt_block=reshape(double(encrypt_block_code{:,(blockNo)}),8,16);
% %        coeff_block=reshape(double(total_block_code{:,(blockNo)}),3,16);
% %        
% %         for m=mstart:1:mstart+block_size-1
% %             for n=nstart:nstart+block_size-1
% %                 %img(m,n)=bin2dec(char((encrypt_block(:,bp))'+48));
% %                 if bp==16
% %                     img_coeff(m,n)=bin2dec(char((coeff_block(:,bp))'+48));
% %                     %img_resdual(m,n)=floor(img_resdual(m,n)/2)*2;  % 去掉最后一位，最后一位不参与隐藏
% %                 else
% %                 img_coeff(m,n)=bin2dec(char((coeff_block(:,bp))'+48));
% %                 end
% %                 bp=bp+1;
% %             end
% %         end
% %         disp(blockNo);
% %         blockNo=blockNo+1;      
% %     end
% % end
% % 
% % %% img_coeff 系数的值，前三位
% % 
% % 
% % 
% % for i=1:N1
% %     for j=1:N2
% %         img_encrypt_coeff_error(i,j)=img_coeff(i,j)*32+RError_final(i,j);
% %     end
% % end
% % 
% % 
% % frame_embed_vector=reshape(img_encrypt_coeff_error,1,N1*N2);
% % 
% % 
% % RPV = randperm(N1*N2); 
% % for i=1:N1*N2
% %     frame_embed_vector(i)=frame_embed_vector(RPV(i));
% % end
% % 
% % frame_embed_random=reshape(frame_embed_vector,N1,N2);
% % 
% % [frame_embed_final, actualEmbedRate]=RDHEmbedding(double(frame_embed_random),error_code(1:10000)); 
% % imwrite(uint8(frame_embed_final),'data\test\encryption\encryptedLena_new.bmp');
% % 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% % 
% % 
% % %% 以下为备份，不使用。
% P1=zeros(1,block_num_img);
% P2=zeros(1,block_num_img);
% P3=zeros(1,block_num_img);
% V3=zeros(1,block_num_img);
% V1=zeros(1,block_num_img);
% V2=zeros(1,block_num_img);
% ip1=1;
% ip2=1;
% ip3=1;
% iv1=1;
% iv2=1;
% iv3=1;
% for i=1:block_num_img
% 
%     coff_block=coff(:,i); %
%     position=find(coff_block(:,1)~=0);
% %     if length(position)==3
% %        P1(i)=position(1);   ip1=ip1+1;           
% %        P2(i)=position(2) ;   ip2=ip2+1; 
% %        P3(i)=position(3) ; ip3=ip3+1; 
% %        value=full(coff_block(:,1));
% %        V1(i)=value(position(1)) ;  iv1=iv1+1;              
% %        V2(i)=value(position(2)) ;iv2=iv2+1;
% %        V3(i)=value(position(3)) ;iv3=iv3+1;
% %     end
%     if length(position)==2
%        P1(ip1)=position(1); ip1=ip1+1;           
%        P2(ip2)=position(2) ;  ip2=ip2+1; 
% %        P3(i)=0;
%        value=full(coff_block(:,1));
%        V1(iv1)=value(position(1)) ;   iv1=iv1+1;            
%        V2(iv2)=value(position(2)) ;  iv2=iv2+1;
% %        V3(i)=0;
%     end
%     if length(position)==1
%        P1(ip1)=position(1);    ip1=ip1+1;        
%        %P2(i)=0 ; 
% %        P3(i)=0;
%        value=full(coff_block(:,1));  
%        V1(i)=value(position(1)) ;   iv1=iv1+1;             
%        %V2(i)=0 ;
% %        V3(i)=0;
%     end
% %     if length(position)==0
% %        P1(i)=0;            
% %        P2(i)=0 ;            
% % %        P3(i)=0; 
% %        V1(i)=0 ;               
% %        V2(i)=0 ;
% % %        V3(i)=0;
% %     end
% end
% 
% P1=P1(1:ip1-1);
% P2=P2(1:ip2-1);
% P3=P3(1:ip3-1);
% V1=V1(1:iv1-1);
% V2=V2(1:iv2-1);
% V3=V3(1:iv3-1);
% xC=cell(2,1); 
% xC{1}=double(P1)';
% %varargout = Huff06(xC);
% varargout = Arith07(xC);
% len=length(varargout)*8;
% P1_code=[];
% for i=1:length(varargout)
%     temp=dec2bin(varargout(i),8);
%     temp_code=double(temp)-48; 
%     P1_code=cat(2,P1_code,temp_code);
% end
% 
% 
% xC=cell(2,1); 
% xC{1}=double(P2)';
% %varargout = Huff06(xC);
% varargout = Arith07(xC);
% len=length(varargout)*8;
% P2_code=[];
% for i=1:length(varargout)
%     temp=dec2bin(varargout(i),8);
%     temp_code=double(temp)-48; 
%     P2_code=cat(2,P2_code,temp_code);
% end
% 
% % xC=cell(2,1); 
% % xC{1}=double(P3)';
% % %varargout = Huff06(xC);
% % varargout = Arith07(xC);
% % len=length(varargout)*8;
% % P3_code=[];
% % for i=1:length(varargout)
% %     temp=dec2bin(varargout(i),8);
% %     temp_code=double(temp)-48; 
% %     P3_code=cat(2,P3_code,temp_code);
% % end
% 
% xC=cell(2,1); 
% xC{1}=double(V1)';
% %varargout = Huff06(xC);
% varargout = Arith07(xC);
% len=length(varargout)*8;
% V1_code=[];
% for i=1:length(varargout)
%     temp=dec2bin(varargout(i),8);
%     temp_code=double(temp)-48; 
%     V1_code=cat(2,V1_code,temp_code);
% end
% 
% xC=cell(2,1); 
% xC{1}=double(V2)';
% %varargout = Huff06(xC);
% varargout = Arith07(xC);
% len=length(varargout)*8;
% V2_code=[];
% for i=1:length(varargout)
%     temp=dec2bin(varargout(i),8);
%     temp_code=double(temp)-48; 
%     V2_code=cat(2,V2_code,temp_code);
% end
% 
% 
% % xC=cell(2,1); 
% % xC{1}=double(V3)';
% % %varargout = Huff06(xC);
% % varargout = Arith07(xC);
% % len=length(varargout)*8;
% % V3_code=[];
% % for i=1:length(varargout)
% %     temp=dec2bin(varargout(i),8);
% %     temp_code=double(temp)-48; 
% %     V3_code=cat(2,V3_code,temp_code);
% % end
% 
% 
% %bpp=(length(error_code_truate)+
% bpp=(length(error_code)+length(P1_code)+length(P2_code)+length(V1_code)+length(V2_code))/(N1*N2);
% %data=cat(2,V3_code,cat(2,V2_code,cat(2,V1_code,cat(2,P3_code,cat(2,P1_code,P2_code)))));
% data=cat(2,V2_code,cat(2,V1_code,cat(2,P1_code,P2_code)));
% data_embed=cat(2,data,error_code_truate);
% 
% [frame_embed, actualEmbedRate]=RDHEmbedding(double((RError_final)),data); %% 
% imwrite(uint8(frame_embed),'data\test\encryption\encryptedLena_new.bmp');
% 
% 
% % %  
% % % 
% % % 
% % % 
% % % % 
% % % % %% 根据选择的block个数计算
% % % % 
% % % % NB=16384; % 决定嵌入率
% % % % 
% % % % 
% % % % [n1,n2]=size(RError);
% % % % RError_modi=zeros(n1,n2);
% % % % for i=1:n1
% % % %     for j=1:n2
% % % %         RError_modi(i,j)=floor((RError(i,j)+128)/8)*8+randi([0 7]);
% % % %     end
% % % % end
% % % % PSNR_error=PSNR_compute(RError+128,RError_modi); % 误差的ＰＳＮＲ
% % % % 
% % % % data_recover_block=round(Dictionary_out*coff)+RError_modi-128; % 所有的误差都修改了。
% % % % 
% % % % data_recover_block_NB(:,1:NB)=data_recover_block(:,1:NB); %只选择NB个blcok
% % % % data_recover_block_NB(:,NB+1:n2)=img_block(:,NB+1:n2);
% % % % PSNR_recovery=PSNR_compute(data_recover_block_NB,img_block); % 恢复的图像的PSNR
% % % %  
% % % % %% 
% % % % 
% % % % 
% % % %img_block=zeros(block_size*block_size,block_num_img);
% % % % N2=NB/32;
% % Errorimg=zeros(N1,N2);
% % blockNo=1;
% % for i=1:N1/block_size 
% %     mstart=(i-1)*block_size+1;  
% %     for j=1:N2/block_size   
% %         nstart=(j-1)*block_size+1;  
% %         %imBlock=zeros(block_size,block_size); % 保存每一个block灰度值
% %         imBlock=reshape(RError(:,blockNo)+128,block_size,block_size);  
% %     
% %         for m=mstart:1:mstart+block_size-1
% %             for n=nstart:nstart+block_size-1
% %                 mblock=mod(m,block_size);
% %                 nblock=mod(n,block_size);
% %                 if mblock==0 
% %                     mblock=block_size;
% %                 end
% %                 if nblock==0 
% %                     nblock=block_size;
% %                 end
% %                 Errorimg(m,n)=imBlock(mblock,nblock);
% %            
% %             end
% %   
% %         end
% %             
% %         %%%%%%%%% 对每个Block进行一维扫描，得到每个block的向量vblock
% % %         img_block(:,blockNo)=reshape(imBlock,1,blocksize*blocksize);
% %         blockNo=blockNo+1;
% %                 
% %     end
% % end
% % 
% % imwrite(uint8(Errorimg),'data\test\encryption\encrypted_Lena_error.bmp');
% % % 
% % [frame_embed, actualEmbedRate]=RDHEmbedding(double(Errorimg),data); %% 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % %frame_embed：系数——残差
% % [frame_embed_final, actualEmbedRate]=RDHEmbedding(double(frame_embed),error_code); 
% % 
% % 
% % 
% % 
% % 
% % % 
% % %  
% % % frame_embed_final=zeros(N1,N2);
% % % 
% % % for i=1:N1
% % %     for j=1:N2
% % %         data_data=mod(Errorimg(i,j),8);
% % %         frame_embed_final(i,j)=frame_embed(i,j)*8+data_data;
% % %        
% % %     end
% % % end
% % %  
% % % 
% % % 
% % % 
% % PSNR_compute(Errorimg,frame_embed);
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % frame_embed_vector=reshape(frame_embed_final,1,N1*N2);
% % 
% % 
% % RPV = randperm(N1*N2); 
% % for i=1:N1*N2
% %     frame_embed_vector(i)=frame_embed_vector(RPV(i));
% % end
% % 
% % frame_embed_random=reshape(frame_embed_vector,N1,N2);
% % 
% % imwrite(uint8(frame_embed_random),'data\test\encryption\encryptedLena_new.bmp');
% % 
% % 
% % % kk=1;
% % % PSNR=zeros(1,50);
% % % for erate=1:0.01:2
% % % lengthdata=erate*512*512;
% % %  
% % % data_data=zeros(1,floor(lengthdata)+1);
% % % for jj=1:floor(lengthdata)+1
% % %     data_data(jj)=randi([0 1]);
% % % end
% % % [frame_embed_data, actualEmbedRate]=RDHEmbedding(double(frame_embed_random),data_data);
% % % PSNR(kk)=PSNR_compute(frame_embed_random,frame_embed_data);
% % % save  PSNR_VRAE PSNR ;
% % % kk=kk+1;
% % % end
% %  
% % 
% % 
% % 
% % 
% % % 
% % %  
% % % 
% % % 
% % % Errorimg_sparse=zeros(N1,N2);
% % % Errorimg_del=floor(Errorimg./8);
% % % for i=1:N1
% % %     for j=1:N2
% % %         Errorimg_sparse(i,j)=randi([0 7])*32+Errorimg_del(i,j); % 三位系数＋５位残差
% % %     end
% % % end
% % % 
% % % % 向Errorimg_sparse中可逆嵌入数据
% % % ER=0.001;
% % % datalength=512*512*ER;
% % % data=zeros(1,datalength);
% % % for i=1:datalength
% % %     data(i)=randi([0 1]);
% % % end
% % % [frame_embed, actualEmbedRate]=RDHEmbedding(double(Errorimg_sparse),data);
% % % frame_embed_error=mod(frame_embed,32);
% % % PSNR_compute(Errorimg_sparse,frame_embed);
% % % 
% % % for i=1:N1
% % %     for j=1:N2
% % %         frame_embed_error(i,j)=frame_embed_error(i,j)*8+randi([0 7]);
% % %     end
% % % end
% % % 
% % % 
% % % 
% % % frame_embed_error_block = block_vector_img(frame_embed_error,N1,N2,block_size,NB); 
% % % 
% % % data_direct_block=round(Dictionary_out*coff(:,1:NB))+frame_embed_error_block-128;
% % % data_direct_block_NB(:,1:NB)=data_direct_block(:,1:NB); %只选择NB个blcok
% % % data_direct_block_NB(:,NB+1:n2)=img_block(:,NB+1:n2);
% % PSNR_direct=PSNR_compute(data_direct_block_NB,img_block); % 直接解密的图像的PSNR