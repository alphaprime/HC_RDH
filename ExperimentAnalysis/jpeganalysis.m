%% plane



% % p=64;
% % bpp=[0.661 0.357 0.242 0.205 0.186];
% 
% p=128;
% bpp=[0.653 0.393 0.270 0.2 0.175];
% 
% p=256;
% bpp=[0.754 0.441 0.319 0.250 0.219];
% 
% p=512;
% bpp=[0.772 0.469 0.349 0.266 0.229];

% p=768;
% bpp=[0.82658 0.51563 0.37679 0.2876 0.2452];
% 
% % p=1024;
% % bpp=[0.858 0.525 0.393 0.317 0.266];
% % 
% 
% p=1280;
% bpp=[0.91436 0.57329 0.43335 0.3436 0.29634 ];
% 
% p=1536;
% bpp=[0.95288 0.611 0.45443 0.36487 0.31909];
% % 
% % p=1792;
% % bpp=[ 0.96711 0.61283 0.4661 0.37406 0.32296];
% % 
% % % p=2048;
% % % bpp=[0.99 0.634 0.471 0.38 0.325];
% ER=(p*16*(8.-bpp)-p*(14+7))/512^2;







figure('Pos',[20 200 400 300]);
AX2=axes('Pos',[.12 .13 .83 .82]);

% patchnumber=[64 128 256 512 1024 2048];
% bpp_plane_90=[0.661 0.653 0.754 0.772 0.858 0.99];
% bpp_plane_80=[0.357 0.393 0.441 0.469 0.525 0.634];
% bpp_plane_70=[0.242 0.270 0.319 0.349 0.393 0.471];
% bpp_plane_60=[0.205 0.2 0.25 0.266 0.317 0.38];
% bpp_plane_50=[0.186 0.175 0.219 0.229 0.266 0.325];


plot(patchnumber,bpp_plane_90,'-r^'); hold on;
plot(patchnumber,bpp_plane_80,'-gv'); hold on;
plot(patchnumber,bpp_plane_70,'-ko'); hold on;
plot(patchnumber,bpp_plane_60,'-m*'); hold on;
plot(patchnumber,bpp_plane_50,'-cd'); hold on;


patchnumber_our=[512 1024 2048];
bpp_plane_our=(2.1250*16.*patchnumber_our-13424)./(patchnumber_our*16);
plot(patchnumber_our,bpp_plane_our,'-bs'); hold on;
 


axis([0 2100 0 2.2]);
set(gca, 'XTick', [0 256 512 1024 2048]);
set(gca,'FontSize',12);
xlabel('Selected patch number');
ylabel('Encoding length (bpp)');
hl=legend('JPEG\_90','JPEG\_80','JPEG\_70','JPEG\_60','JPEG\_50','Proposed');
box on;    grid on;
set(hl,'Box','off')





figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]);

patchnumber=[64 128 256 512  1024 2048];


% ER_plane_90=[0.0253 0.0506 0.0995 0.1985 0.3917 0.7669 ];
% ER_plane_80=[0.0264 0.0526 0.1044 0.2080 0.4125 0.8114 ];
% ER_plane_70=[0.0269 0.0536 0.1063 0.2118 0.4208 0.8318];
% ER_plane_60=[0.0270 0.0541 0.1074 0.2143 0.4255 0.8431 ];
% ER_plane_50=[0.0271 0.0543 0.1079 0.2155 0.4287 0.85 ];


% ER_plane_90=[0.0235 0.0471 0.0927 0.1849 0.2747 0.3643 0.4510 0.5376 0.6257 0.7122 ];
% ER_plane_80=[0.0247 0.0492 0.0976 0.1943 0.2893 0.3852 0.4777 0.5697 0.6644 0.7567 ];
% ER_plane_70=[0.0252 0.0501 0.0995 0.1981 0.2958 0.3934 0.4886 0.5844 0.6805 0.7771 ];
% ER_plane_60=[ 0.0253 0.0507 0.1006 0.2007 0.3 0.3982 0.4956 0.5927 0.6905 0.7884 ];
% ER_plane_50=[ 0.0254 0.0509 0.1011 0.2018 0.3020 0.4013 0.4993 0.5970 0.6961 0.7953];

ER_plane_90=[0.0235 0.0471 0.0927 0.1849 0.3643 0.7122 ];
ER_plane_80=[0.0247 0.0492 0.0976 0.1943 0.3852  0.7567 ];
ER_plane_70=[0.0252 0.0501 0.0995 0.1981  0.3934 0.7771 ];
ER_plane_60=[ 0.0253 0.0507 0.1006 0.2007  0.3982  0.7884 ];
ER_plane_50=[ 0.0254 0.0509 0.1011 0.2018 0.4013  0.7953];


ER_our_plane=[0.0195 0.0391 0.0781 0.1563  0.3125 0.6250];


plot(patchnumber,ER_plane_90,'-r^','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,ER_plane_80,'-gv','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,ER_plane_70,'-ko','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,ER_plane_60,'-m*','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,ER_plane_50,'-cd','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,ER_our_plane,'-bs','LineWidth',1,'MarkerSize',10); hold on;
 


axis([0 2100 0 0.8]);
set(gca, 'XTick', [0 256 512  1024 2048]);set(gca,'FontSize',18);
xlabel('Embedded patch number');
ylabel('ER (bpp)');
hl=legend('JPEG\_90','JPEG\_80','JPEG\_70','JPEG\_60','JPEG\_50','Proposed','Location','NorthWest');
box on;    grid on;
set(hl,'Box','off')







figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]);

 patchnumber=[64 128 256 512 1024 2048];
% ER_plane_90=[0.0253 0.0506 0.0995 0.1985 0.3917 0.7669 ];
% ER_plane_80=[0.0264 0.0526 0.1044 0.2080 0.4125 0.8114 ];
% ER_plane_70=[0.0269 0.0536 0.1063 0.2118 0.4208 0.8318];
% ER_plane_60=[0.0270 0.0541 0.1074 0.2143 0.4255 0.8431 ];
% ER_plane_50=[0.0271 0.0543 0.1079 0.2155 0.4287 0.85 ];
% ER_our_plane=[0.0195 0.0391 0.0781 0.1563 0.3125 0.6250 0.85];

