clc;
clear all;
load 'ExperimentAnalysis/databaseresult/ER_boss_kede.mat';
ER=ER(1:100);

figure;
plot(1:100,ER,'-bo','LineWidth',1,'MarkerSize',10);
% plot(1:100,ER,'-ko','LineWidth',0.6,'MarkerEdgeColor','b',...
%                 'MarkerFaceColor','w',...
%                 'MarkerSize',6)
axis([0 100 0 3]);
box on;    grid on;

hold on;
load 'ExperimentAnalysis/databaseresult/ER_boss_our_40db.mat';
ER=ER(1:100);
ER=(512*512.*ER-13424)/(512*512);
plot(1:100,ER,'-rd','LineWidth',1,'MarkerSize',10); 
% plot(1:100,ER,'-kd','LineWidth',0.6,'MarkerEdgeColor','r',...
%                 'MarkerFaceColor','w',...
%                 'MarkerSize',6)
axis([0 100 0 3]);
 


% set(gca, 'XTick', [0 0.2  0.4  0.6  0.8  1.0]);
% set(gca, 'YTick', [0  20 25 30 35 40 45 50 55 60 65 70]);
set(gca,'FontSize',18);
xlabel('Image index');
ylabel('ER (bpp)');
hl=legend('Ma [29]','Proposed');
set(hl,'Box','off')
title('BOSSBase');


%% gain

load 'ExperimentAnalysis/databaseresult/ER_boss_kede.mat';
ER_kede=ER(1:100);


load 'ExperimentAnalysis/databaseresult/ER_boss_our_40db.mat';
ER_our=ER(1:100);
ER_our=(512*512.*ER_our-13424)/(512*512);
plot(1:100,ER_our-ER_kede,'-rd','LineWidth',1,'MarkerSize',10); 
% plot(1:100,ER,'-kd','LineWidth',0.6,'MarkerEdgeColor','r',...
%                 'MarkerFaceColor','w',...
%                 'MarkerSize',6)
axis([0 100 -1 3]);
 


% set(gca, 'XTick', [0 0.2  0.4  0.6  0.8  1.0]);
% set(gca, 'YTick', [0  20 25 30 35 40 45 50 55 60 65 70]);
set(gca,'FontSize',18);
xlabel('Image index');
ylabel('ER (bpp)');
hl=legend('Ma [29]','Proposed');
set(hl,'Box','off')
title('BOSSBase');

























%%%%%%%%%%%%%%%%%%%%%

load 'ExperimentAnalysis/databaseresult/ER_holidy_kede.mat';
ER=ER(1:100);
figure;
plot(1:100,ER,'-bo','LineWidth',1,'MarkerSize',10);
axis([0 100 0 1]);
box on;    grid on;

hold on;
load 'ExperimentAnalysis/databaseresult/ER_holiday_our_40db.mat';
ER=ER(1:100);
ER=(512*512.*ER-13424)/(512*512);
figure(2)
plot(1:100,ER,'-rd','LineWidth',1,'MarkerSize',10);
axis([0 100 0 3]);
box on;    grid on;






% set(gca, 'XTick', [0 0.2  0.4  0.6  0.8  1.0]);
% set(gca, 'YTick', [0  20 25 30 35 40 45 50 55 60 65 70]);
set(gca,'FontSize',18);
xlabel('Image index');
ylabel('ER (bpp)');
hl=legend('Ma [29]','Proposed');
set(hl,'Box','off')
title('Holidays');


%%%%%%%%%%%%%%%%%%%%%5

load 'ExperimentAnalysis/databaseresult/ER_pascal_kede.mat';
ER=ER(1:100);
figure;
plot(1:100,ER,'-bo','LineWidth',1,'MarkerSize',10);

load 'ExperimentAnalysis/databaseresult/ER_PASSCAL_our_40db.mat';
ER=(512*512.*ER-13424)/(512*512);
hold on;
plot(1:100,ER,'-rd','LineWidth',1,'MarkerSize',10);


