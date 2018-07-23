clc
clear all;

%% training data
% TR_IMG_PATH = 'data/training/image/';
block_size=4;
% D = img_smp_block(TR_IMG_PATH, '*.bmp', block_size); 
% 
% %% sparse coding
% dictionary=0; % if get the dictionary
% if dictionary==1 
%     dictionary_generation(D); 
% end


%%

EN_Key=1;
TR_IMG_PATH='data/test/Kodak/';  
mypath.output_imgpath='data/test/encryptEmbed/';  
img_dir = dir(fullfile(TR_IMG_PATH, '*.png'));
img_dir_size=512; % 令训练图像为512*512
img_num = length(img_dir);


 
ER=[1.8,2.0,2.2];
PSNR_total_our=zeros(img_num,length(ER));

for ii = 23:img_num
    disp(img_dir(ii).name);
    img = imread(fullfile(TR_IMG_PATH, img_dir(ii).name)); 
    img=rgb2gray(img);
    img=imresize(img,[img_dir_size img_dir_size]);
    [coff RError]=block_sparse_representation(double(img),block_size); % 对原始图像的每个blcok进行稀疏表示
    [RError_code,coeff_token_code,NC,length_bit_average,max_length,min_length]=residualCoding(RError,512,block_size);

    for k=1:length(ER)
         embedbit=ER(k)*512*512;
         L=94;
         blockembedneed=round(embedbit/(L-14));
         [encrypted_image,direct_image,PSNR_direct,position_code]=imageEncoding(img,coff,RError_code,coeff_token_code,NC,EN_Key,blockembedneed,block_size,RError,img); % 对图像进行加密。流加密
        PSNR_total_our(ii,k)=PSNR_direct;
        save PSNR_total_Kodak PSNR_total_our;
    end
     
end





