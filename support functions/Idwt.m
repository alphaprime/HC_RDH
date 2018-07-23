%2D integer 9/7 IDWT 
function imrec=Idwt(imgwave,J,level)

%level=1;
%imwrite(imgwave,'sensin_dwt.bmp');
fn=fopen('sensin_dwt.dat','wb');
fwrite(fn,J','int16');
fclose(fn);

fn = fopen('sensin_dwt.dat','rb');
[sm,sn]=size(imgwave);
K = fread(fn,[sm,sn],'int16=>int16');
fclose(fn);

K = K';

[m,n] = size(K);
w = n/2^level;
h = m/2^level;
for l = 1:level
    
    for j=1:2*w
        e = K(1:h,j);
        f = K((h+1):2*h,j);
        y(1) = e(1) + floor(-1.0/2 * f(1) + 0.5);
        for i=2:h
            y(2*i-1)=e(i) + floor(-1.0/4 * (f(i-1) + f(i)) + 0.5);
        end

        y(2)=f(1) + floor(9.0/16 * (y(1)+y(3)) - 1.0/16*(y(3)+y(5)) + 0.5);
        for i=2:h-2 
            y(2*i) = f(i) + floor( 9.0/16 * (y(2*i-1) +y(2*i+1)) -1.0/16*(y(2*i-3)+y(2*i+3))+0.5);
        end
        y(2*h-2) = f(h-1) + floor( 9.0/16*(y(2*h-3)+y(2*h-1))-1.0/16*(y(2*h-5)+y(2*h-1))+0.5);
        y(2*h) = f(h) + floor( 9.0/8*y(2*h-1)-1.0/8*y(2*h-3)+0.5);
        
        K(1:2*h,j) = y(1:2*h)';
    end
    
    for i = 1:2*h
        c = K(i,1:w);
        d = K(i,(w+1):2*w);
        x(1) = c(1) + floor(-1.0/2 * d(1) + 0.5);
        for j=2:w
            x(2*j-1)=c(j) + floor(-1.0/4 * (d(j-1) + d(j)) + 0.5);
        end

        x(2)=d(1) + floor(9.0/16 * (x(1)+x(3)) - 1.0/16*(x(3)+x(5)) + 0.5);
        for j=2:w-2 
            x(2*j) = d(j) + floor( 9.0/16 * (x(2*j-1) +x(2*j+1)) -1.0/16*(x(2*j-3)+x(2*j+3))+0.5);
        end
        x(2*w-2) = d(w-1) + floor( 9.0/16*(x(2*w-3)+x(2*w-1))-1.0/16*(x(2*w-5)+x(2*w-1))+0.5);
        x(2*w) = d(w) + floor( 9.0/8*x(2*w-1)-1.0/8*x(2*w-3)+0.5);
 
        K(i,1:2*w) = x(1:2*w);
    end


    w = w*2;
    h = h*2;
end
%imshow(uint8(K));
imrec=uint8(K);
%imwrite(uint8(K),'sensin_idwt.bmp');