% PSNR_plane_90=[64.4148 62.0070 59.2044 56.1554 53.5614 51.5840 50.35 48.9942 47.3809 45.6280  ];
% PSNR_plane_80=[64.1392 61.6125 58.5665 55.7678 52.6136 51.2335 49.9539 48.4949 45.9983 44.5230  ];
% PSNR_plane_70=[64.0341 61.2970 58.2740 55.4784 52.2647 50.9118 49.5232 47.6705 45.9989 43.7159 ];
% PSNR_plane_60=[63.7719 61.2133 58.0901 55.2506 52.0836 50.7349 49.2125 47.2553 45.0992 43.4297  ];
% PSNR_plane_50=[63.6227 61.1768 57.9904 55.0560 51.9248 50.5950 49.0231 46.8001 44.9118 43.0783];
% PSNR_our_plane=[66.7387 63.8671 60.8469 57.3806 55.3151 53.1396 51.3036 50.1889 49.2406 48.0668];

PSNR_plane_90=[64.4148 62.0070 59.2044 56.1554 51.5840  45.6280  ];
PSNR_plane_80=[64.1392 61.6125 58.5665 55.7678  51.2335 44.5230  ];
PSNR_plane_70=[64.0341 61.2970 58.2740 55.4784  50.9118  43.7159 ];
PSNR_plane_60=[63.7719 61.2133 58.0901 55.2506  50.7349  43.4297  ];
PSNR_plane_50=[63.6227 61.1768 57.9904 55.0560  50.5950 43.0783];
PSNR_our_plane=[66.7387 63.8671 60.8469 57.3806  53.1396  48.0668];


plot(patchnumber,PSNR_plane_90,'-r^','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,PSNR_plane_80,'-gv','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,PSNR_plane_70,'-ko','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,PSNR_plane_60,'-m*','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,PSNR_plane_50,'-cd','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,PSNR_our_plane,'-bs','LineWidth',1,'MarkerSize',10); hold on;
 


axis([0 2100 43 68]);
set(gca, 'XTick', [0 256 512  1024  2048]);set(gca,'FontSize',18);
xlabel('Embedded patch number');
ylabel('PSNR (dB)');
hl=legend('JPEG\_90','JPEG\_80','JPEG\_70','JPEG\_60','JPEG\_50','Proposed');
box on;    grid on;
set(hl,'Box','off')







 

%%



% 
% 
figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]);
% 
%  
% % ER_plane_90=[0.0253 0.0506 0.0995 0.1985 0.3917 0.7669 ];
% % ER_plane_80=[0.0264 0.0526 0.1044 0.2080 0.4125 0.8114 ];
% % ER_plane_70=[0.0269 0.0536 0.1063 0.2118 0.4208 0.8318];
% % ER_plane_60=[0.0270 0.0541 0.1074 0.2143 0.4255 0.8431 ];
% % ER_plane_50=[0.0271 0.0543 0.1079 0.2155 0.4287 0.85 ];
% % ER_our_plane=[0.0195 0.0391 0.0781 0.1563 0.3125 0.6250];
% 
% % 
 
ER_plane_90=[0.0235 0.0471 0.0927 0.1849 0.3643 0.7122 ];
ER_plane_80=[0.0247 0.0492 0.0976 0.1943 0.3852  0.7567 ];
ER_plane_70=[0.0252 0.0501 0.0995 0.1981  0.3934 0.7771 ];
ER_plane_60=[ 0.0253 0.0507 0.1006 0.2007  0.3982  0.7884 ];
ER_plane_50=[ 0.0254 0.0509 0.1011 0.2018 0.4013  0.7953];


ER_our_plane=[0.0195 0.0391 0.0781 0.1563  0.3125 0.6250 0.85];
% 
% 
% 
% 
% % PSNR_plane_90=[64.4148 62.0070 59.2044 56.1554 51.5840 45.6280  ];
% % PSNR_plane_80=[64.1392 61.6125 58.5665 55.7678 51.2335 44.5230  ];
% % PSNR_plane_70=[64.0341 61.2970 58.2740 55.4784 50.9118 43.7159 ];
% % PSNR_plane_60=[63.7719 61.2133 58.0901 55.2506 50.7349 43.4297  ];
% % PSNR_plane_50=[63.6227 61.1768 57.9904 55.0560 50.5950 43.0783];
% 
% ER_plane_90=[0.0235 0.0471 0.0927 0.1849 0.2747 0.3643 0.4510 0.5376 0.6257 0.7122 ];
% ER_plane_80=[0.0247 0.0492 0.0976 0.1943 0.2893 0.3852 0.4777 0.5697 0.6644 0.7567 ];
% ER_plane_70=[0.0252 0.0501 0.0995 0.1981 0.2958 0.3934 0.4886 0.5844 0.6805 0.7771 ];
% ER_plane_60=[ 0.0253 0.0507 0.1006 0.2007 0.3 0.3982 0.4956 0.5927 0.6905 0.7884 ];
% ER_plane_50=[ 0.0254 0.0509 0.1011 0.2018 0.3020 0.4013 0.4993 0.5970 0.6961 0.7953];

% PSNR_plane_90=[64.4148 62.0070 59.2044 56.1554 53.5614 51.5840 50.35 48.9942 47.3809 45.6280  ];
% PSNR_plane_80=[64.1392 61.6125 58.5665 55.7678 52.6136 51.2335 49.9539 48.4949 45.9983 44.5230  ];
% PSNR_plane_70=[64.0341 61.2970 58.2740 55.4784 52.2647 50.9118 49.5232 47.6705 45.9989 43.7159 ];
% PSNR_plane_60=[63.7719 61.2133 58.0901 55.2506 52.0836 50.7349 49.2125 47.2553 45.0992 43.4297  ];
% PSNR_plane_50=[63.6227 61.1768 57.9904 55.0560 51.9248 50.5950 49.0231 46.8001 44.9118 43.0783];
%  
% 
% ER_our_plane=[];
% PSNR_our_plane=[];
PSNR_plane_90=[64.4148 62.0070 59.2044 56.1554 51.5840  45.6280  ];
PSNR_plane_80=[64.1392 61.6125 58.5665 55.7678  51.2335 44.5230  ];
PSNR_plane_70=[64.0341 61.2970 58.2740 55.4784  50.9118  43.7159 ];
PSNR_plane_60=[63.7719 61.2133 58.0901 55.2506  50.7349  43.4297  ];
PSNR_plane_50=[63.6227 61.1768 57.9904 55.0560  50.5950 43.0783];
PSNR_our_plane=[66.7387 63.8671 60.8469 57.3806 53.1396 48.0668 43.4494];
% 
 
