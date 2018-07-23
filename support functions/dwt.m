%2D integer 9/7 DWT
%fn=fopen('sensin.img','rb');
%I=fread(fn,[256,256]);
%I=I';
%fclose(fn);
% level=1;
% % % I=imread('SENSIN.bmp');
% I=imread('image\Lena.bmp');
function [imgwave,J]=dwt(I,level)

I=uint16(I);
J=int16(I);
[m,n]=size(I);
w=n;
h=m;
for l=1:level
    w=w/2;
    h=h/2;
    for i=1:2*h
        x=J(i,1:2*w);

        d(1)=x(2)-floor(-1.0/16 * (x(3) + x(5)) + 9.0/16 * (x(1) + x(3)) + 0.5);

        for j=2:w-2
            d(j)=x(2*j)-floor(-1.0/16 * (x(2*j-3) + x(2*j+3)) + 9.0/16 * (x(2*j-1) + x(2*j+1)) + 0.5);
        end

        d(w-1)=x(2*w-2)-floor(-1.0/16 * (x(2*w-5) + x(2*w-1)) + 9.0/16 * (x(2*w-1) + x(2*w-3)) + 0.5);

        d(w)=x(2*w)-floor(-1.0/8 * x(2*w-3) + 9.0/8 * x(2*w-1) + 0.5);

        c(1)=x(1)-floor(-1.0/2 * d(1) + 0.5);

        for j=2:w 
            c(j) = x(2*j-1) - floor(-0.25 * (d(j-1) +d(j)) +0.5);
        end
        I(i,1:w) = c(1:w); 
        I(i,(w+1):2*w)=d(1:w).^2;
        J(i,1:w) = c(1:w);
        J(i,(w+1):2*w)=d(1:w);
    end

    for j=1:2*w
        y=J(1:2*h,j);

        d(1)=y(2)-floor(-1.0/16 * (y(3) + y(5)) + 9.0/16 * (y(1) + y(3)) + 0.5);

        for i=2:h-2
            d(i)=y(2*i)-floor(-1.0/16 * (y(2*i-3) + y(2*i+3)) + 9.0/16 * (y(2*i-1) + y(2*i+1)) + 0.5);
        end

        d(h-1)=y(2*h-2)-floor(-1.0/16 * (y(2*h-5) + y(2*h-1)) + 9.0/16 * (y(2*h-1) + y(2*h-3)) + 0.5);

        d(h)=y(2*h)-floor(-1.0/8 * y(2*h-3) + 9.0/8 * y(2*h-1) + 0.5);

        c(1)=y(1)-floor(-1.0/2 * d(1) + 0.5);

        for i=2:h 
            c(i) = y(2*i-1) - floor(-0.25 * (d(i-1) +d(i)) +0.5);
        end
        if j<=w
            I(1:2*h,j) = [c(1:h),d(1:h).^2]';
        else
            I(1:2*h,j) = [c(1:h).^2,d(1:h).^2]';
        end
        J(1:2*h,j) = [c(1:h),d(1:h)]';
    end
end
%imshow(uint8(I));

imgwave=uint8(I);


% imwrite(uint8(I),'sensin_dwt.bmp');
% fn=fopen('sensin_dwt.dat','wb');
% fwrite(fn,J','int16');
% fclose(fn);

