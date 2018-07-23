
clc
clear all;



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




ER_zhangweimin=[0.01 0.02 0.03 0.04];
PSNR_zhangweimin=[62.5 58.5 57.5 56];
plot(ER_zhangweimin,PSNR_zhangweimin,'-*','LineWidth',0.8,'MarkerSize',10); hold on; % zhang 23
hold on;




ER_kede=[0.01 0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 ];% 0.9 0.95];
PSNR_Lena_kede=[63.4530 55.4438 52.3246 48.9915 45.0777 42.5459 39.4796 36.6047 33.2729];% 26.7176 24.6285];
plot(ER_kede,PSNR_Lena_kede,'-d','LineWidth',0.8,'MarkerSize',10); hold on;
hold on;



ER_our=[ 0.06 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8];% 0.9 1];
ER_our=(512*512.*ER_our-13424)/(512*512);
% load '/ExperimentAnalysis/PSNR_total_lena.mat';
% PSNR_Lena_our=PSNR_Lena(1:20);
PSNR_Lena_our=[ 58.3824 54.3289 49.8000 47.9150 45.2296 42.7565 41.0009 39.3728 37.3755];% 35.6938 34.0330];
plot(ER_our,PSNR_Lena_our,'-s','LineWidth',0.8,'MarkerSize',10); hold on;





axis([0 0.8 28 65]); set(gca,'FontSize',14);
xlabel('ER (bpp)');
ylabel('PSNR (dB)');
hl=legend('Zhang [23]','Hong [24]','Zhang [25]','Zhang [26]','Yin [27]','Zhang [28]','Ma [29]','Proposed');
box on;    grid on;
%title('Lena');

set(hl,'Box','off')


%%



RPlane = [0.176 0.143 0.113 0.080 0.050];
PSNRPlane = [38.3 39.1 40.0 41.3 42.4];


R2  = [0.0227 0.0333 0.040 0.0417];
PSNR2 = [44.2  38.5  38.1  38.0];


figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]);


plot([1/144],[37.9],'^','LineWidth',0.8,'MarkerSize',10); hold on;
plot([1/100],[37.9],'v','LineWidth',0.8,'MarkerSize',10); hold on;
plot(R2,PSNR2,'-o','LineWidth',0.8,'MarkerSize',10); hold on;
plot(RPlane,PSNRPlane,'->','LineWidth',0.8,'MarkerSize',10); hold on;


ER_Yin=[0.01 0.05 0.08  0.1450 0.2002];
PSNR_Yin=[64.0893 56.9174 54.8782 52.4082 50.55718 ];
plot(ER_Yin,PSNR_Yin,'-<','LineWidth',0.8,'MarkerSize',10); hold on; % Yin 22
hold on;



ER_zhangweimin=[0.01 0.02 0.03 0.04  0.06];
PSNR_zhangweimin=[66 62 60 58  56];
plot(ER_zhangweimin,PSNR_zhangweimin,'-*','LineWidth',0.8,'MarkerSize',10); % zhang 23
hold on;




