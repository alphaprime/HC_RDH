
clc
clear all;
prev_dir = pwd; file_dir = fileparts(mfilename('fullpath')); cd(file_dir);
addpath(genpath(pwd));
img_Encry=imread('data\test\encryption\encrypt_image_final.bmp'); % test image
block_size=4;

%% �������� Ƕ��
key=3;
embed_bit_length_total=1024;
RandStream.setGlobalStream ...  
     (RandStream('mt19937ar','seed',key));  
hidendata =  randi([0 1],1,embed_bit_length_total);  % ����Ƕ�볤�ȣ�������ɵ�Ƕ�����ݡ�
DH_Key=2; % ��������ӣ���Ϊ��������key
encrypt_image_embed=encryptedImgHiding(img_Encry,hidendata,DH_Key,block_size);

%% �����ʾ
hidendata=char((hidendata)+48); 
disp(['The embedding data are:' hidendata]);
disp(['The data length is:' int2str(length(hidendata)) ]);
disp(['The embedding rate is:' num2str(length(hidendata)/(512*512*8)) ])
figure(1),imshow(encrypt_image_embed);
imwrite(encrypt_image_embed,'data\test\encryption\encrypt_image_embed.bmp'); % Ƕ������֮���ͼ��