plot(ER_plane_90,PSNR_plane_90,'-r^','LineWidth',1,'MarkerSize',10); hold on;
plot(ER_plane_80,PSNR_plane_80,'-gv','LineWidth',1,'MarkerSize',10); hold on;
plot(ER_plane_70,PSNR_plane_70,'-ko','LineWidth',1,'MarkerSize',10); hold on;
plot(ER_plane_60,PSNR_plane_60,'-m*','LineWidth',1,'MarkerSize',10); hold on;
plot(ER_plane_50,PSNR_plane_50,'-cd','LineWidth',1,'MarkerSize',10); hold on;
plot(ER_our_plane,PSNR_our_plane,'-bs','LineWidth',1,'MarkerSize',10); hold on;
 


axis([0 0.9 43 70]);
set(gca, 'XTick', [0 0.2 0.4 0.6 0.8 ]);set(gca,'FontSize',18);
xlabel('ER (bpp)');
ylabel('PSNR (dB)');
hl=legend('JPEG\_90','JPEG\_80','JPEG\_70','JPEG\_60','JPEG\_50','Proposed');
box on;    grid on;
set(hl,'Box','off')
%title('Airplane');



 %%%%%%
 
 
%figure;
% figure('Pos',[20 200 450 370]);
% AX2=axes('Pos',[.12 .13 .83 .82]);
% 
ER_plane_90=[0.0235 0.0471 0.0927 0.1849 0.2747 0.3643 0.4510 0.5376 0.6257 0.7122 ];
ER_plane_80=[0.0247 0.0492 0.0976 0.1943 0.2893 0.3852 0.4777 0.5697 0.6644 0.7567 ];
ER_plane_70=[0.0252 0.0501 0.0995 0.1981 0.2958 0.3934 0.4886 0.5844 0.6805 0.7771 ];
ER_plane_60=[ 0.0253 0.0507 0.1006 0.2007 0.3 0.3982 0.4956 0.5927 0.6905 0.7884 ];
ER_plane_50=[ 0.0254 0.0509 0.1011 0.2018 0.3020 0.4013 0.4993 0.5970 0.6961 0.7953];

% PSNR_plane_90=[64.4148 62.0070 59.2044 56.1554 53.5614 51.5840 50.35 48.9942 47.3809 45.6280  ];
% PSNR_plane_80=[64.1392 61.6125 58.5665 55.7678 52.6136 51.2335 49.9539 48.4949 45.9983 44.5230  ];
% PSNR_plane_70=[64.0341 61.2970 58.2740 55.4784 52.2647 50.9118 49.5232 47.6705 45.9989 43.7159 ];
% PSNR_plane_60=[63.7719 61.2133 58.0901 55.2506 52.0836 50.7349 49.2125 47.2553 45.0992 43.4297  ];
% PSNR_plane_50=[63.6227 61.1768 57.9904 55.0560 51.9248 50.5950 49.0231 46.8001 44.9118 43.0783];
 
PSNR_plane_90=[64.4148  59.2044 56.1554 53.5614 51.5840 50.35 48.9942 47.3809 45.6280  ];
PSNR_plane_80=[64.1392  58.5665 55.7678 52.6136 51.2335 49.9539 48.4949 45.9983 44.5230  ];
PSNR_plane_70=[64.0341  58.2740 55.4784 52.2647 50.9118 49.5232 47.6705 45.9989 43.7159 ];
PSNR_plane_60=[63.7719  58.0901 55.2506 52.0836 50.7349 49.2125 47.2553 45.0992 43.4297  ];
PSNR_plane_50=[63.6227  57.9904 55.0560 51.9248 50.5950 49.0231 46.8001 44.9118 43.0783];

ER_our_plane_90=ER_plane_90;
%PSNR_our_plane_90=[65.9606 63.0098 59.9901 56.5918 54.2985 51.6409 50.3843 49.3441 47.8667 45.7352];
PSNR_our_plane_90=[65.9606  59.9901 56.5918 54.2985 51.6409 50.3843 49.3441 47.8667 45.7352];
ER_our_plane_80=ER_plane_80;
%PSNR_our_plane_80=[65.7057 62.8340 59.6421 56.2667 53.7941 51.3760 50.0969 48.8155 46.8894 44.8252];
PSNR_our_plane_80=[65.7057  59.6421 56.2667 53.7941 51.3760 50.0969 48.8155 46.8894 44.8252];
ER_our_plane_70=ER_plane_70;
%PSNR_our_plane_70=[65.5952 62.7670 59.5445 56.1835 53.6054 51.2663 49.9828 48.4859 46.4082 44.6954];
PSNR_our_plane_70=[65.5952  59.5445 56.1835 53.6054 51.2663 49.9828 48.4859 46.4082 44.6954];
ER_our_plane_60=ER_plane_60;
% PSNR_our_plane_60=[65.5952 62.7449 59.4868 56.1302 53.4706 51.2151 49.9069 48.3855 45.6437 44.3822];
PSNR_our_plane_60=[65.5952  59.4868 56.1302 53.4706 51.2151 49.9069 48.3855 45.6437 44.3822];
% 
ER_our_plane_50=ER_plane_50;
%PSNR_our_plane_50=[65.5952 62.7220 59.4469 56.1002 53.4215 51.0979 49.8659 48.3428 45.6409 44.3452];
PSNR_our_plane_50=[65.5952  59.4469 56.1002 53.4215 51.0979 49.8659 48.3428 45.6409 44.3452];
% PSNR_our_plane=[66.7387 63.8671 60.8469 57.3806 53.1396 48.0668 ];

 
%plot(ER_plane_90,PSNR_plane_90,'-r^','LineWidth',0.8); hold on;
% plot(ER_plane_80,PSNR_plane_80,'-gv','LineWidth',0.8); hold on;
% plot(ER_plane_70,PSNR_plane_70,'-ko','LineWidth',0.8); hold on;
% plot(ER_plane_60,PSNR_plane_60,'-m*','LineWidth',0.8); hold on;
% plot(ER_plane_50,PSNR_plane_50,'-cd','LineWidth',0.8); hold on;
%plot(ER_our_plane,PSNR_our_plane,'-bs','LineWidth',0.8); hold on;
 
