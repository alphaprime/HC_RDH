function [frame_embed, actualEmbedRate]=RDHEmbedding(img,embedbit) 


% img 载体图像
% embedbit 欲嵌入数据
% 功能：采用可逆数据隐藏的方法进行嵌入。提取后对载体数据没有任何失真。因此数据可以嵌入任何帧。


% kede ma
B=img;
m=embedbit';

if (nargin < 2 || nargin > 4)
   wI = -Inf;
   actualEmbedRate = -Inf;
   PSNR = -Inf;
   return;
end

if (nargin == 2)
    T1 = 0.25;
    T2 = 0.2;
end

if (nargin == 3)
    T2 = 0.2;
end




embeddingRound = 1;
fprintf('  Embedding round %d:\n ',embeddingRound);
[wB,payload,boundaryMap,multiInd]= embedB(B,m,T2);
while multiInd % multilayer embedding is needed.
    embeddingRound = embeddingRound + 1;
    fprintf(' Embedding round %d:\n ',embeddingRound);
    d = m(payload + 1:end);
    [wB,payload_m,boundaryMap_m,multiInd]= embedB(wB,d,T2);
    payload = payload + payload_m;
    boundaryMap = [boundaryMap;boundaryMap_m];    
end
frame_embed=wB;
[h,w]=size(img);
actualEmbedRate = payload /(h*w) ;

PSNR = PSNR_compute(img,wB);


%% our tifs


 