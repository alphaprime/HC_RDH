
Rlena = [0.101 0.083 0.048 0.045 0.025];
PSNRlena = [38.3 39.1 40.0 41.3 42.4];

R1  = [0.0020 0.0027 0.010 0.020 0.024 0.033];
PSNR1 = [52.2 51.4  45.2 39.0 38.5 38.0];
% R2  = [0.0010 0.0033 0.004 0.0063 0.013 0.017 0.020 0.025];
% PSNR2 = [54.1 51.2   47.1  45.2   44.2  39.0  38.2  37.9];
% R3  = [0.0005 0.001 0.0017 0.0029 0.0067 0.0125];
% PSNR3 = [54.4 51.7  47.1   45.2   38.9   38.0];
% R4  = [0.0003 0.0007 0.0018 0.002 0.004 0.0071];
% PSNR4 = [53.9 46.9   44.8   40.5   39.0 38.1];

figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]);
plot([1/256],[37.9],'^','LineWidth',0.8,'MarkerSize',10); hold on;

plot([1/144],[37.9],'v','LineWidth',0.8,'MarkerSize',10); hold on;
plot(R1,PSNR1,'-o','LineWidth',0.8,'MarkerSize',10); hold on;


hold on;
plot(Rlena,PSNRlena,'->','LineWidth',0.8,'MarkerSize',10); hold on;  % zhang 21

hold on;


ER_Yin=[0.01 0.05 0.08  0.1294];
PSNR_Yin=[61.5567 54.6817 52.7083 50.5077];
plot(ER_Yin,PSNR_Yin,'-<','LineWidth',0.8,'MarkerSize',10); hold on; % Yin 22
hold on;




% ER_zhangweimin=[0.01 0.02 0.03 0.04];
% PSNR_zhangweimin=[62.5 58.5 57.5 56];
% plot(ER_zhangweimin,PSNR_zhangweimin,'-*','LineWidth',0.8,'MarkerSize',10); hold on; % zhang 23
% hold on;



% 
% ER_kede=[0.01 0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8];% 0.9 0.95];
% PSNR_Lena_kede=[63.4530 55.4438 52.3246 48.9915 45.0777 42.5459 39.4796 36.6047 33.2729 29.9443];% 26.7176 24.6285];
% plot(ER_kede,PSNR_Lena_kede,'-d','LineWidth',0.8,'MarkerSize',10); hold on;
% hold on;
% 
% 
% 
ER_our=[0.01 0.02 0.04 0.06 0.08 0.1 0.12 .14 0.16 0.18 0.2];% 0.9 1];
% % load '/ExperimentAnalysis/PSNR_total_lena.mat';
% % PSNR_Lena_our=PSNR_Lena(1:20);
PSNR_Lena_our=[61.6507 51.1046  47.9320  42.3942 41.3837 39.3733 38.5522 36.6323 35.7932 34.5891 33.4263 ];
plot(ER_our,PSNR_Lena_our,'-s','LineWidth',0.8,'MarkerSize',10); hold on;





axis([0 0.2 30 65]); set(gca,'FontSize',14);
xlabel('ER (bpp)');
ylabel('PSNR (dB)');
hl=legend('Zhang [18]','Hong [19]','Zhang [20]','Zhang [21]','Yin [22]','Proposed');
box on;    grid on;
%title('Lena');

set(hl,'Box','off')
