clc
clear all;
prev_dir = pwd; file_dir = fileparts(mfilename('fullpath')); cd(file_dir);
addpath(genpath(pwd));
img_Encry_embed=imread('data\test\encryption\encrypt_image_embed.bmp'); % test image
block_size=4;

%% ��ȡ���� 
DH_Key=2; % ��������ӣ���Ϊ��������key
hidendata_extract=encryptedImgExtract(img_Encry_embed,DH_Key,block_size);  



%% ԭʼǶ������ݣ����ں���ȡ�����ݽ��бȽ�
key=3;
embed_bit_length_total=1024;
RandStream.setGlobalStream ...  
     (RandStream('mt19937ar','seed',key));  
hidendata_original =  randi([0 1],1,embed_bit_length_total);  % ����Ƕ�볤�ȣ�������ɵ�Ƕ�����ݡ�

% �ж���ȡ�������Ƿ���ȷ����
hidendata_extract=char((hidendata_extract)+48);
hidendata_original=char((hidendata_original)+48);
if strcmp(hidendata_original,hidendata_extract)==1
    disp(['The data extracted are:' hidendata_extract ', Correct and Lossless!']);
    disp(['The data length is:' int2str(length(hidendata_extract)) ]);
    disp(['The embedding rate is:' num2str(length(hidendata_extract)/(512*512*8)) ]);
else
    disp(['The data original  are:' hidendata_original]);
    disp(['The data extracted are:' hidendata_extract ', There exist some errors, please check!']);
end