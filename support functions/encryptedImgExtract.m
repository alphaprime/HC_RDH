function hidendata_extract_final=encryptedImgExtract(img_Encry_embed,DH_Key,blcoksize) 

%% ͼ��תΪ����
[N,N]=size(img_Encry_embed);
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
                imBlock(mblock,nblock)=img_Encry_embed(m,n); % ����ÿһ��block  
           
            end
  
        end
            
        %%%%%%%%% ��ÿ��Block����zigzagɨ�裬�õ�ÿ��block��ϵ������vblock
        for ii=1:4
            for jj=1:4
                pixel_code=double(dec2bin(imBlock(ii,jj),8))-48;
                encrypt_block_code{:,blockNo}=cat(2,encrypt_block_code{:,blockNo},pixel_code);
                    
            end
        end
         
        blockNo=blockNo+1;
    end
end

%% ��ȡ14λLSB�ĳ��ȣ��������Ƕ������

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
 


%% ������ȡ�����ȡ��ȡ�����ݵĳ��ȡ�LSB֮���ǰ21λ��ʾ���ݵĳ���
len=21;
current_p=1;
current_bit=1;
flag=0;
for i=1:BlockNumber

    encrypt_block_code{1,i}=double(encrypt_block_code{1,i});
    LSB=encrypt_block_code{1,i}(128);
    if LSB==1 % LSB=1����blcok����Ƕ�룬����0����Ƕ�롣
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
                hiden_length_total(current_bit:current_bit+res-1)=encrypt_block_code{1,i}(120-data_len+1:120-data_len+1+res-1); % y����LSB����󲿷�Ƕ���ڴ˿�ĺ󲿣��������ݴӿ�Ŀ�Ƕ�벿��ͷ��ʼ
                current_bit=current_bit+res;
                flag=1; %current_p ����ʹ�ã�����������if
                continue;
                else
                    hiden_length_total(current_bit:current_bit+len-1)=encrypt_block_code{1,i}(120-data_len+1:120-data_len+1+len-1);
                    break;
                end
            end
        end
        if flag==1
            %tempdata = encrypt_block_code{1,i};    
            if current_bit-1+data_len<len
                hiden_length_total(current_bit:current_bit+data_len-1)=encrypt_block_code{1,i}(120-data_len+1:120);
            else
                res=len-(current_bit-1);
                hiden_length_total(current_bit:current_bit+res-1)=encrypt_block_code{1,i}(120-data_len+1:120-data_len+1+res-1); % �����ݳ��ȵĺ��濪ʼǶ�롣��������***�� *ΪǶ��Ĳ��֣������ҡ�
                break;
            end
             
            current_bit=current_bit+data_len;
        end
    end
end


hiden_data_len=bin2dec(char((hiden_length_total)+48));
hiden_data_len=hiden_data_len+1;
len=hiden_data_len+21; %��ȡ��Ƕ�����ݵĳ���


%% ��ȡ���ݣ����ȣ�21λ��+���ݣ�hiden_data_len��
current_p=1;
current_bit=1;
flag=0;
for i=1:BlockNumber

    encrypt_block_code{1,i}=double(encrypt_block_code{1,i});
    LSB=encrypt_block_code{1,i}(128);
    if LSB==1 % LSB=1����blcok����Ƕ�룬����0����Ƕ�롣
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
                hiden_total(current_bit:current_bit+res-1)=encrypt_block_code{1,i}(120-data_len+1:120-data_len+1+res-1); % y����LSB����󲿷�Ƕ���ڴ˿�ĺ󲿣��������ݴӿ�Ŀ�Ƕ�벿��ͷ��ʼ
                current_bit=current_bit+res;
                flag=1; %current_p ����ʹ�ã�����������if
                continue;
                else
                    hiden_total(current_bit:current_bit+len-1)=encrypt_block_code{1,i}(120-data_len+1:120-data_len+1+len-1); % ���ݴӿ�Ƕ�벿�ֵ�ͷ����ʼ
                    break;
                end
            end
        end
        if flag==1
            tempdata = encrypt_block_code{1,i};    
            if current_bit-1+data_len<len
                hiden_total(current_bit:current_bit+data_len-1)=tempdata(120-data_len+1:120);
            else
                res=len-(current_bit-1);
                hiden_total(current_bit:current_bit+res-1)=tempdata(120-res+1:120); % �����ݳ��ȵĺ��濪ʼ��ȡ����������***�� *ΪǶ��Ĳ��֣������ҡ�
                break;
            end
             
            current_bit=current_bit+data_len;
        end
    end
end
len=length(hiden_total); 
hidendata_extract=hiden_total(22:len); % ǰ21λΪ���ݵĳ���

%% ������������key ��ȡǶ�������
key=DH_Key;
RandStream.setGlobalStream ... 
     (RandStream('mt19937ar','seed',key));
hidendata_len=length(hidendata_extract);
permuteDataNo=randperm(hidendata_len); % ��data ����Ž�������
DataValue=zeros(1,hidendata_len); % permuteDataValueΪ������������key����֮���data��ֵ
for i=1:hidendata_len
    DataValue(permuteDataNo(i))=hidendata_extract(i);
end 
hidendata_extract_final=DataValue;
