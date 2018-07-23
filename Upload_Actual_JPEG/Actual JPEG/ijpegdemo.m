% Inverse JPEG i.e reconstruction of image lena
%clear,clc
% accof and dccof are from jpegdemo.m , run it first
acarr=jacdec(accof);
dcarr=jdcdec(dccof);
% Assumed that image size is 256 X 256, recostruction begins
%load lena.mat % To find MSE, we need to have original image
x=imread('ExperimentAnalysis\totalselectpatchimage.bmp');
x=double(x);
subplot 121
imshow(mat2gray(x)),title(' Original ')
drawnow
quality = input('What quality of compression you require - ');
Q =[16 11 10 16  24  40  51  61
    12 12 14 19  26  58  60  55
    14 13 16 24  40  57  69  56
    14 17 22 29  51  87  80  62
    18 22 37 56  68 109 103  77
    24 35 55 64  81 104 113  92
    49 64 78 87 103 121 120 101
    72 92 95 98 112 100 103 99];

 Q50=Q;
 if quality > 50
     QX = round(Q50.*(ones(8)*((100-quality)/50)));
     %QX = uint8(QX);
 elseif quality < 50
     QX = round(Q50.*(ones(8)*(50/quality)));
     %QX = uint8(QX);
 elseif quality == 50
     QX = Q50;
 end

Q=QX;







z=[1   2   6   7  15  16  28  29
   3   5   8  14  17  27  30  43
   4   9  13  18  26  31  42  44
  10  12  19  25  32  41  45  54
  11  20  24  33  40  46  53  55
  21  23  34  39  47  52  56  61
  22  35  38  48  51  57  60  62
  36  37  49  50  58  59  63  64];
z=z(:);

[mf,nf]=size(x); mb=mf/8; nb=nf/8;  

%mb=256/8; nb=256/8;  % Number of blocks

Eob=find(acarr==999);
kk=1;ind1=1;n=1;
for ii=1:mb
    for jj=1:nb
        ac=acarr(ind1:Eob(n)-1);
        ind1=Eob(n)+1;
        n=n+1;
        ri(8*(ii-1)+1:8*ii,8*(jj-1)+1:8*jj)=dezz([dcarr(kk) ac zeros(1,63-length(ac))]);
        kk=kk+1;
    end
end

iFq=round(blkproc(ri,[8 8],'idivq',Q));
iFf=blkproc(iFq,[8 8],'idct2');  
iFf=round(iFf+128);
subplot 122
imshow(mat2gray(iFf)),title(' Reconstructed ')
% Calculate MSE , SNR
MSE=mean(mean((x-iFf).^2))                 % Doubt about formulae 
SNR=10*log10(255^2/MSE)       % Doubt about formulae

 

error=x-iFf;
[m,n]=size(error);
total_error=reshape(error,1,m*n);
save  'ExperimentAnalysis\total_error.mat' total_error;
save  'ExperimentAnalysis\recover_selectpatch_jpeg.mat' iFf;
