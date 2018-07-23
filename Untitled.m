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
plot(ER_our,PSNR_crowd_our,'-p','LineWidth',0.8,'MarkerSize',10); hold on;

ER_proposed=[0.021881103515625, 0.248748779296875, 0.5057373046875, 0.75457763671875, 0.8765869140625, 1.00341796875, 1.123870849609375, 1.25018310546875, 1.493621826171875, 1.621978759765625, 1.74761962890625, 1.8712158203125, 1.993377685546875, 2.116363525390625, 2.23651123046875, 2.361785888671875, 2.479034423828125, 2.60491943359375, 2.7318115234375];

disp(ER_proposed)

PSNR_ER_proposed=[62.189517489232415, 51.20418278798848, 47.84681004853624, 45.82781348161199, 45.03887945729243, 44.35774315497656, 43.750974140608804, 43.220134462354416, 42.27105024785749, 41.85164530643908, 41.45821124980053, 41.08463088333742, 40.75837121912598, 40.44272468162763, 40.12734122692606, 39.8461507454834, 39.570237405625754, 39.30704956035771, 39.05184668530597]

plot(ER_proposed,PSNR_ER_proposed,'-s','LineWidth',0.8,'MarkerSize',10); hold on;



axis([0 2.8 30 80]);set(gca,'FontSize',14);
xlabel('ER (bpp)');
ylabel('PSNR (dB)');
hl=legend('Zhang [12]','Hong [13]','Zhang [14]','Zhang [15]','Yin [16]','Zhang [17]','Ma [18]','Cao [19]','Proposed');
set(hl,'Box','off')
box on;    grid on;