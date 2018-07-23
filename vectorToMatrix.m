            

function decrypt_block_code_LSB0=vectorToMatrix(decrypt_block_code_128)


decrypt_block_code=reshape(decrypt_block_code_128,8,16);

decrypt_block_code_LSB0=zeros(16,1);
for i=1:16
    decrypt_block_code_LSB0(i)=bin2dec(char(decrypt_block_code(:,i)+48)');
end



 