function decrypt_block_code=block_deSC(position1,position2,value1,value2,error_vector)



L=2;
load('Dictionary\D_256_2_50'); % ÑµÁ·ºÃµÄ×Öµä
K=256;
coff=zeros(K,1);
coff(position1)=value1;
coff(position2)=value2;
decrypt_block_code=round(Dictionary_out*coff);%+error_vector;




 