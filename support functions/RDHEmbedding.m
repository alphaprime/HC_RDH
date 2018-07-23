function [frame_embed, actualEmbedRate]=RDHEmbedding(img,embedbit) 


% img ����ͼ��
% embedbit ��Ƕ������
% ���ܣ����ÿ����������صķ�������Ƕ�롣��ȡ�����������û���κ�ʧ�档������ݿ���Ƕ���κ�֡��


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


 