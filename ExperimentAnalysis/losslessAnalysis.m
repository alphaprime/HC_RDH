
figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]);

patchnumber=[64 128 256 512 1024 2048];
bpp_plane_arith=[2.8750 3.0352 3.4219 3.4600 3.9839 4.3689 ];
bpp_plane_huffman=[2.3125 2.2129 2.3965 2.2539 2.4399 2.6951 ];
 
plot(patchnumber,bpp_plane_arith,'-r^','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,bpp_plane_huffman,'-mv','LineWidth',1,'MarkerSize',10); hold on;
 
plot(patchnumber,[2.1250 2.1250 2.1250 2.1250 2.1250 2.1250],'-bs','LineWidth',1,'MarkerSize',10); hold on;
 


axis([0 2100 2 5]);
set(gca, 'XTick', [0 256 512 1024 2048]);
set(gca,'FontSize',18);
xlabel('Embedded patch number');
ylabel('Encoding length (bpp)');
hl=legend('Arithmetic coding','Huffman coding','Proposed','Location','NorthWest');
box on;    grid on;
set(hl,'Box','off')






% p=64;
% bpp=[2.8750 2.3125];
% 
% p=128;
% bpp=[3.0352 2.2129];
% 
% p=256;
% bpp=[3.4219 2.3965];
% 
% p=512;
% bpp=[3.4600 2.2539];
% 
% 
% p=1024;
% bpp=[3.9839 2.4399];
% 
% p=2048;
% bpp=[4.3689 2.6951];
% ER=(p*16*(8.-bpp)-p*14)/512^2;











figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]);

patchnumber=[64 128 256 512 1024 2048];
ER_plane_arith=[0.0166 0.0320 0.0579 0.1145 0.1963 0.3445  ];
ER_plane_huffman=[ 0.0188 0.0384 0.0739 0.1522 0.2928 0.5537 ];
ER_our_plane=[0.0195 0.0391 0.0781 0.1563 0.3125 0.6250]; 
plot(patchnumber,ER_plane_arith,'-r^','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,ER_plane_huffman,'-mv','LineWidth',1,'MarkerSize',10); hold on;
 
plot(patchnumber,ER_our_plane,'-bs','LineWidth',1,'MarkerSize',10); hold on;
 


axis([0 2100 0 0.8]);
set(gca, 'XTick', [0 256 512 1024 2048]);
set(gca,'FontSize',18);
xlabel('Embedded patch number');
ylabel('ER (bpp)');
hl=legend('Arithmetic coding','Huffman coding','Proposed','Location','NorthWest');
box on;    grid on;
set(hl,'Box','off')

















%% Lena



figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]);

patchnumber=[64 128 256 512 1024 2048];
bpp_lena_arith=[6.5 6.4258 6.6719 6.7773 6.8154 6.8826  ];
bpp_lena_huffman=[ 4.8125 4.3516 4.5859 4.4961 4.4556 4.3599 ];
 
plot(patchnumber,bpp_lena_arith,'-r^','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,bpp_lena_huffman,'-mv','LineWidth',1,'MarkerSize',10); hold on;
 
plot(patchnumber,[2.1250 2.1250 2.1250 2.1250 2.1250 2.1250],'-bs','LineWidth',1,'MarkerSize',10); hold on;
 


axis([0 2100 1 10]);
set(gca, 'XTick', [0 256 512 1024 2048]);
set(gca,'FontSize',18);
xlabel('Embedded patch number');
ylabel('Encoding length (bpp)');
hl=legend('Arithmetic coding','Huffman coding','Proposed','Location','NorthWest');
box on;    grid on;
set(hl,'Box','off')






% p=64;
% bpp=[6.5 4.8125];
% 
% p=128;
% bpp=[6.4258 4.3516];
% % 
% p=256;
% bpp=[6.6719 4.5859];
% % 
% p=512;
% bpp=[6.7773 4.4961];
% % 
% % 
% p=1024;
% bpp=[6.8154 4.4556];
% % 
% p=2048;
% bpp=[6.8826 4.3599];
% ER=(p*16*(8.-bpp)-p*14)/512^2;











figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]);

