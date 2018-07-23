function encrypt_image_hiddendata_embed=encryptedImgHiding(encrypted_image,hidendata,DH_Key,blcoksize)

%% ͼ��תΪ����
[N,N]=size(encrypted_image);
BlockNumber=(N*N)/(blcoksize*blcoksize);
encrypt_block_code=cell(1,BlockNumber);
blockNo=1;
for i=1:N/blcoksize 
    mstart=(i-1)*blcoksize+1;  
    for j=1:N/blcoksize   
        nstart=(j-1)*blcoksize+1;  
        imBlock=zeros(blcoksize,blcoksize); % ����ÿһ��block�Ҷ�ֵ

        for m=mstart:1:mstart+blcoksize-1
            for n=nstart:nstart+blcoksize-1
                mblock=mod(m,blcoksize);
                nblock=mod(n,blcoksize);
                if mblock==0 
                    mblock=blcoksize;
                end
                if nblock==0 
                    nblock=blcoksize;
                end
                imBlock(mblock,nblock)=encrypted_image(m,n); % ����ÿһ��block  
           
            end
  
        end
            
        %%%%%%%%% ��ÿ��Block����zigzagɨ�裬�õ�ÿ��block��ϵ������vblock
        for ii=1:4
            for jj=1:4
                pixel_code=double(dec2bin(imBlock(ii,jj),8))-48;
                encrypt_block_code{:,blockNo}=cat(2,encrypt_block_code{:,blockNo},pixel_code);
                    
            end
        end
