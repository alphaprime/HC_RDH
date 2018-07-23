clc
clear all;
prev_dir = pwd; file_dir = fileparts(mfilename('fullpath')); cd(file_dir);
addpath(genpath(pwd));


%% 1) sparse coding 
%input: test image  
%output: sparse coefficient and residual error

% image_random=zeros(512,512);
% for i=1:512
%     for j=1:512
%         image_random(i,j)=randi([0 255]);
%     end
% end
% imwrite(uint8(image_random),'data/training/image_random/image_38.bmp');







TR_IMG_PATH = 'data/training/image/';
block_size=4;
D = img_smp_block(TR_IMG_PATH, '*.bmp', block_size); 

dictionary=0;  % if get the dictionary
if dictionary==1 
    tic;
    dictionary_generation(D); 
    toc;
 
end
 
load('Dictionary\50_dictionary\D_64_2_50');

% A=Dictionary_out;
% [A1,A2]=size(A);
% A=reshape(A,1,A1*A2);
% 
% xC=cell(2,1); 
% xC{1}=double(round(A.*10000))';
% %varargout = Huff06(xC);
% varargout = Arith07(xC);
% len=length(varargout)*8;
% A_code=[];
% for i=1:length(varargout)
%     temp=dec2bin(varargout(i),8);
%     temp_code=double(temp)-48; 
%     A_code=cat(2,A_code,temp_code);
% end

%A_code  13424



%addpath('\support functions\ksvdbox13')
% dictimg1 = showdict(Dictionary_out,[1 1]*4,round(sqrt(64)),round(sqrt(64)),'lines','highcontrast');
% imshow(dictimg1);


% dictimg2 = showdict(D2,[1 1]*6,round(sqrt(128)),round(sqrt(128)),'lines','highcontrast');







 %load('Dictionary\dic_random\D_8192_2_10');
% displayDictionaryElementsAsImage((Dictionary_out),8,8,4,4);
% figure;hist(Dictionary_out(:)); axis([-1 1 0 300]); set(gca,'FontSize',16);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% TR_IMG_PATH='data/test/BOSS/';  
% 
% img_dir = dir(fullfile(TR_IMG_PATH, '*.pgm'));
% img_dir_size=512; % 令训练图像为512*512
% img_num = length(img_dir);
%  
% sum_ER=0;
% ER=zeros(1,img_num);
% EN_Key=1;    
% 
% for ii = 83:img_num
%     disp(ii);  
%     disp(img_dir(ii).name);
%     img = imread(fullfile(TR_IMG_PATH, img_dir(ii).name));
%     img=imresize(img,[512,512]);
%     [N,N]=size(img);
%     %imshow(img);
%     imwrite(img,'data/temp.bmp');
%     I=imread('data/temp.bmp');
%     [coff, RError]=block_sparse_representation(I,block_size);  
%     [RError_code,coeff_token_code,NC,length_bit_average,max_length,min_length]=residualCoding(RError,N,block_size);
%     for embedRate=0.4:0.05:3
%         embedbit=embedRate*512*512;
%         L=94;
%         blockembedneed=round(embedbit/(L-14));
%         [encrypted_image,direct_image,PSNR_direct,position_code]=imageEncoding(I,coff,RError_code,coeff_token_code,NC,EN_Key,blockembedneed,block_size,RError,I); % 对图像进行加密。流加密
%         if PSNR_direct<=40
%             ER(ii)=embedRate;
%             sum_ER=sum_ER+embedRate;
%             %save  'ExperimentAnalysis/databaseresult/ER_boss_our_40db' ER;   
%             break;
%         end
%     end
% 
% end
% averageER=sum_ER/img_num;





tic;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
img=imread('data\test\peppers.bmp'); % test image
% img=imread('data\test\encryption\encryptedLena_new.bmp');
% 
% w=fspecial('gaussian',[3 3]);
% img2=imresize(img,[N1/2 N2/2]);
% figure,imshow(img2);
% 
% img2_img=imresize(img2,[N1,N2]);
% PSNR_compute(img,img2_img); 
%  








% if size(img,3) == 3
%     img = rgb2gray(img);
% end
% 
% img=imresize(img, [512,512]);
[N,N]=size(img);
% img=imageEncryption_SMC(double(img));
% imwrite(uint8(img_encrypt),'data\test\encryption\encrypted_Lena.bmp');

% 
% [imgwave,J]=dwt(img,1); 
% [N1,N2]=size(img);
% imLL1=imgwave(1:N1/2,1:N/2);
%  




%J=zeros(N1,N2);
% J(1:N1/2,1:N2/2)=imLL1;
% 
% LH1=J(1:N1/2,N2/2+1:N2);
% HL1=J(N1/2+1:N1,1:N2/2);
% HH1=J(N1/2+1:N1,N2/2+1:N2);
% 
% LH1=LH1;
% HL1=HL1;
% HH1=HH1;
% J(1:N1/2,N2/2+1:N2)=LH1;
% J(N1/2+1:N1,1:N2/2)=HL1;
% J(N1/2+1:N1,N2/2+1:N2)=HH1;

