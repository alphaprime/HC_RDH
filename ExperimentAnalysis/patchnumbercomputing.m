M=10000;
N=4;
K=zeros(1,7);
K(1)=32;
for i=2:7
    K(i)=2*K(i-1);
end





%K=32:32:3200;

L=zeros(1,7);
C=zeros(1,7);


 
for j=1:7
   L(j)=1;
   C(j)=floor(M/(8*N^2-14-L(j)*(11+floor(log2(K(j)))+1)))+1;
       
end
 
plot(K,C,'-b*','LineWidth',0.8);
hold on;
    for j=1:7
       L(j)=2;
       C(j)=floor(M/(8*N^2-14-L(j)*(11+floor(log2(K(j)))+1)))+1;
       
    end

       
plot(K,C,'-bd','LineWidth',0.8);

hold on;
for j=1:7
   L(j)=3;
   C(j)=floor(M/(8*N^2-14-L(j)*(11+floor(log2(K(j)))+1)))+1;
       
end
 
plot(K,C,'-bo','LineWidth',0.8);

hold on;
for j=1:7
   L(j)=4;
   C(j)=floor(M/(8*N^2-14-L(j)*(11+floor(log2(K(j)))+1)))+1;
       
end
 
plot(K,C,'-bs','LineWidth',0.8);

 
  
axis([0 2048 100 600] ); 
set(gca,'FontSize',14);
xlabel('Dictionary parameter K');
ylabel('Selected patch number C');
box on;    grid on; 
set(gca, 'XTick', [0 256 512 1024 2048]);
%set(gca, 'YTick', [1 2 3 4 5 6 7 8]);
hl=legend('L=1','L=2','L=3','L=4','Location','NorthEast');
set(hl,'Box','off')
%title('BOSSBase');