ER_kede=[0.01 0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
PSNR_plane_kede=[63.1522 57.0169 54.1991 50.9747 48.1028 45.0546 42.4760 40.5158 37.7601 34.9005 31.1642 27.2632 ];
plot(ER_kede,PSNR_plane_kede,'-d','LineWidth',0.8,'MarkerSize',10);
ER_our=[0.06 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4];
PSNR_plane_our=[62.7670 59.5198 56.1535 53.4706 51.1102 49.8615 48.3012 45.5874 44.2486 42.1290 40.8731 38.9957 37.1505 35.1432 33.7511];
ER_our=(512*512.*ER_our-13424)/(512*512); 
plot(ER_our,PSNR_plane_our,'-s','LineWidth',0.8,'MarkerSize',10);

axis([0 1.4 25 70]);set(gca,'FontSize',14); set(gca, 'XTick', [0 0.2 0.4 0.6 0.8 1.0 1.2 1.4]);
xlabel('ER (bpp)');
ylabel('PSNR (dB)');
hl=legend('Zhang [23]','Hong [24]','Zhang [25]','Zhang [26]','Yin [27]','Zhang [28]','Ma [29]','Proposed');
box on;    grid on;
set(hl,'Box','off')

 


% 
% ER_zhang=[0.01];
% PSNR_Lena_zhang=[37.9241];
% plot(ER_zhang,PSNR_Lena_zhang,'b*','LineWidth',0.8,'MarkerSize',10);
% 
% 
% hold on;
% ER_hong=[0.02];
% 
% PSNR_Lena_hong=[37.9296];
% plot(ER_hong,PSNR_Lena_hong,'bv','LineWidth',0.8,'MarkerSize',10);
% hold on;
% 
% 
% ER_zhangtifs=[0.01 0.02 0.03 0.05];
% 
% PSNR_Lena_zhangtifs=[41.0108 39.0039 38.4989 37.9715];
% plot(ER_zhangtifs,PSNR_Lena_zhangtifs,'-bo','LineWidth',0.4,'MarkerSize',8);
% hold on;
% 
% 
% 
% 
% 
% 
% 
% % load '/ExperimentAnalysis/PSNR_total_lena_kede.mat';
% % ER_kede=0.05:0.05:0.95;
% % PSNR_Lena_kede=PSNR_total(1:19);
% ER_kede=[0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 0.95];
% PSNR_Lena_kede=[55.4438 52.3246 48.9915 45.0777 42.5459 39.4796 36.6047 33.2729 29.9443 26.7176 24.6285];
% plot(ER_kede,PSNR_Lena_kede,'-bs','LineWidth',0.4,'MarkerSize',10);
% hold on;
% 
% ER_our=[0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
% % load '/ExperimentAnalysis/PSNR_total_lena.mat';
% % PSNR_Lena_our=PSNR_Lena(1:20);
% PSNR_Lena_our=[58.3824 54.3289 49.8000 47.9150 45.2296 42.7565 41.0009 39.3728 37.3755 35.6938 34.0330];
% plot(ER_our,PSNR_Lena_our,'-bd','LineWidth',0.4,'MarkerSize',10);
% 
% 
% 
% 
% 
% axis([0 1 20 70]);
% box on;    grid on;
% set(gca, 'XTick', [0 0.2  0.4  0.6  0.8  1.0]);
% set(gca, 'YTick', [0  20 25 30 35 40 45 50 55 60 65 70]);
% set(gca,'FontSize',16);
% xlabel('Embedding Rate (bpp)');
% ylabel('PSNR (dB)');
% hl=legend('Zhang []','Hong []','Zhangtifs []','Ma []','Ours ');
% set(hl,'Box','off')
% title('Lena');















%***********************************************************************************************************************
figure(2);
ER_zhang=[0.01];
PSNR_plane_zhang=[37.9853];
plot(ER_zhang,PSNR_plane_zhang,'b*','LineWidth',0.8,'MarkerSize',10);






hold on;
ER_hong=[0.02];

PSNR_plane_hong=[37.9692];
plot(ER_hong,PSNR_plane_hong,'bv','LineWidth',0.8,'MarkerSize',10);
hold on;


ER_zhangtifs=[0.01 0.02 0.03 0.05];

PSNR_plane_zhangtifs=[41.0121 39.0502 38.5484 37.9887];
plot(ER_zhangtifs,PSNR_plane_zhangtifs,'-bo','LineWidth',0.4,'MarkerSize',8);
hold on;







% load '/ExperimentAnalysis/PSNR_total_lena_kede.mat';
% ER_kede=0.05:0.05:0.95;
% PSNR_Lena_kede=PSNR_total(1:19);
ER_kede=[0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
PSNR_plane_kede=[57.0169 54.1991 50.9747 48.1028 45.0546 42.4760 40.5158 37.7601 34.9005 31.1642 27.2632 ];
plot(ER_kede,PSNR_plane_kede,'-bs','LineWidth',0.4,'MarkerSize',10);
hold on;

ER_our=[0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4];
% load '/ExperimentAnalysis/PSNR_total_lena.mat';
% PSNR_Lena_our=PSNR_Lena(1:20);
PSNR_plane_our=[62.7670 59.5198 56.1535 53.4706 51.1102 49.8615 48.3012 45.5874 44.2486 42.1290 40.8731 38.9957 37.1505 35.1432 33.7511];
plot(ER_our,PSNR_plane_our,'-bd','LineWidth',0.4,'MarkerSize',10);



axis([0 1.4 20 70]);
box on;    grid on;
set(gca, 'XTick', [0 0.2  0.4  0.6  0.8  1.0 1.2 1.4]);
set(gca, 'YTick', [0  20 25 30 35 40 45 50 55 60 65 70]);
set(gca,'FontSize',16);
xlabel('Embedding Rate (bpp)');
ylabel('PSNR (dB)');
hl=legend('Zhang []','Hong []','Zhangtifs []','Ma []','Ours ');
set(hl,'Box','off')
title('Airplane');





%***********************************************************************************************************************
figure(3);
ER_zhang=[0.01];
PSNR_peppers_zhang=[37.9452];
plot(ER_zhang,PSNR_peppers_zhang,'b*','LineWidth',0.8,'MarkerSize',10);






hold on;
ER_hong=[0.02];

PSNR_peppers_hong=[37.9419];
plot(ER_hong,PSNR_peppers_hong,'bv','LineWidth',0.8,'MarkerSize',10);
hold on;


ER_zhangtifs=[0.01 0.02 0.03 0.05];

PSNR_peppers_zhangtifs=[41.0139 38.9156 38.5205 37.9630 ];
plot(ER_zhangtifs,PSNR_peppers_zhangtifs,'-bo','LineWidth',0.4,'MarkerSize',8);
hold on;







% load '/ExperimentAnalysis/PSNR_total_lena_kede.mat';
% ER_kede=0.05:0.05:0.95;
% PSNR_Lena_kede=PSNR_total(1:19);
ER_kede=[0.05 0.1 0.2 0.3 0.4 0.5 0.6];
PSNR_peppers_kede=[51.1982 51.2359 46.1185 42.7629 39.5914 35.8437 31.6648];
plot(ER_kede,PSNR_peppers_kede,'-bs','LineWidth',0.4,'MarkerSize',10);
hold on;







ER_our=[0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];
% load '/ExperimentAnalysis/PSNR_total_lena.mat';
% PSNR_Lena_our=PSNR_Lena(1:20);
PSNR_peppers_our=[58.3162 53.2562 49.5718 46.2461 42.8294 40.5488 38.2117 35.5177 32.9421 30.3278];
plot(ER_our,PSNR_peppers_our,'-bd','LineWidth',0.4,'MarkerSize',10);



axis([0 1.0 20 70]);
box on;    grid on;
set(gca, 'XTick', [0 0.2  0.4  0.6  0.8  1.0]);
set(gca, 'YTick', [0  20 25 30 35 40 45 50 55 60 65 70]);
set(gca,'FontSize',16);
xlabel('Embedding Rate (bpp)');
ylabel('PSNR (dB)');
hl=legend('Zhang []','Hong []','Zhangtifs []','Ma []','Ours ');
set(hl,'Box','off')
title('Peppers')





%***********************************************************************************************************************
figure(4);
ER_zhang=[0.01];
PSNR_baboon_zhang=[37.9088];
plot(ER_zhang,PSNR_baboon_zhang,'b*','LineWidth',0.8,'MarkerSize',10);






hold on;
ER_hong=[0.01];

PSNR_baboon_hong=[37.9200];
plot(ER_hong,PSNR_baboon_hong,'bv','LineWidth',0.8,'MarkerSize',10);
hold on;


ER_zhangtifs=[0.01 0.02 0.03 0.05];

PSNR_baboon_zhangtifs=[ 41.0251 38.9604 38.5376 37.9678 ];
plot(ER_zhangtifs,PSNR_baboon_zhangtifs,'-bo','LineWidth',0.4,'MarkerSize',8);
hold on;







% load '/ExperimentAnalysis/PSNR_total_lena_kede.mat';
% ER_kede=0.05:0.05:0.95;
% PSNR_Lena_kede=PSNR_total(1:19);
ER_kede=[0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7];
PSNR_baboon_kede=[50.4947 46.2637 40.5098 36.3391 33.1597 29.8913 27.2354 23.4196];
plot(ER_kede,PSNR_baboon_kede,'-bs','LineWidth',0.4,'MarkerSize',10);
hold on; 







ER_our=[0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7];
% load '/ExperimentAnalysis/PSNR_total_lena.mat';
% PSNR_Lena_our=PSNR_Lena(1:20);
PSNR_baboon_our=[50.9074 47.2782 41.0740 36.9002 34.0231 30.5356 28.0895 25.6236];
plot(ER_our,PSNR_baboon_our,'-bd','LineWidth',0.4,'MarkerSize',10);



axis([0 0.8 20 60]);
box on;    grid on;
set(gca, 'XTick', [0 0.2  0.4  0.6  0.8]);
set(gca, 'YTick', [0  20 25 30 35 40 45 50 55 60]);
set(gca,'FontSize',16);
xlabel('Embedding Rate (bpp)');
ylabel('PSNR (dB)');
hl=legend('Zhang []','Hong []','Zhangtifs []','Ma []','Ours ');
set(hl,'Box','off')
title('Baboon')




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(5);
ER_zhang=[0.01];
PSNR_barbara_zhang=[37.9440];
plot(ER_zhang,PSNR_barbara_zhang,'b*','LineWidth',0.8,'MarkerSize',10);






hold on;
ER_hong=[0.01];

PSNR_baboon_hong=[37.9187];
plot(ER_hong,PSNR_baboon_hong,'bv','LineWidth',0.8,'MarkerSize',10);
hold on;


ER_zhangtifs=[0.01 0.02 0.03 0.05];

PSNR_barbara_zhangtifs=[ 41.1743 39.0553 38.5158 37.9904 ];
plot(ER_zhangtifs,PSNR_barbara_zhangtifs,'-bo','LineWidth',0.4,'MarkerSize',8);
hold on;







% load '/ExperimentAnalysis/PSNR_total_lena_kede.mat';
% ER_kede=0.05:0.05:0.95;
% PSNR_Lena_kede=PSNR_total(1:19);
ER_kede=[0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];
PSNR_barbara_kede=[55.5651 51.0390 47.1004 43.7238 40.7560 37.5177 34.4987 31.6724 28.6534 24.5917 ];
plot(ER_kede,PSNR_barbara_kede,'-bs','LineWidth',0.4,'MarkerSize',10);
hold on;







ER_our=[0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0];
% load '/ExperimentAnalysis/PSNR_total_lena.mat';
% PSNR_Lena_our=PSNR_Lena(1:20);
PSNR_barbara_our=[54.8666 52.4035 48.8829 45.8414 42.7447 40.3230 37.7348 35.8726 33.6679 31.1041 29.2779];
plot(ER_our,PSNR_barbara_our,'-bd','LineWidth',0.4,'MarkerSize',10);



axis([0 1 20 60]);
box on;    grid on;
set(gca, 'XTick', [0 0.2  0.4  0.6  0.8 1.0]);
set(gca, 'YTick', [0  20 25 30 35 40 45 50 55 60]);
set(gca,'FontSize',16);
xlabel('Embedding Rate (bpp)');
ylabel('PSNR (dB)');
hl=legend('Zhang []','Hong []','Zhangtifs []','Ma []','Ours ');
set(hl,'Box','off')
title('Barbara')




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(6);
ER_zhang=[0.01];
PSNR_man_zhang=[37.7529];
plot(ER_zhang,PSNR_man_zhang,'b*','LineWidth',0.8,'MarkerSize',10);






hold on;
ER_hong=[0.01];

PSNR_man_hong=[37.7491];
plot(ER_hong,PSNR_man_hong,'bv','LineWidth',0.8,'MarkerSize',10);
hold on;


ER_zhangtifs=[0.01 0.02 0.03 0.05];

PSNR_man_zhangtifs=[  41.0977 38.9278 38.4690 37.9269];
plot(ER_zhangtifs,PSNR_man_zhangtifs,'-bo','LineWidth',0.4,'MarkerSize',8);
hold on;







% load '/ExperimentAnalysis/PSNR_total_lena_kede.mat';
% ER_kede=0.05:0.05:0.95;
% PSNR_Lena_kede=PSNR_total(1:19);
ER_kede=[0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];
PSNR_man_kede=[ 55.3208 52.3454 49.2448 45.0726 42.1116 38.7299 36.0430 32.8199 29.2712 26.1879 ];
plot(ER_kede,PSNR_man_kede,'-bs','LineWidth',0.4,'MarkerSize',10);
hold on;







ER_our=[0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0];
% load '/ExperimentAnalysis/PSNR_total_lena.mat';
% PSNR_Lena_our=PSNR_Lena(1:20);
PSNR_man_our=[ 62.4867 57.6506 50.9632 49.3500 46.8540 44.1122 41.9824 39.9072 37.7479 35.4134 33.3929];
plot(ER_our,PSNR_man_our,'-bd','LineWidth',0.4,'MarkerSize',10);



axis([0 1 20 70]);
box on;    grid on;
set(gca, 'XTick', [0 0.2  0.4  0.6  0.8 1.0]);
set(gca, 'YTick', [0  20 25 30 35 40 45 50 55 60 65 70]);
set(gca,'FontSize',16);
xlabel('Embedding Rate (bpp)');
ylabel('PSNR (dB)');
hl=legend('Zhang []','Hong []','Zhangtifs []','Ma []','Ours ');
set(hl,'Box','off')
title('Man')



%% man_new

RMan = [0.076 0.048 0.028 0.020];
PSNRMan = [38.3 39.1 40.0 41.3];
R2  = [0.0010 0.0033 0.004 0.0063 0.013 0.017 0.020 0.025];
PSNR2 = [54.1 51.2   47.1  45.2   44.2  39.0  38.2  37.9];
figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]);
hold on;
plot([1/256],[37.9],'^','LineWidth',0.8,'MarkerSize',10); hold on;
plot([1/144],[37.9],'v','LineWidth',0.8,'MarkerSize',10); hold on;
plot(R2,PSNR2,'-o','LineWidth',0.8,'MarkerSize',10); hold on;
plot(RMan,PSNRMan,'->','LineWidth',0.8,'MarkerSize',10); hold on;


ER_Yin=[0.01 0.05 0.08  0.1365];
PSNR_Yin=[62.2162 55.1939 53.1746 50.5326  ];
plot(ER_Yin,PSNR_Yin,'-<','LineWidth',0.8,'MarkerSize',10); hold on; % Yin 22
hold on;



ER_zhangweimin=[0.01 0.02 0.03 ];
PSNR_zhangweimin=[62 58 56 ];
plot(ER_zhangweimin,PSNR_zhangweimin,'-*','LineWidth',0.8,'MarkerSize',10); hold on;
hold on;


ER_kede=[0.01 0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];
PSNR_man_kede=[62.6684  55.3208 52.3454 49.2448 45.0726 42.1116 38.7299 36.0430 32.8199 29.2712 26.1879 ];
plot(ER_kede,PSNR_man_kede,'-d','LineWidth',0.8,'MarkerSize',10); hold on;
hold on;

ER_our=[ 0.06 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0];
ER_our=(512*512.*ER_our-13424)/(512*512);
PSNR_man_our=[  62.4867 57.6506 50.9632 49.3500 46.8540 44.1122 41.9824 39.9072 37.7479 35.4134 33.3929];
plot(ER_our,PSNR_man_our,'-s','LineWidth',0.8,'MarkerSize',10); hold on;

 

axis([0 1 25 65]);set(gca,'FontSize',14);
xlabel('ER (bpp)');
ylabel('PSNR (dB)');
hl=legend('Zhang [23]','Hong [24]','Zhang [25]','Zhang [26]','Yin [27]','Zhang [28]','Ma [29]','Proposed');
set(hl,'Box','off')
box on;    grid on;

%%


RCrowd = [0.126 0.108 0.073 0.055 0.035];
PSNRCrowd = [38.3 39.1 40.0 41.3 42.4];
R2  = [0.0143 0.0167 0.0267 0.0313];
PSNR2 = [44.2  39.0  38.1  37.9];
figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]);