%         LSB=encrypt_block_code{1,blockNo}(128);
%         if LSB==1
%             encrypt_block_code{1,blockNo}(1:127)=circshift(encrypt_block_code{1,blockNo}(1:127)',4)'; % ѭ������nλ���ָ�ԭ����˳��
%         end
         
        blockNo=blockNo+1;
    end
end



%% ���������ݽ��м��ܺ�Ƕ�롣��data-hiding key:DH_Key��
% hidendata������������ 0 1 bit

key=DH_Key;
RandStream.setGlobalStream ... 
     (RandStream('mt19937ar','seed',key));
hidendata_len=length(hidendata);
permuteDataNo=randperm(hidendata_len); % ��data ����Ž�������
permuteDataValue=zeros(1,hidendata_len); % permuteDataValueΪ������������key����֮���data��ֵ
for i=1:hidendata_len
    permuteDataValue(i)=hidendata(permuteDataNo(i));
end

 
hidendata_len=length(hidendata);
hidendata_len_code=dec2bin(hidendata_len-1,21);
hidendata_len_code=double(hidendata_len_code)-48; % Ƕ�����ݳ�����ռλ������

hiden_total=cat(2,hidendata_len_code,permuteDataValue);
len=length(hiden_total); 


%% ���㲻�ܱ�����Ƕ��ĳ���

current_p=1;

LSB_len_code=zeros(1,14);
for i=1:BlockNumber

    encrypt_block_code{1,i}=double(encrypt_block_code{1,i});
  
    LSB=encrypt_block_code{1,i}(128);
    if LSB==1 % LSB=1����blcok����Ƕ�룬����0����Ƕ�롣
%         encrypt_block_code{1,i}(1:127)=circshift(encrypt_block_code{1,i}(1:127)',4)'; % ѭ������nλ���ָ�ԭ����˳��
        embed_data_len=encrypt_block_code{1,i}(121:127);
        data_len=bin2dec(char((embed_data_len)+48));
        data_len=data_len+1; % ֮ǰ�Ǽ�1Ƕ���
        if current_p-1+data_len<14   % ��ȡ14λ�̣ӣ����ݵĳ��ȣ��������Ƕ��
           LSB_len_code(current_p:current_p+data_len-1)=encrypt_block_code{1,i}(120-data_len+1:120);
        else
           res=14-(current_p-1);
           LSB_len_code(current_p:current_p+res-1)= encrypt_block_code{1,i}(120-data_len+1:120-data_len+1+res-1); % ���������ݵ�ǰ����������ȡ����Ӧ�ô�ÿһ��Ŀ���ȡ���ֵ�ͷ��ʼ
           break;
        end
        current_p=current_p+data_len;
    end
end

LSB_length=bin2dec(char((LSB_len_code)+48));
LSB_length=LSB_length+1; %LSB_length Ϊʵ�ʵ�ʮ���Ƶ�LSB����ֵ

no_embed_len=LSB_length+14; % ���ܱ�Ƕ��ĳ��ȣ��Ѿ���LSB������ռ��
 


%% ����Ƕ��

current_p=1;
current_bit=1;
flag=0;
for i=1:BlockNumber

    encrypt_block_code{1,i}=double(encrypt_block_code{1,i});
    LSB=encrypt_block_code{1,i}(128);
    if LSB==1 % LSB=1����blcok����Ƕ�룬����0����Ƕ�롣
%         encrypt_block_code{1,i}(1:127)=circshift(encrypt_block_code{1,i}(1:127)',4)'; % ѭ������nλ���ָ�ԭ����˳��
        embed_data_len=encrypt_block_code{1,i}(121:127);
        data_len=bin2dec(char((embed_data_len)+48));
        data_len=data_len+1; % ֮ǰ�Ǽ�1Ƕ��ġ�
        if flag==0
            if current_p-1+data_len<=no_embed_len
                current_p=current_p+data_len;
                continue;
            else     % ��ǰ�����Ƕ������
                res=abs(no_embed_len-(current_p-1+data_len)); % �˿����Ƕ���������
                if res<len
                encrypt_block_code{1,i}(120-data_len+1:120-data_len+1+res-1)=hiden_total(current_bit:current_bit+res-1); % y����LSB����󲿷�Ƕ���ڴ˿�ĺ󲿣��������ݴӿ�Ŀ�Ƕ�벿��ͷ��ʼ
                current_bit=current_bit+res;
                flag=1; %current_p ����ʹ�ã�����������if
                continue;
                else
                    encrypt_block_code{1,i}(120-data_len+1:120-data_len+1+len-1)=hiden_total(current_bit:current_bit+len-1);
                    break;
                end
            end
        end
        if flag==1
%             tempdata = encrypt_block_code{1,i};    
            if current_bit-1+data_len<len
                disp(i)
                encrypt_block_code{1,i}(120-data_len+1:120)=hiden_total(current_bit:current_bit+data_len-1);
%                 encrypt_block_code{1,i} = tempdata;
            else
                res=len-(current_bit-1);
                encrypt_block_code{1,i}(120-res+1:120)=hiden_total(current_bit:current_bit+res-1); % �����ݳ��ȵĺ��濪ʼǶ�롣��������***�� *ΪǶ��Ĳ��֣������ҡ�
%                 encrypt_block_code{1,i} = tempdata;
                break;
            end
%             encrypt_block_code{1,i} = tempdata;
            current_bit=current_bit+data_len;
        end
    end
end
encrypt_block_code_embed=encrypt_block_code;


%% Ƕ����ϵ�block codeתΪͼ��

blockNo=1;
for i=1:N/blcoksize 
    mstart=(i-1)*blcoksize+1;  
    for j=1:N/blcoksize   
        nstart=(j-1)*blcoksize+1;  
        bp=1;
        encrypt_block=reshape(double(encrypt_block_code_embed{:,blockNo}),8,16);
        for m=mstart:1:mstart+blcoksize-1
            for n=nstart:nstart+blcoksize-1
                encrypted_image(m,n)=bin2dec(char((encrypt_block(:,bp))'+48));
                bp=bp+1;
            end
        end
        blockNo=blockNo+1;      
    end
end
encrypt_image_hiddendata_embed=encrypted_image;
