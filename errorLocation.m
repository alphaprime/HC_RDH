function errorLocation(image_recovered,img,block_size)

[N1,N2]=size(img);
block_num_img=(N1*N2)/(block_size*block_size);

img_block = block_vector_img(img,N1,N2,block_size,block_num_img);

image_recovered_img=block_vector_img(image_recovered,N1,N2,block_size,block_num_img);

for k=1:16384
    if sum(img_block(:,k))~=sum(image_recovered_img(:,k) )
        disp(k);
    end
end