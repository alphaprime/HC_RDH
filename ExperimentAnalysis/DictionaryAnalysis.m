ER=[0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2];

K0032=[53.3855 49.7771 47.1163 44.1442 42.4289 40.2062 38.4357 36.5424 36.6344 33.0802 31.6297 29.7901];
K0064=[54.3078 50.0503 47.2856 44.8757 42.7730 40.9860 39.1439 37.2327 35.6807 33.9932 32.6237 30.7773];
K0128=[54.3327 49.9580 47.1970 45.3397 42.6216 41.1166 39.0663 37.5213 35.7751 33.9343 32.2439 30.8100];
K0256=[54.1600 49.9697 47.7083 44.5563 42.8171 40.8931 39.6592 37.5799 35.7046 33.7431 32.0774 30.5513];
K0512=[52.9348 48.9138 46.5170 44.3189 41.9805 40.1263 38.2689 36.1436 34.9064 32.9429 31.4331 29.5846];
K1024=[53.9777 49.7023 46.9587 43.8630 42.2374 40.4515 38.9192 36.8244 34.8290 33.2641 31.4890 29.7994];
K2048=[51.8360 48.1000 45.2169 42.5088 40.4200 38.5122 36.0677 34.0867 32.5086 30.8822 28.6069 26.6203];


 


figure(1)
 
 
plot(ER,K0032,'-rd','LineWidth',0.5,...
                'MarkerEdgeColor','r',...
                'MarkerFaceColor','w',...
                'MarkerSize',8);

 
hold on;

plot(ER,K0064,'-go','LineWidth',0.5,...
                'MarkerEdgeColor','g',...
                'MarkerFaceColor','w',...
                'MarkerSize',8);
            
hold on;

plot(ER,K0128,'-bs','LineWidth',0.5,...
                'MarkerEdgeColor','b',...
                'MarkerFaceColor','w',...
                'MarkerSize',8);
hold on;

plot(ER,K0256,'-mx','LineWidth',0.5,...
                'MarkerEdgeColor','m',...
                'MarkerFaceColor','w',...
                'MarkerSize',8);

            
hold on;

plot(ER,K0512,'-cx','LineWidth',0.5,...
                'MarkerEdgeColor','c',...
                'MarkerFaceColor','w',...
                'MarkerSize',8);
            
            
hold on;

plot(ER,K1024,'-kx','LineWidth',0.5,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','w',...
                'MarkerSize',8);
            
hold on;

plot(ER,K2048,'-yx','LineWidth',0.5,...
                'MarkerEdgeColor','y',...
                'MarkerFaceColor','w',...
                'MarkerSize',8);
            
            
axis([0 1.2 30 60] );
        
set(gca, 'XTick', [0 0.2 0.4 0.6 0.8 1.0 1.2]);
set(gca, 'YTick', [30  40  50  60 ]);
set(gca,'FontSize',20);
xlabel('Embedding Rate');
ylabel('PSNR');
hl=legend('K=32 ','K=64','K=128','K=256','K=512','K=1024','K=2048');
set(hl,'Box','off')
title('Lena');
