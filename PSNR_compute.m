function PSNR=PSNR_compute(im1,im2)


[N1,N2]=size(im1);

z=0;   
for i=1:N1
    for j=1:N2
        z=z+(double(im1(i,j))-double(im2(i,j))).^2; 
    end
end
z=z/(N1*N2);  
PSNR=10*log10(255.^2/z); 