plot([1/196],[37.9],'^','LineWidth',0.8,'MarkerSize',10); hold on;
plot([1/144],[37.9],'v','LineWidth',0.8,'MarkerSize',10); hold on;
plot(R2,PSNR2,'-d','LineWidth',0.8,'MarkerSize',10); hold on;
plot(RCrowd,PSNRCrowd,'-o','LineWidth',0.8,'MarkerSize',10); hold on;

ER_Yin=[0.01 0.05 0.08  0.1450 0.1949];
PSNR_Yin=[63.6925 57.0074 54.9219 52.5469 50.6354 ];
plot(ER_Yin,PSNR_Yin,'-<','LineWidth',0.8,'MarkerSize',10); hold on; % Yin 22
hold on;


ER_zhangweimin=[0.01 0.02 0.03 ];
PSNR_zhangweimin=[63 59 57  ];
plot(ER_zhangweimin,PSNR_zhangweimin,'-*','LineWidth',0.8,'MarkerSize',10); hold on;
hold on;


ER_kede=[0.01 0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 ];
PSNR_crowd_kede=[64.64 56.72 53.49 50.88 48.06 45.46 43.02 39.59 37.81 34.13 31.30  ];
plot(ER_kede,PSNR_crowd_kede,'-d','LineWidth',0.8,'MarkerSize',10); hold on;
hold on;

