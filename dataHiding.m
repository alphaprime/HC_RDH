
clc
clear all;
prev_dir = pwd; file_dir = fileparts(mfilename('fullpath')); cd(file_dir);
addpath(genpath(pwd));
img_Encry=imread('data\test\encryption\encrypt_image_final.bmp'); % test image
block_size=4;

%% 数据生成 嵌入
key=3;
embed_bit_length_total=1024;
RandStream.setGlobalStream ...  
     (RandStream('mt19937ar','seed',key));  
hidendata =  randi([0 1],1,embed_bit_length_total);  % 根据嵌入长度，随机生成的嵌入数据。
DH_Key=2; % 随机的种子，作为数据隐藏key
encrypt_image_embed=encryptedImgHiding(img_Encry,hidendata,DH_Key,block_size);

%% 结果显示
hidendata=char((hidendata)+48); 
disp(['The embedding data are:' hidendata]);
disp(['The data length is:' int2str(length(hidendata)) ]);
disp(['The embedding rate is:' num2str(length(hidendata)/(512*512*8)) ])
figure(1),imshow(encrypt_image_embed);
imwrite(encrypt_image_embed,'data\test\encryption\encrypt_image_embed.bmp'); % 嵌入数据之后的图像