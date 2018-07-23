% JPEGdemo.m
% Prototype JPEG compression algorithm demostration
%
% copyright (c) 1997-2002 by Yu Hen Hu
% 
% This algorithm only demonstrate the basic 
% JPEG functionalities.
% It is not necessarily a faithful 
% implementation of JPEG.
% Its output will not be binary bit streams 
% either, but rather
% an integer stream of 0 and 1s
% Only gray scale picture is considered
% 
% Last modification: 11/6/2002
clear all
clc
% Load data
disp('Enter ...')
% disp('0 (default) - load a 64 x 64 image, or ')
% disp('1 - Use text book 8 x 8 data (example 8.28)')
% chos=input('Enter your choice: ');

chos=0;
if isempty(chos), chos=0; end % default choice
if chos==0,
    %load p64int.txt;f=p64int; clear p64int; 
    x=imread('ExperimentAnalysis\totalselectpatchimage.bmp');
    %load lena.mat
    f=x;%(1+128:128+128,1+128:128+128);
    imshow(mat2gray(f))
    clear x
else
    %  variable f  is taken from the text book.8
f=[139 144 149 153 155 155 155 155
144 151 153 156 159 156 156 156
150 155 160 163 158 156 156 156
159 161 162 160 160 159 159 159
159 160 161 162 162 155 155 155
161 161 161 161 160 157 157 157
162 162 161 163 162 157 157 157
162 162 161 161 163 158 158 158];

 f1=[52 55 61 66 70 61 64 73
    63 59 66 90 109 85 69 72
    62 59 68 113 144 104 66 73
    63 58 71 122 154 106 70 69 
    67 61 68 104 126 88 68 70
    79 65 60 70 77 68 58 75
    85 71 64 59 55 61 65 83
    87 79 69 68 65 76 78 94];
end
%echo on

% level shift by 128
if chos==0, f=f-128; elseif chos==1, f=f-128, end
%pause
drawnow
[mf,nf]=size(f); mb=mf/8; nb=nf/8;  
% size of f, # of blocks of f

% Step 1. 2D separable DCT on each 8x8 
% blocks 
if chos==0, 
    Ff=blkproc(f,[8 8],'dct');  
    % apply DCT to each column of each block of f
    Ff=blkproc(Ff',[8 8],'dct');
    % apply DCT to each row of each block of Ff
    Ff=round(Ff');
    % transpose back to proper orientation
elseif chos==1,
    Ff=blkproc(f,[8 8],'dct'),
    % apply DCT to each column of each block of f
    Ff=blkproc(Ff',[8 8],'dct'),
    % apply DCT to each row of each block of Ff
    Ff=round(Ff'),
    % transpose back to proper orientation
end
%pause

% Perceptual scaler quantization
%
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



% this is the quantization matrix shown in figure 8.37 in the textbook
%pause
% Now perform rounding
if chos==0, 
    Fq=round(blkproc(Ff,[8 8],'divq',Q));
elseif chos==1,
    Fq=round(blkproc(Ff,[8 8],'divq',Q)),
end
%pause
%echo off
% DPCM of DC component, scaned row-wise 
if mb*nb > 1,
   fdc=reshape(Fq(1:8:mf,1:8:nf)',mb*nb,1);   
   fdpcm=dpcm(fdc,1);
elseif chos==1,
   fdpcm=Fq(1,1)-(-17);
else
   fdpcm=Fq(1,1);
end
dccof=[];
for i=1:mb*nb,
   dccof=[dccof jdcenc(fdpcm(i))];
end
if chos==1,
    disp(['Differential DC coefficient (' num2str(fdpcm) ') is encoded as: ']);
    disp(int2str(dccof));
end
%pause
%echo on

% Zig-Zag scanning of AC coefficients
z=[1   2   6   7  15  16  28  29
   3   5   8  14  17  27  30  43
   4   9  13  18  26  31  42  44
  10  12  19  25  32  41  45  54
  11  20  24  33  40  46  53  55
  21  23  34  39  47  52  56  61
  22  35  38  48  51  57  60  62
  36  37  49  50  58  59  63  64];


%pause
%echo off
acseq=[];
for i=1:mb
  for j=1:nb
    tmp(z)=Fq(8*(i-1)+1:8*i,8*(j-1)+1:8*j); 
    % tmp is 1 by 64
    eobi=max(find(tmp~=0)); %end of block index
                    % eob is labelled with 999    
    acseq=[acseq tmp(2:eobi) 999];
  end
end
accof=jacenc(acseq);

disp(['DC coefficient after Huffman coding has ' int2str(length(dccof)) ...
' bits']);
disp(['AC coefficient after Huffman coding has ' int2str(length(accof)) ...
' bits']);

disp(['Compression Rate   ' num2str((length(dccof)+length(accof))/(mb*nb*64)) '   Bits / pixel '])
disp(['Compression Ratio   ' num2str(8/((length(dccof)+length(accof))/(mb*nb*64))) ' : 1'])