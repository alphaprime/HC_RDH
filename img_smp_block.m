function D = img_smp_block(img_path, type, block_size)

img_dir = dir(fullfile(img_path, type));
img_dir_size=512; % ÁîÑµÁ·Í¼ÏñÎª512*512

img_num = length(img_dir);
block_num_img=(img_dir_size*img_dir_size)/(block_size*block_size);


D=zeros(block_size*block_size,img_num*block_num_img);
for ii = 1:length(img_dir),
    im = imread(fullfile(img_path, img_dir(ii).name)); 
    [N1,N2]=size(im);
    img_block = block_vector_img(im,N1,N2,block_size,block_num_img);
    D(:,(ii-1)*block_num_img+1:(ii-1)*block_num_img+block_num_img)=img_block;
end