% plot(ER_our_plane_90,(PSNR_our_plane_90-PSNR_plane_90),'-r^','LineWidth',0.8,'MarkerSize',10); hold on;
% plot(ER_our_plane_80,(PSNR_our_plane_80-PSNR_plane_80),'-cv','LineWidth',0.8,'MarkerSize',10); hold on;
% plot(ER_our_plane_70,(PSNR_our_plane_70-PSNR_plane_70),'-ko','LineWidth',0.8,'MarkerSize',10); hold on;
% plot(ER_our_plane_60,(PSNR_our_plane_60-PSNR_plane_60),'-m*','LineWidth',0.8,'MarkerSize',10); hold on;
% plot(ER_our_plane_50,(PSNR_our_plane_50-PSNR_plane_50),'-bd','LineWidth',0.8,'MarkerSize',10); hold on;
% axis([0 0.8 0 3.6]);
% set(gca, 'XTick', [0 0.2 0.4 0.6 0.8]);
% set(gca, 'YTick', [0  1 2  3 ]);
% set(gca,'FontSize',16);
% xlabel('ER (bpp)');
% ylabel('PSNR gain (dB)');
% hl=legend('Proposed/JPEG\_90','Proposed/JPEG\_80','Proposed/JPEG\_70','Proposed/JPEG\_60','Proposed/JPEG\_50');
% box on;    grid on;
% set(hl,'Box','off')

% ”√÷˘◊¥Õº±Ì æ 
figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]); 
y=zeros(9,5);
y(:,1)=PSNR_our_plane_90-PSNR_plane_90;
y(:,2)=PSNR_our_plane_80-PSNR_plane_80;
y(:,3)=PSNR_our_plane_70-PSNR_plane_70;
y(:,4)=PSNR_our_plane_60-PSNR_plane_60;
y(:,5)=PSNR_our_plane_50-PSNR_plane_50;
b=bar(y);
axis([0 10 0 3]);
set(gca,'FontSize',18);   
ch = get(b,'children');
set(gca,'XTickLabel',{'0.02','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8'})
   %set(ch,'FaceVertexCData',[1 0 1;0 0 0;])
hl=legend('proposed/JPEG\_90','proposed/JPEG\_80','proposed/JPEG\_70','proposed/JPEG\_60','proposed/JPEG\_50');
xlabel('ER (bpp) ');
ylabel('PSNR gain (dB)');
set(hl,'Box','off')



%% Lena



% p=64;
% bpp=[1.8906 1.5469 1.3145 1.2041 1.0449];
% % 
% p=128;
% bpp=[1.604 1.2437 1.1006 0.9453 0.8804];
% % 
% p=256;
% bpp=[1.6897 1.3215 1.1409 1.0334 0.9402];
% % 
% p=512;
% bpp=[1.7635 1.3777 1.2045 1.0834 0.9939];
% % 
% % 
% p=1024;
% bpp=[1.7922 1.3904 1.2117 1.0991 1.0139];
% % 
% p=2048;
% bpp=[ 1.8101 1.3946 1.2163 1.0867 1.0095];


% p=768;
% bpp=[1.7634 1.3664 1.1895 1.0705 0.98877];
% 
% p=1280;
% bpp=[1.7917 1.3947 1.216 1.0987 1.0158];
% % 
% p=1536;
% bpp=[1.794 1.395 1.2074 1.0839 1.0019];
% % 
% p=1792;
% bpp=[1.8028 1.389 1.2161 1.0868 1.0065];
% ER=(p*16*(8.-bpp)-p*21)/512^2;







figure('Pos',[20 200 400 300]);
AX2=axes('Pos',[.12 .13 .83 .82]);

patchnumber=[64 128 256 512 1024 2048];
bpp_lena_90=[1.8906 1.604 1.6897 1.7635 1.7922 1.8101 ];
bpp_lena_80=[1.5469 1.2437 1.3215 1.3777 1.3904 1.3946 ];
bpp_lena_70=[1.3145 1.1006 1.1409 1.2045 1.2117 1.2163 ];
bpp_lena_60=[1.2041 0.9453 1.0334 1.0834 1.0991 1.0867 ];
bpp_lena_50=[ 1.0449 0.8804 0.9402 0.9939 1.0139 1.0095];
plot(patchnumber,bpp_lena_90,'-r^','LineWidth',0.8); hold on;
plot(patchnumber,bpp_lena_80,'-gv','LineWidth',0.8); hold on;
plot(patchnumber,bpp_lena_70,'-ko','LineWidth',0.8); hold on;
plot(patchnumber,bpp_lena_60,'-m*','LineWidth',0.8); hold on;
plot(patchnumber,bpp_lena_50,'-cd','LineWidth',0.8); hold on;
plot(patchnumber,[2.1250 2.1250 2.1250 2.1250 2.1250 2.1250],'-bs'); hold on;
 


axis([0 2100 0 2.2]);
set(gca, 'XTick', [0 256 512 1024 2048]);
set(gca,'FontSize',12);
xlabel('Selected patch number');
ylabel('Encoding length (bpp)');
hl=legend('JPEG\_90','JPEG\_80','JPEG\_70','JPEG\_60','JPEG\_50','Proposed');
box on;    grid on;
set(hl,'Box','off')





figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]);

patchnumber=[64 128 256 512 1024 2048];
% ER_lena_90=[0.0204 0.0431 0.0849 0.1675 0.3333 0.6644 ];
% ER_lena_80=[0.0218 0.0459 0.0907 0.1796 0.3584 0.7163  ];
% ER_lena_70=[0.0227 0.0471 0.0935 0.1850 0.3696 0.7386 ];
% ER_lena_60=[0.0231 0.0483 0.0952 0.1888 0.3766 0.7548  ];
% ER_lena_50=[ 0.0238 0.0488 0.0966 0.1916 0.3819 0.7644 ];