axis([0 100 0 3]);
box on;    grid on;
% set(gca, 'XTick', [0 0.2  0.4  0.6  0.8  1.0]);
% set(gca, 'YTick', [0  20 25 30 35 40 45 50 55 60 65 70]);
set(gca,'FontSize',18);
xlabel('Image index');
ylabel('ER (bpp)');
hl=legend('Ma [29]','Proposed');
set(hl,'Box','off')
title('PASSCAL');














load 'ExperimentAnalysis/databaseresult/PSNR_boss.mat';
 
figure;
plot(1:100,PSNR_total,'-bo','LineWidth',1,'MarkerSize',10);
% plot(1:100,ER,'-ko','LineWidth',0.6,'MarkerEdgeColor','b',...
%                 'MarkerFaceColor','w',...
%                 'MarkerSize',6)
axis([0 100 0 3]);
box on;    grid on;

hold on;
load 'ExperimentAnalysis/databaseresult/PSNR_boss_our_0.4.mat';
 
plot(1:100,PSNR,'-rd','LineWidth',1,'MarkerSize',10); 
% plot(1:100,ER,'-kd','LineWidth',0.6,'MarkerEdgeColor','r',...
%                 'MarkerFaceColor','w',...
%                 'MarkerSize',6)
axis([0 100 30 70]);
 


% set(gca, 'XTick', [0 0.2  0.4  0.6  0.8  1.0]);
% set(gca, 'YTick', [0  20 25 30 35 40 45 50 55 60 65 70]);
set(gca,'FontSize',18);
xlabel('Image index');
ylabel('PSNR (dB)');
hl=legend('Ma [29]','Proposed');
set(hl,'Box','off')
title('BOSSBase');




%%%%%%%%%%%%%%%%%%%%%

load 'ExperimentAnalysis/databaseresult/PSNR_holidy.mat';
 
figure;
plot(1:100,PSNR_total,'-bo','LineWidth',1,'MarkerSize',10);
axis([0 100 0 1]);
box on;    grid on;

hold on;
load 'ExperimentAnalysis/databaseresult/PSNR_holidy_our_0.4.mat';
 
 
plot(1:100,PSNR,'-rd','LineWidth',1,'MarkerSize',10);
axis([0 100 30 70]);
box on;    grid on;






% set(gca, 'XTick', [0 0.2  0.4  0.6  0.8  1.0]);
% set(gca, 'YTick', [0  20 25 30 35 40 45 50 55 60 65 70]);
set(gca,'FontSize',18);
xlabel('Image index');
ylabel('PSNR (dB)');
hl=legend('Ma [29]','Proposed');
set(hl,'Box','off')
title('Holidays');


%%%%%%%%%%%%%%%%%%%%%5

load 'ExperimentAnalysis/databaseresult/PSNR_pascal.mat';
 
figure;
plot(1:100,PSNR_total,'-bo','LineWidth',1,'MarkerSize',10);

load 'ExperimentAnalysis/databaseresult/PSNR_passcal_our_0.4.mat';
hold on;
plot(1:100,PSNR,'-rd','LineWidth',1,'MarkerSize',10);


axis([0 100 30 80]);
box on;    grid on;
% set(gca, 'XTick', [0 0.2  0.4  0.6  0.8  1.0]);
% set(gca, 'YTick', [0  20 25 30 35 40 45 50 55 60 65 70]);
set(gca,'FontSize',18);
xlabel('Image index');
ylabel('PSNR (dB)');
hl=legend('Ma [29]','Proposed');
set(hl,'Box','off')
title('PASSCAL');








C=[500 1000 2000 3000 4000 5000];

Datahiding=80-12434./C;
datahing_LSB=[ 48 48 48 48 48 48];
plot(C,datahing_LSB,'-d','LineWidth',0.6,'MarkerSize',8); hold on;
plot(C,Datahiding,'-rs','LineWidth',0.6,'MarkerSize',8); hold on;
axis([0 5000 40 100]); set(gca,'FontSize',14);
xlabel('Patch number');
ylabel('Hiding capacity per patch (bit)');
hl=legend('Ma [29]','Proposed');
box on;    grid on;
%title('Lena');

set(hl,'Box','off')







 