ER_our=[ 0.06 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0];
ER_our=(512*512.*ER_our-13424)/(512*512);
PSNR_crowd_our=[ 76.26 65.81 58.83 55.19 53.17 51.56 49.96 48.50 46.18 43.97 42.47];
plot(ER_our,PSNR_crowd_our,'-s','LineWidth',0.8,'MarkerSize',10); hold on;



axis([0 1 30 80]);set(gca,'FontSize',14);
xlabel('ER (bpp)');
ylabel('PSNR (dB)');
hl=legend('Zhang [23]','Hong [24]','Zhang [25]','Zhang [26]','Yin [27]','Zhang [28]','Ma [29]','Proposed');
set(hl,'Box','off')
box on;    grid on;







%% 4张图像放在一起的结果展示







 

ER_our=[0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7];
PSNR_baboon_our=[50.9074 47.2782 41.0740 36.9002 34.0231 30.5356 28.0895 25.6236];
plot(ER_our,PSNR_baboon_our,'-bd','LineWidth',0.4,'MarkerSize',8);




hold on;

ER_our=[0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0];
 
PSNR_barbara_our=[54.8666 52.4035 48.8829 45.8414 42.7447 40.3230 37.7348 35.8726 33.6679 31.1041 29.2779];
plot(ER_our,PSNR_barbara_our,'-bs','LineWidth',0.4,'MarkerSize',8);

hold on;
ER_our=[0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]; 
PSNR_Lena_our=[58.3824 54.3289 49.8000 47.9150 45.2296 42.7565 41.0009 39.3728 37.3755 35.6938 34.0330];
plot(ER_our,PSNR_Lena_our,'-bo','LineWidth',0.4,'MarkerSize',8);

hold on;
ER_our=[0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4];
PSNR_plane_our=[62.7670 59.5198 56.1535 53.4706 51.1102 49.8615 48.3012 45.5874 44.2486 42.1290 40.8731 38.9957 37.1505 35.1432 33.7511];
plot(ER_our,PSNR_plane_our,'-b^','LineWidth',0.4,'MarkerSize',8);

axis([0 1.4 25 70]);
box on;    grid on;
set(gca, 'XTick', [0 0.2  0.4  0.6  0.8 1.0 1.2 1.4]);
set(gca, 'YTick', [0  20 25 30 35 40 45 50 55 60 65 70]);
set(gca,'FontSize',16);
xlabel('Embedding rate (bpp)');
ylabel('PSNR in directly decrypted image (dB)');
hl=legend('Baboon','Barbara','Lena','Airplane');
set(hl,'Box','off')
 