ER_lena_90=[ 0.0187 0.0397 0.0781 0.1539 0.3060 0.6097 ];
ER_lena_80=[ 0.0201 0.0425 0.0838 0.1659 0.3311 0.6616 ];
ER_lena_70=[ 0.0210 0.0436 0.0867 0.1713 0.3422 0.6839 ];
ER_lena_60=[ 0.0214 0.0449 0.0883 0.1751 0.3493 0.7001  ];
ER_lena_50=[ 0.0220 0.0454 0.0898 0.1779 0.3546 0.7098 ];


ER_our_lena=[0.0195 0.0391 0.0781 0.1563 0.3125 0.6250 ];



plot(patchnumber,ER_lena_90,'-r^','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,ER_lena_80,'-gv','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,ER_lena_70,'-ko','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,ER_lena_60,'-m*','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,ER_lena_50,'-cd','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,ER_our_lena,'-bs','LineWidth',1,'MarkerSize',10); hold on;
 


axis([0 2100 0 0.8]);
set(gca, 'XTick', [0 256 512 1024 2048]);set(gca,'FontSize',18);
xlabel('Embedded patch number');
ylabel('ER (bpp)');
hl=legend('JPEG\_90','JPEG\_80','JPEG\_70','JPEG\_60','JPEG\_50','Proposed','Location','NorthWest');
box on;    grid on;
set(hl,'Box','off')







figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]);
patchnumber=[64 128 256 512 1024 2048];
 
 

PSNR_lena_90=[61.1006 57.9665 54.1356 50.2009 44.1492 36.8616 ];
PSNR_lena_80=[ 60.7625 57.6815 53.8631 50.0114 44.1646 35.9791  ];
PSNR_lena_70=[ 60.7686 57.4839 53.6143 49.9179 43.9270 35.6340 ];
PSNR_lena_60=[ 60.5721 57.2521 53.4982 49.7583 43.6650 34.8624  ];
PSNR_lena_50=[60.4104 57.2510 53.3620 49.6243 43.4978 34.9627 ];
PSNR_our_lena=[ 63.3076 59.9027 55.6808 51.3959 47.5926 40.6992 ];




plot(patchnumber,PSNR_lena_90,'-r^','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,PSNR_lena_80,'-gv','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,PSNR_lena_70,'-ko','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,PSNR_lena_60,'-m*','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,PSNR_lena_50,'-cd','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,PSNR_our_lena,'-bs','LineWidth',1,'MarkerSize',10); hold on;
 


axis([0 2100 34 65]);
set(gca, 'XTick', [0 256 512 1024 2048]);set(gca,'FontSize',18);
xlabel('Embedded patch number');
ylabel('PSNR (dB)');
hl=legend('JPEG\_90','JPEG\_80','JPEG\_70','JPEG\_60','JPEG\_50','Proposed');
box on;    grid on;
set(hl,'Box','off')







 



%% 



figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]);
 
 
ER_lena_90=[ 0.0187 0.0397 0.0781 0.1539 0.3060 0.6097 ];
ER_lena_80=[ 0.0201 0.0425 0.0838 0.1659 0.3311 0.6616 ];
ER_lena_70=[ 0.0210 0.0436 0.0867 0.1713 0.3422 0.6839 ];
ER_lena_60=[ 0.0214 0.0449 0.0883 0.1751 0.3493 0.7001  ];
ER_lena_50=[ 0.0220 0.0454 0.0898 0.1779 0.3546 0.7098 ];


ER_our_lena=[0.0195 0.0391 0.0781 0.1563 0.3125 0.6250 0.8];

PSNR_lena_90=[61.1006 57.9665 54.1356 50.2009 44.1492 36.8616 ];
PSNR_lena_80=[ 60.7625 57.6815 53.8631 50.0114 44.1646 35.9791  ];
PSNR_lena_70=[ 60.7686 57.4839 53.6143 49.9179 43.9270 35.6340 ];
PSNR_lena_60=[ 60.5721 57.2521 53.4982 49.7583 43.6650 34.8624  ];
PSNR_lena_50=[60.4104 57.2510 53.3620 49.6243 43.4978 34.9627 ];
PSNR_our_lena=[ 63.3076 59.9027 55.6808 51.3959 47.5926 40.6992 37.3755];
 
plot(ER_lena_90,PSNR_lena_90,'-r^','LineWidth',1,'MarkerSize',10); hold on;
plot(ER_lena_80,PSNR_lena_80,'-gv','LineWidth',1,'MarkerSize',10); hold on;
plot(ER_lena_70,PSNR_lena_70,'-ko','LineWidth',1,'MarkerSize',10); hold on;
plot(ER_lena_60,PSNR_lena_60,'-m*','LineWidth',1,'MarkerSize',10); hold on;
plot(ER_lena_50,PSNR_lena_50,'-cd','LineWidth',1,'MarkerSize',10); hold on;
plot(ER_our_lena,PSNR_our_lena,'-bs','LineWidth',1,'MarkerSize',10); hold on;
 
 

axis([0 0.8 34 65]);
set(gca, 'XTick', [0 0.2 0.4 0.6 0.8]);set(gca,'FontSize',18);
xlabel('ER (bpp)');
ylabel('PSNR (dB)');
hl=legend('JPEG\_90','JPEG\_80','JPEG\_70','JPEG\_60','JPEG\_50','Proposed');
box on;    grid on;
set(hl,'Box','off')

%title('Lena');
%%
%%ER-PSNE gain:

figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]);
 
 
% ER_lena_90=[ 0.0187 0.0397 0.0781 0.1539 0.2308 0.3060 0.3825 0.4588 0.5343 0.6097 ];
% ER_lena_80=[ 0.0201 0.0425 0.0838 0.1659 0.2494 0.3311 0.4135 0.4962 0.5795 0.6616 ];
% ER_lena_70=[ 0.0210 0.0436 0.0867 0.1713 0.2577 0.3422 0.4275 0.5138 0.5984 0.6839 ];
% ER_lena_60=[ 0.0214 0.0449 0.0883 0.1751 0.2633 0.3493 0.4366 0.5253 0.6126 0.7001  ];
% ER_lena_50=[ 0.0220 0.0454 0.0898 0.1779 0.2671 0.3546 0.4431 0.5330 0.6214 0.7098 ];
% 
% PSNR_lena_90=[61.1006 57.9665 54.1356 50.2009 47.5713 44.1492 42.5714 40.8031 39.1619 36.8616 ];
% PSNR_lena_80=[ 60.7625 57.6815 53.8631 50.0114 47.3782 44.1646 41.9909 40.0159 38.4598 35.9791  ];
% PSNR_lena_70=[ 60.7686 57.4839 53.6143 49.9179 46.9234 43.9270 41.5715 39.9323 38.1739 35.6340 ];
% PSNR_lena_60=[ 60.5721 57.2521 53.4982 49.7583 46.5023 43.6650 41.3104 39.3715 37.5261 34.8624  ];
% PSNR_lena_50=[60.4104 57.2510 53.3620 49.6243 46.3027 43.4978 41.0362 39.0533 37.1861 34.9627 ];


ER_lena_90=[ 0.0187  0.0781  0.2308 0.3060 0.3825 0.4588 0.5343 0.6097 ];
ER_lena_80=[ 0.0201  0.0838  0.2494 0.3311 0.4135 0.4962 0.5795 0.6616 ];
ER_lena_70=[ 0.0210  0.0867  0.2577 0.3422 0.4275 0.5138 0.5984 0.6839 ];
ER_lena_60=[ 0.0214  0.0883  0.2633 0.3493 0.4366 0.5253 0.6126 0.7001  ];
ER_lena_50=[ 0.0220  0.0898  0.2671 0.3546 0.4431 0.5330 0.6214 0.7098 ];

PSNR_lena_90=[61.1006  54.1356  47.5713 44.1492 42.5714 40.8031 39.1619 36.8616 ];
PSNR_lena_80=[ 60.7625  53.8631  47.3782 44.1646 41.9909 40.0159 38.4598 35.9791  ];
PSNR_lena_70=[ 60.7686  53.6143  46.9234 43.9270 41.5715 39.9323 38.1739 35.6340 ];
PSNR_lena_60=[ 60.5721  53.4982  46.5023 43.6650 41.3104 39.3715 37.5261 34.8624  ];
PSNR_lena_50=[60.4104  53.3620  46.3027 43.4978 41.0362 39.0533 37.1861 34.9627 ];






PSNR_our_lena_90=[63.6398 55.6808 49.2801 47.6889 45.4478 43.6325 42.2508 40.8415];
PSNR_our_lena_80=[63.1860 55.2600 48.8652 47.2405 44.2016 42.8200 41.2082 40.5903];
PSNR_our_lena_70=[63.0128 55.1049 48.6675 46.8878 44.0972 42.7384 41.0287 39.7621];
PSNR_our_lena_60=[62.9667 55.0121 48.5587 46.5534 44.0587 42.4385 40.8635 39.3728];
PSNR_our_lena_50=[62.8615 54.8811 48.4231 46.2967 43.9081 42.2642 40.7454 39.0783];

figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]); 
y=zeros(8,5);
y(:,1)=PSNR_our_lena_90-PSNR_lena_90;
y(:,2)=PSNR_our_lena_80-PSNR_lena_80;
y(:,3)=PSNR_our_lena_70-PSNR_lena_70;
y(:,4)=PSNR_our_lena_60-PSNR_lena_60;
y(:,5)=PSNR_our_lena_50-PSNR_lena_50;
b=bar(y);
axis([0 9 0 8]);
set(gca,'FontSize',18);   
ch = get(b,'children');
set(gca,'XTickLabel',{'0.02','0.08','0.25','0.3','0.4','0.5','0.6','0.7'})
   %set(ch,'FaceVertexCData',[1 0 1;0 0 0;])
hl=legend('proposed/JPEG\_90','proposed/JPEG\_80','proposed/JPEG\_70','proposed/JPEG\_60','proposed/JPEG\_50');
xlabel('ER (bpp) ');
ylabel('PSNR gain (dB)');
set(hl,'Box','off')



%% Baboon


% 
% p=64;
% bpp=[2.165 1.5527 1.3242 1.1904 1.0947];
% % % 
% p=128;
% bpp=[2.0337 1.5273 1.292 1.1553 1.0557];
% % % 
% p=256;
% bpp=[2.0916 1.5156 1.2856 1.1426 1.0269];
% % % 
% p=512;
% bpp=[2.1208 1.5254 1.2961 1.1503 1.0571];
% % % 
% % % 
% p=1024;
% bpp=[2.2397 1.5613 1.3105 1.1565 1.0485];
% % % 
% p=2048;
% bpp=[2.304 1.5839 1.2978 1.1264 1.0179];


% 
% p=768;
% bpp=[2.129 1.4961 1.2693 1.1177 1.0216];
% 
% p=1280;
% bpp=[2.2346 1.5514 1.3042 1.1459 1.0364];
% 
% p=1536;
% bpp=[2.2532 1.5485 1.2898 1.1263 1.0203];
% 
% p=1792;
% bpp=[2.2794 1.5613 1.2831 1.1226 1.0105];
% ER=(p*16*(8.-bpp)-p*21)/512^2;




 
figure('Pos',[20 200 400 300]);
AX2=axes('Pos',[.12 .13 .83 .82]);

patchnumber=[64 128 256 512 1024 2048];
bpp_baboon_90=[2.165 2.0337 2.0916 2.1208 2.2397 2.304  ];
bpp_baboon_80=[1.5527 1.5273 1.5156 1.5254 1.5613 1.5839  ];
bpp_baboon_70=[1.3242 1.292 1.2856 1.2961 1.3105 1.2978  ];
bpp_baboon_60=[1.1904 1.1553 1.1426 1.1503 1.1565 1.1264 ];
bpp_baboon_50=[ 1.0947 1.0557 1.0269 1.0571 1.0485 1.0179 ];
plot(patchnumber,bpp_baboon_90,'-r^'); hold on;
plot(patchnumber,bpp_baboon_80,'-gv'); hold on;
plot(patchnumber,bpp_baboon_70,'-ko'); hold on;
plot(patchnumber,bpp_baboon_60,'-m*'); hold on;
plot(patchnumber,bpp_baboon_50,'-cd'); hold on;
plot(patchnumber,[2.1250 2.1250 2.1250 2.1250 2.1250 2.1250],'-bs'); hold on;
 


