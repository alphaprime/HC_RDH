clc
clear all;
prev_dir = pwd; file_dir = fileparts(mfilename('fullpath')); cd(file_dir);
addpath(genpath(pwd));
img_Encry_embed=imread('data\test\encryption\encrypt_image_embed.bmp'); % test image
block_size=4;

%% ��ȡ���� 
EN_Key=1;  % ��������ӣ���Ϊͼ�����key
image_recovered=imageRecovery(img_Encry_embed,EN_Key,block_size); 
imshow(uint8(image_recovered));

%% ԭʼ��������
img=imread('data\test\Peppers.bmp'); % test image
errorLocation(image_recovered,double(img),block_size);

PSNR=PSNR_compute(double(img),(image_recovered));
if PSNR==inf
    disp(['The PSNR for the recovered image is:' int2str(PSNR) '  Correct and Lossless!']);
else
    disp(['The PSNR for the recovered image is:' int2str(PSNR) '  There exists some Loss!']);
end