% 
% 
% % % 
% % % % 
% errorDWT=cat(2,cat(2,reshape(LH1,1,N1*N2/4),reshape(HL1,1,N1*N2/4)),reshape(HH1,1,N1*N2/4));
% % % errorDWT=reshape(errorDWT,N1,length(errorDWT)/N1);
% % % errorDWT=double(errorDWT+128);
% % 
% % 
% % 
% imAfterRecovery=Idwt(imgwave,J,1); 
% % PSNR_compute(double(img),double(imAfterRecovery));
% % % error1=double(imAfterRecovery)-128;
% % save  error1 error1;
% 
% 
%  
% errorDWTRecovery=double(img)-double(imAfterRecovery);
% errorDWTRecovery=reshape(errorDWTRecovery,1,N1*N2);
% 
% 
% 
% % errorDWT=errorDWT+128;
% % data=zeros(1,410656);
% % [imLL1_embed, actualEmbedRate]=RDHEmbedding(double(errorDWT),data);
% % imwrite(uint8(imLL1_embed),'data\test\encryption\encrypted_Lena_new.bmp');
% 
% 
% 
% % 
% % errorDWT=reshape(double(img)-double(imAfterRecovery),1,N1*N2);
% % % for i=1:length(errorDWT)
% % %     if errorDWT(i)<16 && errorDWT(i)>-16
% % %         errorDWT(i)=0;
% % %     end
% % % %     if errorDWT(i)<-20
% % % %         errorDWT(i)=-20;
% % % %     end
% % % end
% % 
% % 
% % 
% % PSNR_compute(double(img),reshape(errorDWT,N1,N2)+double(imAfterRecovery));
% % 
% % % 
% xC=cell(2,1); 
% xC{1}=double(errorDWT)';
% %varargout = Huff06(xC);
% varargout = Arith07(xC);
% len=length(varargout)*8;
% errorDWT_code=[];
% for i=1:length(varargout)
%     temp=dec2bin(varargout(i),8);
%     temp_code=double(temp)-48; 
%     errorDWT_code=cat(2,errorDWT_code,temp_code);
% end
% % 
% [imLL1_embed, actualEmbedRate]=RDHEmbedding(double(imLL1),errorDWT_code);
% [coff, RError]=block_sparse_representation(imLL1,block_size);  
[coff, RError]=block_sparse_representation(double(img),block_size);  
%% 2) Entropy encoding and Encryption
% input: sparse coefficient , residual error , EN_Key 加密key
% output: Encoded Image
toc;
[RError_code,coeff_token_code,NC,length_bit_average,max_length,min_length]=residualCoding(RError,N,block_size);

% nd_block=zeros(1,length(RError_code));
% for i=1:length(RError_code)
%     nd_block(i)=length(RError_code{1,i});
% end
% 
% nd_block=reshape(nd_block,128,128);
% figure(3),imagesc(nd_block');
% colormap('default');  
% colorbar;
% set(gca,'fontsize',22,'ylim',[1,128]);
% set(gca,'fontsize',22,'xlim',[1,128]);
% xlabel('Patch Index','fontsize',22);
% ylabel('Patch Index','fontsize',22);
% title('Lax','fontsize',24);


EN_Key=1;      


% 根据嵌入容量的大小，确定选择的嵌入block的个数。

 
embedRate=0.3125;
% ER=[0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8  ];
% k=1;
% PSNR_Lena=zeros(1,8);
L=94;
% for k=1:8
%        disp(k);
%        embedRate=ER(k);
dictionarysize=13424;
embedbit=embedRate*512*512;
blockembedneed=round((embedbit+dictionarysize)/(L-14)); % 每个block可以嵌入94bit，计算需要嵌入的block个数


%blockembedneed=1792; % 假设50个patch

 
%borderline=80;   % 确定是否需要嵌入的边界
 
[encrypted_image,direct_image,PSNR_direct,PSNR_JPEG,position_code]=imageEncoding(img,coff,RError_code,coeff_token_code,NC,EN_Key,blockembedneed,block_size,RError,img); % 对图像进行加密。流加密
 
%PSNR_Lena(k)=PSNR_direct;
% save 'ExperimentAnalysis\PSNR_total_man.mat' PSNR_Lena;
% k=k+1;
% if PSNR_direct<40
%     break;
% end
% end

imwrite(encrypted_image,'ExperimentAnalysis\encrypted_image.bmp');
imwrite(direct_image,'ExperimentAnalysis\direct_image.bmp');

%[encryptedposition_embed, encryptedEmbedRate]=RDHEmbedding(double(encrypted_image),position_code);
 












%% 3) Embed the LSB to the encrypted image




% 
% encrypt_image_LSBembed=encryptedImgLSBHiding(encrypted_image,no_embed_lsb_len_code,no_embed_lsb,block_size);
% encrypted_image_final=encrypt_image_LSBembed;
% imwrite(encrypted_image_final,'data\test\encryption\encrypt_image_final.bmp');
% 
% %% Performance analysis
% entropy_encrypted=entropy(encrypt_image_LSBembed);
% entropy_org_encry=entropyComputing(img,block_size); % 对直接加密的图像计算熵
% figure(1);
% subplot(1,2,1),imshow(img),title(' Original ');
% subplot(1,2,2),imshow(encrypted_image),title(' Encrypted ');
% 
% figure(2)
% subplot(1,2,1),hist(reshape(double(img),1,512*512),0:1:255),title(' Original ');
% subplot(1,2,2),hist(reshape(double(encrypt_image_LSBembed),1,512*512),0:1:255),title(' Encrypted ');