axis([0 2100 0 2.2]);
set(gca, 'XTick', [0 256 512 1024 2048]);
set(gca,'FontSize',12);
xlabel('Selected patch number');
ylabel('Encoding length (bpp)');
hl=legend('JPEG\_90','JPEG\_80','JPEG\_70','JPEG\_60','JPEG\_50','Proposed');
box on;    grid on;
set(hl,'Box','off')





figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]);

patchnumber=[64 128 256 512 1024 2048];
% ER_baboon_90=[0.0194 0.0398 0.0786 0.1564 0.3053 0.6026  ];
% ER_baboon_80=[ 0.0218 0.0437 0.0876 0.1750 0.3477 0.6926 ];
% ER_baboon_70=[0.0227 0.0456 0.0912 0.1822 0.3634 0.7284];
% ER_baboon_60=[0.0232 0.0466 0.0935 0.1867 0.3730 0.7498  ];
% ER_baboon_50=[ 0.0236 0.0474 0.0953 0.1896 0.3798 0.7634  ];



ER_baboon_90=[ 0.0177 0.0364 0.0718 0.1427 0.2780 0.5479  ];
ER_baboon_80=[0.0201 0.0403 0.0808 0.1613 0.3204 0.6380   ];
ER_baboon_70=[ 0.0210 0.0422 0.0844 0.1685 0.3361 0.6737];
ER_baboon_60=[ 0.0215 0.0432 0.0866 0.1730 0.3457 0.6951  ];
ER_baboon_50=[ 0.0218 0.0440 0.0884 0.1760 0.3524 0.7087   ];



ER_our_baboon=[0.0195 0.0391 0.0781 0.1563 0.3125 0.6250 ];
plot(patchnumber,ER_baboon_90,'-r^','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,ER_baboon_80,'-gv','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,ER_baboon_70,'-ko','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,ER_baboon_60,'-m*','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,ER_baboon_50,'-cd','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,ER_our_baboon,'-bs','LineWidth',1,'MarkerSize',10); hold on;
 


axis([0 2100 0 0.8]);
set(gca, 'XTick', [0 256 512 1024 2048]);set(gca,'FontSize',18);
xlabel('Embedded patch number');
ylabel('ER (bpp)');
hl=legend('JPEG\_90','JPEG\_80','JPEG\_70','JPEG\_60','JPEG\_50','Proposed','Location','NorthWest');
box on;    grid on;
set(hl,'Box','off')







figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]);
patchnumber=[64 128 256 512 1024 2048];
 
 

PSNR_baboon_90=[53.7026 50.9385 47.5433 41.3845 34.4925 25.0377];
PSNR_baboon_80=[53.6237 50.8837 47.3989 41.1844 34.0375 24.3363];
PSNR_baboon_70=[53.6037 50.8592 47.3672 41.0878 34.0456 24.3441];
PSNR_baboon_60=[53.5924 50.4396 47.2508 40.9823 33.9841 24.1242];
PSNR_baboon_50=[53.5469 50.4057 47.1925 40.9588 33.8798 23.9927];
PSNR_our_baboon=[54.6313 52.0880 48.4635 43.2801 36.7756 27.4454];




plot(patchnumber,PSNR_baboon_90,'-r^','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,PSNR_baboon_80,'-gv','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,PSNR_baboon_70,'-ko','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,PSNR_baboon_60,'-m*','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,PSNR_baboon_50,'-cd','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,PSNR_our_baboon,'-bs','LineWidth',1,'MarkerSize',10); hold on;
 


axis([0 2100 23 55]);
set(gca, 'XTick', [0 256 512 1024 2048]);set(gca,'FontSize',18);
xlabel('Embedded patch number');
ylabel('PSNR (dB)');
hl=legend('JPEG\_90','JPEG\_80','JPEG\_70','JPEG\_60','JPEG\_50','Proposed');
box on;    grid on;
set(hl,'Box','off')







 







figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]);

 
% ER_baboon_90=[0.0194 0.0398 0.0786 0.1564 0.3053 0.6026  ];
% ER_baboon_80=[ 0.0218 0.0437 0.0876 0.1750 0.3477 0.6926 ];
% ER_baboon_70=[0.0227 0.0456 0.0912 0.1822 0.3634 0.7284];
% ER_baboon_60=[0.0232 0.0466 0.0935 0.1867 0.3730 0.7498  ];
% ER_baboon_50=[ 0.0236 0.0474 0.0953 0.1896 0.3798 0.7634  ];


ER_baboon_90=[ 0.0177 0.0364 0.0718 0.1427 0.2780 0.5479  ];
ER_baboon_80=[0.0201 0.0403 0.0808 0.1613 0.3204 0.6380   ];
ER_baboon_70=[ 0.0210 0.0422 0.0844 0.1685 0.3361 0.6737];
ER_baboon_60=[ 0.0215 0.0432 0.0866 0.1730 0.3457 0.6951  ];
ER_baboon_50=[ 0.0218 0.0440 0.0884 0.1760 0.3524 0.7087   ];
ER_our_baboon=[0.0195 0.0391 0.0781 0.1563 0.3125 0.6250 0.7];

PSNR_baboon_90=[53.7026 50.9385 47.5433 41.3845 34.4925 25.0377];
PSNR_baboon_80=[53.6237 50.8837 47.3989 41.1844 34.0375 24.3363];
PSNR_baboon_70=[53.6037 50.8592 47.3672 41.0878 34.0456 24.3441];
PSNR_baboon_60=[53.5924 50.4396 47.2508 40.9823 33.9841 24.1242];
PSNR_baboon_50=[53.5469 50.4057 47.1925 40.9588 33.8798 23.9927];
PSNR_our_baboon=[54.6313 52.0880 48.4635 43.2801 36.7756 27.4454 25.6236];
 