patchnumber=[64 128 256 512 1024 2048];
ER_lena_arith=[ 0.0024 0.0055 0.0071 0.0109 0.0193 0.0303  ];
ER_lena_huffman=[0.0090 0.0217 0.0397 0.0822 0.1668 0.3456   ];
ER_our_lena=[0.0195 0.0391 0.0781 0.1563 0.3125 0.6250]; 
plot(patchnumber,ER_lena_arith,'-r^','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,ER_lena_huffman,'-mv','LineWidth',1,'MarkerSize',10); hold on;
 
plot(patchnumber,ER_our_lena,'-bs','LineWidth',1,'MarkerSize',10); hold on;
 


axis([0 2100 0 0.8]);
set(gca, 'XTick', [0 256 512 1024 2048]);
set(gca,'FontSize',18);
xlabel('Embedded patch number');
ylabel('ER (bpp)');
hl=legend('Arithmetic coding','Huffman coding','Proposed','Location','NorthWest');
box on;    grid on;
set(hl,'Box','off')













%% baboon



figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]);

patchnumber=[64 128 256 512 1024 2048];
bpp_baboon_arith=[6.6719 6.4531 6.3340 6.2783 6.3853 6.5798 ];
bpp_baboon_huffman=[5.6875 5.2930 5.0996 5.0010 5.0156 5.0789 ];
 
plot(patchnumber,bpp_baboon_arith,'-r^','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,bpp_baboon_huffman,'-mv','LineWidth',1,'MarkerSize',10); hold on;
 
plot(patchnumber,[2.1250 2.1250 2.1250 2.1250 2.1250 2.1250],'-bs','LineWidth',1,'MarkerSize',10); hold on;
 


axis([0 2100 1 10]);
set(gca, 'XTick', [0 256 512 1024 2048]);
set(gca,'FontSize',18);
xlabel('Embedded patch number');
ylabel('Encoding length (bpp)');
hl=legend('Arithmetic coding','Huffman coding','Proposed','Location','NorthWest');
box on;    grid on;
set(hl,'Box','off')






% p=64;
% bpp=[ 6.6719 5.6875];
% % 
% p=128;
% bpp=[6.4531 5.2930];
% % % 
% p=256;
% bpp=[6.3340 5.0996];
% % % 
% p=512;
% bpp=[6.2783 5.0010];
% % % 
% % % 
% p=1024;
% bpp=[6.3853 5.0156];
% % % 
% p=2048;
% bpp=[6.5798 5.0789];
% ER=(p*16*(8.-bpp)-p*14)/512^2;











figure('Pos',[20 200 550 450]);
AX2=axes('Pos',[.12 .13 .83 .82]);

patchnumber=[64 128 256 512 1024 2048];
ER_baboon_arith=[0.0018 0.0052 0.0124 0.0265 0.0462 0.0682];
ER_baboon_huffman=[ 0.0056 0.0143 0.0316 0.0664 0.1318 0.2558  ];
ER_our_baboon=[0.0195 0.0391 0.0781 0.1563 0.3125 0.6250]; 
plot(patchnumber,ER_baboon_arith,'-r^','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,ER_baboon_huffman,'-mv','LineWidth',1,'MarkerSize',10); hold on;
plot(patchnumber,ER_our_baboon,'-bs','LineWidth',1,'MarkerSize',10); hold on;
 


axis([0 2100 0 0.8]);
set(gca, 'XTick', [0 256 512 1024 2048]);
set(gca,'FontSize',18);
xlabel('Embedded patch number');
ylabel('ER (bpp)');
hl=legend('Arithmetic coding','Huffman coding','Proposed','Location','NorthWest');
box on;    grid on;
set(hl,'Box','off')

 