plot(ER_baboon_90,PSNR_baboon_90,'-r^','LineWidth',1,'MarkerSize',10); hold on;
plot(ER_baboon_80,PSNR_baboon_80,'-gv','LineWidth',1,'MarkerSize',10); hold on;
plot(ER_baboon_70,PSNR_baboon_70,'-ko','LineWidth',1,'MarkerSize',10); hold on;
plot(ER_baboon_60,PSNR_baboon_60,'-m*','LineWidth',1,'MarkerSize',10); hold on;
plot(ER_baboon_50,PSNR_baboon_50,'-cd','LineWidth',1,'MarkerSize',10); hold on;
plot(ER_our_baboon,PSNR_our_baboon,'-bs','LineWidth',1,'MarkerSize',10); hold on;
 


axis([0 0.8 23 55]);
set(gca, 'XTick', [0 0.2 0.4 0.6 0.8]);set(gca,'FontSize',18);
xlabel('ER (bpp)');
ylabel('PSNR (dB)');
hl=legend('JPEG\_90','JPEG\_80','JPEG\_70','JPEG\_60','JPEG\_50','Proposed');
box on;    grid on;
set(hl,'Box','off')





% PSNR_gain baboon




% figure('Pos',[20 200 550 450]);
% 
% AX2=axes('Pos',[.12 .13 .83 .82]);

ER_baboon_90=[0.0177  0.0718 0.1427 0.2137 0.2780 0.3479 0.4157 0.4821 0.5479 ];
ER_baboon_80=[0.0201  0.0808 0.1613 0.2433 0.3204 0.4013 0.4818 0.5607 0.6380];
ER_baboon_70=[0.0210  0.0844 0.1685 0.2540 0.3361 0.4206 0.5060 0.5911 0.6737];
ER_baboon_60=[0.0215  0.0866 0.1730 0.2611 0.3457 0.4329 0.5214 0.6087 0.6951 ];
ER_baboon_50=[0.0218  0.0884 0.1760 0.2656 0.3524 0.4415 0.5313 0.6209 0.7087 ];


%ER_our_baboon=[0.0195 0.0391 0.0781 0.1563 0.3125 0.6250 ];

% PSNR_baboon_90=[53.7026 47.5433 41.3845 37.7674 34.4925 31.8453 29.4922 27.1062 25.0377];
% PSNR_baboon_80=[53.6237 47.3989 41.1844 37.5517 34.0375 31.3150 28.9592 26.6722 24.3363];
% PSNR_baboon_70=[53.6037 47.3672 41.0878 37.4699 34.0456 31.2512 28.8829 26.3940 24.3441];
% PSNR_baboon_60=[53.5924 47.2508 40.9823 37.3822 33.9841 31.1203 28.6619 26.3142 24.1242];
% PSNR_baboon_50=[53.5469 47.1925 40.9588 37.2332 33.8798 30.8943 28.5572 26.1407 23.9927];
% %PSNR_our_baboon=[54.6313 52.0880 48.4635 43.2801 36.7756 27.4454 ];
%  
% PSNR_our_baboon_90=[54.9390 48.8360 44.0662 40.1510 37.9054 35.4852 33.3784 31.0973 29.2524];
% PSNR_our_baboon_80=[54.4729 48.3238 42.9788 39.0464 36.2133 33.6688 31.0777 28.8861 27.0889];
% PSNR_our_baboon_70=[54.3222 48.1722 42.6867 38.8278 35.8541 33.0541 30.4162 28.0758 26.1304];
% PSNR_our_baboon_60=[54.2402 48.0697 42.3141 38.5025 35.5299 32.6875 30.0887 27.9085 25.8156];
% PSNR_our_baboon_50=[54.2096 48.0149 42.1825 38.3542 35.4845 32.3090 29.9666 27.4958 25.2695];




PSNR_baboon_90=[53.7026 47.5433  37.7674 34.4925 31.8453 29.4922 27.1062 25.0377];
PSNR_baboon_80=[53.6237 47.3989  37.5517 34.0375 31.3150 28.9592 26.6722 24.3363];
PSNR_baboon_70=[53.6037 47.3672  37.4699 34.0456 31.2512 28.8829 26.3940 24.3441];
PSNR_baboon_60=[53.5924 47.2508  37.3822 33.9841 31.1203 28.6619 26.3142 24.1242];
PSNR_baboon_50=[53.5469 47.1925  37.2332 33.8798 30.8943 28.5572 26.1407 23.9927];

 
PSNR_our_baboon_90=[54.9390 48.8360  40.1510 37.9054 35.4852 33.3784 31.0973 29.2524];
PSNR_our_baboon_80=[54.4729 48.3238  39.0464 36.2133 33.6688 31.0777 28.8861 27.0889];
PSNR_our_baboon_70=[54.3222 48.1722  38.8278 35.8541 33.0541 30.4162 28.0758 26.1304];
PSNR_our_baboon_60=[54.2402 48.0697  38.5025 35.5299 32.6875 30.0887 27.9085 25.8156];
PSNR_our_baboon_50=[54.2096 48.0149  38.3542 35.4845 32.3090 29.9666 27.4958 25.2695];




figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]); 
y=zeros(8,5);
y(:,1)=PSNR_our_baboon_90-PSNR_baboon_90;
y(:,2)=PSNR_our_baboon_80-PSNR_baboon_80;
y(:,3)=PSNR_our_baboon_70-PSNR_baboon_70;
y(:,4)=PSNR_our_baboon_60-PSNR_baboon_60;
y(:,5)=PSNR_our_baboon_50-PSNR_baboon_50;
b=bar(y);
axis([0 9 0 7.5]);
set(gca,'FontSize',18);   
ch = get(b,'children');
set(gca,'XTickLabel',{'0.02','0.08','0.25','0.3','0.4','0.5','0.6','0.65'})
   %set(ch,'FaceVertexCData',[1 0 1;0 0 0;])
hl=legend('proposed/JPEG\_90','proposed/JPEG\_80','proposed/JPEG\_70','proposed/JPEG\_60','proposed/JPEG\_50');
xlabel('ER (bpp) ');
ylabel('PSNR gain (dB)');
set(hl,'Box','off')
